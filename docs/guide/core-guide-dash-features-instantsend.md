# InstantSend

Dash Core's <<glossary:InstantSend>> feature provides a way to lock transaction <<glossary:inputs>> and enable secure, instantaneous <<glossary:transactions>>. The <<glossary:network>> automatically attempts to upgrade any qualifying transaction to InstantSend without a need for the sending <<glossary:wallet>> to explicitly request it.

* To qualify for InstantSend, each transaction input must meet at least one of the following criteria:
  * Be locked by InstantSend
  * Be in a block that has a <<glossary:ChainLock>>
  * Have at least the number <<glossary:confirmations>> (block depth) indicated by the table below

| **Network** | **Confirmations Required** |
| --- | --- |
| Mainnet | 6 Blocks (normal transactions)<br>**100 Blocks (mining/masternode rewards)** |
| Testnet / Regtest / Devnet | 2 Blocks |

> 📘 Transition to Deterministic InstantSend lock
>
> Protocol version 70220 implements [DIP22](https://github.com/dashpay/dips/blob/master/dip-0022.md) which adds the `isdlock` message as a replacement for the `islock` message. Once the transition is complete, the `islock` message will be deprecated.

The introduction of the <<glossary:Long-Living Masternode Quorum>> feature in Dash Core 0.14 provided a foundation to scale InstantSend. The transaction input locking process (and resulting network traffic) now occurs only within the quorum. This minimizes network congestion since only the [`islock` message](../ref/core-ref-p2p-network-instantsend-messages.md#islock) or [`isdlock` message](../ref/core-ref-p2p-network-instantsend-messages.md#isdlock) produced by the locking process is relayed to the entire Dash network. This message contains all the information necessary to verify a successful transaction lock.

## Management via Spork

Spork 2 (`SPORK_2_INSTANTSEND_ENABLED`) is used to manage InstantSend. <<glossary:Spork>> 2 enables or disables the entire InstantSend feature. As of Dash Core 0.17.0, it also can be used to limit locking to transactions found in blocks. 

In the event of a sustained overload of InstantSend, the spork can be set to a value of `1`. This mode enables a clean transition to fully disabling InstantSend without interfering with ChainLocks. In this mode masternodes will stop creating locks for new transactions when they enter the mempool and will only lock them once mined into a block. Once all existing locked transactions are mined into blocks, InstantSend can then be disabled by setting the spork value to `0` without disrupting ChainLocks.

## Mining Considerations

Note: A transaction will __not__ be included in the block template (from the [`getblocktemplate` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate)) unless it:

 1. Has been locked, or 
 2. Has been in the mempool for >=10 minutes (`WAIT_FOR_ISLOCK_TIMEOUT`)

A <<glossary:miner>> may still include any transaction, but <<glossary:blocks>> containing only locked transactions (or ones older than the timeout) should achieve a ChainLock faster. This is desirable to miners since it prevents any blockchain reorganizations that might orphan their block.

## InstantSend Data Flow

| **InstantSend Client** | **Direction**  | **Peers**   | **Description** |
| --- | :---: | --- | --- |
| [`tx` message](../ref/core-ref-p2p-network-data-messages.md#tx)                | → |                         | Client sends InstantSend transaction
| **LLMQ Signing Sessions**   |   |                         | Quorums internally process locking |
|                             |   |                         | Quorum(s) responsible for the transaction's inputs lock the inputs via LLMQ signing sessions
|                             |   |                         | Once all inputs are locked, the quorum responsible for the overall transaction creates the transaction lock (`islock` or `isdlock`) via an LLMQ signing session
| **LLMQ Results**             |   |                         | Quorum results broadcast to the network |
|                             | ← | [`inv` message](../ref/core-ref-p2p-network-data-messages.md#inv) (islock or isdlock)  | Quorum responds with lock inventory
| [`getdata` message](../ref/core-ref-p2p-network-data-messages.md#getdata) (islock or isdlock)  | → |                         | Client requests lock message
|                             | ← | [`islock` message](../ref/core-ref-p2p-network-instantsend-messages.md#islock) or [`isdlock` message](../ref/core-ref-p2p-network-instantsend-messages.md#isdlock)        | Quorum responds with lock message

Once a transaction lock is approved, the `instantlock` field of various RPCs is set to `true` (e.g. the [`getmempoolentry` RPC](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempoolentry)).