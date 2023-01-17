# Mining RPCs

## GetBlockTemplate

The [`getblocktemplate` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate) gets a block template or proposal for use with mining software. For more
information, please see the following resources:

* [Bitcoin Wiki GetBlockTemplate](https://en.bitcoin.it/wiki/Getblocktemplate)
* [BIP22](https://github.com/bitcoin/bips/blob/master/bip-0022.mediawiki)
* [BIP23](https://github.com/bitcoin/bips/blob/master/bip-0023.mediawiki)

*Parameter #1---a JSON request object*

Name | Type | Presence | Description
--- | --- | --- | ---
Request | object | Optional<br>(exactly 1) | A JSON request object
→<br>`mode` | string | Optional<br>(exactly 1) | This must be set to \template\" or omitted"
→<br>`capabilities` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Capability | string | Optional<br>(exactly 1) | Client side supported feature, `longpoll`, `coinbasetxn`, `coinbasevalue`, `proposal`, `serverlist`, `workid`
→<br>`rules` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Rules | string | Optional<br>(exactly 1) | Client side supported softfork deployment, `csv`, `dip0001`, etc.

*Result---block template*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing a block template
→<br>`capabilities` | array (string) | Required<br>(1 or more) | The client side supported features
→ →<br>Capability | string | Optional<br>(0 or more) | A client side supported feature
→<br>`version` | number (int) | Required<br>(exactly 1) | The block version
→<br>`rules` | array (string) | Required<br>(1 or more) | The specific block rules that are to be enforced
→ →<br>Block Rule | string | Optional<br>(0 or more) | A specific block rule to be enforced
→<br>`vbavailable` | object | Required<br>(exactly 1) | Contains the set of pending, supported versionbit (BIP 9) softfork deployments
→ →<br>Bit Number | number | Required<br>(0 or more) | The bit number the named softfork rule
→<br>`vbrequired` | number | Required<br>(exactly 1) | The bit mask of versionbits the server requires set in submissions
→<br>`previousblockhash` | string (hex) | Required<br>(exactly 1) | The hash of current highest block
→<br>`transactions` | array (objects) | Optional<br>(0 or more) | Non-coinbase transactions to be included in the next block
→ →<br>Transaction | object | Optional<br>(0 or more) | Non-coinbase transaction
→ → →<br>`data` | string (hex) | Optional<br>(0 or more) | Transaction data encoded in hex (byte-for-byte)
→ → →<br>`hash` | string (hex) | Optional<br>(0 or more) | The hash/id encoded in little-endian hex
→ → →<br>`depends` | array (numbers) | Required<br>(0 or more) | An array holding TXIDs of unconfirmed transactions this TX depends upon (parent transactions).
→ → → →<br>Transaction number | number | Optional<br>(1 or more) | Transactions before this one (by 1-based index in `transactions` list) that must be present in the final block if this one is
→ → →<br>`fee` | number | Required<br>(exactly 1) | The difference in value between transaction inputs and outputs (in duffs). For coinbase transactions, this is a negative number of the total collected block fees (ie., not including the block subsidy); if key is not present, fee is unknown and clients MUST NOT assume there isn't one
→ → →<br>`sigops` | number | Required<br>(exactly 1) | Total SigOps. If not present, the count is unknown (clients MUST NOT assume there aren't any)
→<br>`coinbaseaux` | object | Required<br>(exactly 1) | A object containing data that should be included in the coinbase scriptSig content
→ →<br>~~Flags~~ | ~~string~~ | ~~Required<br>(0 or more)~~ | **Removed in Dash Core 18.0.0**
→<br>`coinbasevalue` | number | Required<br>(exactly 1) | The maximum allowable input to coinbase transaction, including the generation award and transaction fees (in duffs)
→<br>`coinbasetxn` | object | Required<br>(exactly 1) | Information for the coinbase transaction)
→<br>`target` | string | Required<br>(exactly 1) | The hash target
→<br>`mintime` | number | Required<br>(exactly 1) | The minimum timestamp appropriate for next block time in seconds since epoch
→<br>`mutable` | array (string) | Required<br>(exactly 1) | The list of ways the block template may be changed
→ →<br>Value | string | Required<br>(0 or more) | A way the block template may be changed, e.g. 'time', 'transactions', 'prevblock'
→<br>`noncerange` | string | Required<br>(exactly 1) | A range of valid nonces
→<br>`sigoplimit` | number | Required<br>(exactly 1) | The limit of sigops in blocks
→<br>`sizelimit` | number | Required<br>(exactly 1) | The limit of block size
→<br>`curtime` | number | Required<br>(exactly 1) | The current timestamp in seconds since epoch
→<br>`bits` | string | Required<br>(exactly 1) | The compressed target of next block
→<br>`previousbits` | string | Required<br>(exactly 1) | The compressed target of  the current highest block
→<br>`height` | number | Required<br>(exactly 1) | The height of the next block
→<br>`masternode` | array (objects) | Required<br>(0 or more) | Required masternode payments that must be included in the next block
→ →<br>Masternode Payee | object | Optional<br>(0 or more) | Object containing a masternode payee's information  
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`masternode_payments_started` | boolean | Required<br>(exactly 1) | True if masternode payments started
→<br>`masternode_payments_enforced` | boolean | Required<br>(exactly 1) | True if masternode payments enforced
→<br>`superblock` | array (objects) | Required<br>(0 or more) | The superblock payees that must be included in the next block
→ →<br>Superblock Payee | object | Optional<br>(0 or more) | Object containing a superblock payee's information
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`superblocks_started` | boolean | Required<br>(exactly 1) | True if superblock payments started
→<br>`superblocks_enabled` | boolean | Required<br>(exactly 1) | True if superblock payments enabled
→<br>`coinbase_payload` | string | Required<br>(exactly 1) | _Added in Dash Core 0.13.0_<br><br>Coinbase transaction payload data encoded in hexadecimal

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet getblocktemplate
```

Result:

```json
{
  "capabilities": [
    "proposal"
  ],
  "version": 536870912,
  "rules": [
    "csv",
    "dip0001",
    "bip147",
    "dip0003",
    "dip0008",
    "realloc",
    "dip0020"
  ],
  "vbavailable": {
  },
  "vbrequired": 0,
  "previousblockhash": "000000612b3901d75819eafc070a3fe34a3be6a36304b4f63d0190cf32cc15ac",
  "transactions": [
  ],
  "coinbaseaux": {
  },
  "coinbasevalue": 1940051022,
  "longpollid": "000000612b3901d75819eafc070a3fe34a3be6a36304b4f63d0190cf32cc15ac162",
  "target": "0000013457000000000000000000000000000000000000000000000000000000",
  "mintime": 1635875970,
  "mutable": [
    "time",
    "transactions",
    "prevblock"
  ],
  "noncerange": "00000000ffffffff",
  "sigoplimit": 40000,
  "sizelimit": 2000000,
  "curtime": 1635876520,
  "bits": "1e013457",
  "previousbits": "1e015585",
  "height": 605717,
  "masternode": [
    {
      "payee": "yS25k3aNPBtfqcgyHeEvHtDCRT9iKodHM1",
      "script": "76a9143e881097549033c40e7373879a7d4331de81778188ac",
      "amount": 1164030613
    }
  ],
  "masternode_payments_started": true,
  "masternode_payments_enforced": true,
  "superblock": [
  ],
  "superblocks_started": true,
  "superblocks_enabled": true,
  "coinbase_payload": "0200153e0900cd6b7602392887e14063cb5ed5defe8cc877e329a55defd903b6d2261a8f07d15b462a37ff25db05accea8928a5f8a3e65ca99266dc13ba98884f799680e0725"
}
```

*See also*

* [GetMiningInfo](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getmininginfo): returns various mining-related information.
* [SubmitBlock](../api-ref/core-api-ref-remote-procedure-calls-mining.md#submitblock): accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.
* [PrioritiseTransaction](../api-ref/core-api-ref-remote-procedure-calls-mining.md#prioritisetransaction): adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

## GetMiningInfo

The [`getmininginfo` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getmininginfo) returns various mining-related information.

*Parameters: none*

*Result---various mining-related information*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Various mining-related information
→<br>`blocks` | number (int) | Required<br>(exactly 1) | The height of the highest block on the local best block chain
→<br>`currentblocksize` | number (int) | Optional<br>(0 or 1) | If generation was enabled since the last time this node was restarted, this is the size in bytes of the last block built by this node for header hash checking.
→<br>`currentblocktx` | number (int) | Optional<br>(0 or 1) | If generation was enabled since the last time this node was restarted, this is the number of transactions in the last block built by this node for header hash checking. 
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | If generation was enabled since the last time this node was restarted, this is the difficulty of the highest-height block in the local best block chain.  Otherwise, this is the value `0`
→<br>`networkhashps` | number (int) | Required<br>(exactly 1) | An estimate of the number of hashes per second the network is generating to maintain the current difficulty.  See the [`getnetworkhashps` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getnetworkhashps) for configurable access to this data
→<br>`pooledtx` | number (int) | Required<br>(exactly 1) | The number of transactions in the memory pool
→<br>`chain` | string | Required<br>(exactly 1) | Set to `main` for mainnet, `test` for testnet, and `regtest` for regtest
→<br>`warnings` | string | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br><br>Any network or blockchain warnings
→<br>`errors` | string | Optional<br>(0 or 1) | **Removed in Dash Core 0.17.0**<br><br>Only shown when dashd is started with `-deprecatedrpc=getmininginfo`

*Example from Dash Core 18.0.0*

```bash
dash-cli getmininginfo
```

Result:

```json
{
  "blocks": 292979,
  "difficulty": 0.0002441371325370145,
  "networkhashps": 3805.856874962192,
  "pooledtx": 0,
  "chain": "test",
  "warnings": "Warning: unknown new rules activated (versionbit 3)"
}
```

*See also*

* [GetMemPoolInfo](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getmempoolinfo): returns information about the node's current transaction memory pool.
* [GetRawMemPool](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## GetNetworkHashPS

The [`getnetworkhashps` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getnetworkhashps) returns the estimated network hashes per second based on the last n blocks.

*Parameter #1---number of blocks to average*

Name | Type | Presence | Description
--- | --- | --- | ---
`blocks` | number (int) | Optional<br>(0 or 1) | The number of blocks to average together for calculating the estimated hashes per second.  Default is `120`.  Use `-1` to average all blocks produced since the last difficulty change

*Parameter #2---block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | number (int) | Optional<br>(0 or 1) | The height of the last block to use for calculating the average.  Defaults to `-1` for the highest-height block on the local best block chain.  If the specified height is higher than the highest block on the local best block chain, it will be interpreted the same as `-1`

*Result---estimated hashes per second*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The estimated number of hashes per second based on the parameters provided.  May be 0 (for Height=`0`, the genesis block) or a negative value if the highest-height block averaged has a block header time earlier than the lowest-height block averaged

*Example from Dash Core 0.12.2*

Get the average hashes per second for all the blocks since the last
difficulty change before block 6000.

```bash
dash-cli -testnet getnetworkhashps -1 6000
```

Result:

```text
22214011.90821117
```

*See also*

* [GetDifficulty](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getdifficulty): returns the proof-of-work difficulty as a multiple of the minimum difficulty.
* [GetBlock](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.

## PrioritiseTransaction

The [`prioritisetransaction` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#prioritisetransaction) adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

*Parameter #1---the TXID of the transaction to modify*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string | Required<br>(exactly 1) | The TXID of the transaction whose virtual priority or fee you want to modify, encoded as hex in RPC byte order

*Parameter #2---the change to make to the virtual fee*

Name | Type | Presence | Description
--- | --- | --- | ---
Fee | number (int) | Required<br>(exactly 1) | **Warning:** this value is in duffs, not Dash<br><br>If positive, the virtual fee to add to the actual fee paid by the transaction; if negative, the virtual fee to subtract from the actual fee paid by the transaction.  No change is made to the actual fee paid by the transaction

*Result---`true` if the priority is changed*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool (true only) | Required<br>(exactly 1) | Always set to `true` if all three parameters are provided.  Will not return an error if the TXID is not in the memory pool.  If fewer or more than three arguments are provided, or if something goes wrong, will be set to `null`

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet prioritisetransaction \
    f86c74f27fdd9c7e618d69b3606eeae1710b3f02fabede6ae8c88dd7bb756942 \
    456789
```

Result:

```json
true
```

*See also*

* [GetRawMemPool](../api-ref/core-api-ref-remote-procedure-calls-blockchain.md#getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## SubmitBlock

The [`submitblock` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#submitblock) accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.

*Parameter #1---the new block in serialized block format as hex*

Name | Type | Presence | Description
--- | --- | --- | ---
Block | string (hex) | Required<br>(exactly 1) | The full block to submit in serialized block format as hex

*Parameter #2---dummy value*

Name | Type | Presence | Description
--- | --- | --- | ---
`dummy` | object | Optional<br>(0 or 1) | A dummy value for compatibility with BIP22. This value is ignored.

*Result---`null` or error string*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null/string | Required<br>(exactly 1) | If the block submission succeeded, set to JSON `null`.  If submission failed, set to one of the following strings: `duplicate`, `duplicate-invalid`, `inconclusive`, or `rejected`.  The JSON-RPC `error` field will still be set to `null` if submission failed for one of these reasons

*Example from Dash Core 0.15.0*

Submit the following block with the a dummy value, "test".

```bash
dash-cli -testnet submitblock 0100002032e3965d5fdd7a883209d516599337eb4cb82f\
  7aea22ecc114942c1f00000000244388a3bd2c38a85bf337755a1a165d0df2b335e3886058\
  40e08a3cdf1ce1a4297ede598f6a011d027c1c300201000000010000000000000000000000\
  000000000000000000000000000000000000000000ffffffff1202791f0e2f5032506f6f6c\
  2d74444153482fffffffff044d75bb8b010000001976a914d4a5ea2641e9dd37f7a5ad5c92\
  9df4743518769188acac2ea68f010000001976a9148d0934de58f969df3b53a72b4f47211d\
  890ebf5588ac68b9ea03000000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b9\
  80e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d\
  7281bdc9430f35ac00000000000000002a6a28f47e935509fc85533dc78197e93e87d1c793\
  43bda495429d8e3680069f6a22780000000002000000000000000100000001078e0c77e3b0\
  4323d0834841f965543aaae2b275f684f55fbaf22e1c83bff97e010000006a473044022077\
  6e96d202cc4f50f79d269d7cd36712c7486282dda0cb6eae583c916c98b34c022070941efb\
  3201cf500cc6b879d6570fc477d4c3e6a8d91286e84465235f542c42012102dddbfc3fe06b\
  96e3a36f3e815222cd1cb9586b3193c4a0de030477f621956d51feffffff02a00bd1000000\
  00001976a914d7b47d4b40a23c389f5a17754d7f60f511c7d0ec88ac316168821300000019\
  76a914c9190e507834b78a624d7578f1ad3819592ca1aa88ac771f0000 \
  "test"
```

Result (the block above was already on a local block chain):

```text
duplicate
```

*See also*

* [GetBlockTemplate](../api-ref/core-api-ref-remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## SubmitHeader

The [`submitheader` RPC](../api-ref/core-api-ref-remote-procedure-calls-mining.md#submitheader) decodes the given hexdata as a header and submits it as a candidate chain tip if valid. 
If invalid, it  throws.

*Parameter #1---hexdata*

Name | Type | Presence | Description
--- | --- | --- | ---
hexdata | string (hex) | Required<br>(exactly 1) | The block header data

*Result---`None`*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | None | Not Required<br> | N/A

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet submitheader 0000002037f7981be497c71524bb9f7454d80b1448f46b6f99c3cadfee4367f0c201000007a95ed6e4d19efa99f33c93b45ee2eab5b5a0ef230ac9c03ecc8a3b5ef8938f5b1978614745021ed6cb0000
```

Result:
```
null
```

*See also: none*