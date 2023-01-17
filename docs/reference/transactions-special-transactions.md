# Special Transactions

The <<glossary:Special Transactions>> framework established by [DIP2](https://github.com/dashpay/dips/blob/master/dip-0002.md) enabled the implementation of new on-chain features and <<glossary:consensus>> mechanisms. These transactions provide the flexibility to expand beyond the financial uses of classical transactions. DIP2 transactions modified classical transactions by:

1. Splitting the 32 bit `version` field into two 16 bit fields (`version` and `type`)
2. Adding support for a generic extra payload following the `lock_time` field. The maximum allowed size for a transaction version 3 extra payload is 10000 bytes (`MAX_TX_EXTRA_PAYLOAD`).

Classical (financial) transactions have a `type` of 0 while special transactions have a `type` defined in the DIP describing them. A list of current special transaction types is maintained in the [DIP repository](https://github.com/dashpay/dips/blob/master/dip-0002-special-transactions.md).

**Implemented Special Transactions**

| Release | Tx Version | Tx Type | Payload JSON | Tx Purpose | Payload | Payload Size |
| - | - | - | - | - | - | - |
| 0.12.3 | 2 | - | n/a | n/a | n/a |
| 0.13.0 | 3 | 0 | n/a | Standard (Classical) Transaction |  n/a | n/a |
| 0.13.0 | 3 | 1 | [ProRegTx](#proregtx) | Masternode Registration | hex | compactSize uint |
| 0.13.0 | 3 | 2 | [ProUpServTx](#proupservtx) | Update Masternode Service | hex | compactSize uint |
| 0.13.0 | 3 | 3 | [ProUpRegTx](#proupregtx) | Update Masternode Operator | hex | compactSize uint |
| 0.13.0 | 3 | 4 | [ProUpRevTx](#prouprevtx) | Masternode Operator Revocation | hex | compactSize uint |
| 0.13.0 | 3 | 5 | [CbTx](#cbtx) | Masternode List Merkle Proof | hex | compactSize uint |
| 0.13.0 | 3 | 6 | [QcTx](#qctx) | Long-Living Masternode Quorum Commitment | hex | compactSize uint |
| 18.0.0 | 3 | 7 | [MnHfTx](#mnhftx) | Masternode hard fork signal | hex |  |

## ProRegTx

*Added in protocol version 70213 of Dash Core as described by [DIP3](https://github.com/dashpay/dips/blob/master/dip-0003.md)*

The <<glossary:masternode>> Registration (ProRegTx) special transaction is used to join the masternode list by proving ownership of the 1000 DASH necessary to create a masternode.

A ProRegTx is created and sent using the [`protx` RPC](../api-ref/core-api-ref-remote-procedure-calls-evo.md#protx). The ProRegTx must either include an <<glossary:output>> with 1000 DASH (`protx register`) or refer to an existing unspent output holding 1000 DASH (`protx fund_register`). If the 1000 DASH is an output of the ProRegTx, the collateralOutpoint hash field should be null.

The special transaction type is 1 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | Provider transaction version number. Currently set to 1.
| 2 | type | uint_16 | Masternode type. Default set to 0.
| 2 | mode | uint_16 | Masternode mode. Default set to 0.
| 36 | collateralOutpoint | COutpoint | The collateral outpoint.<br>**Note:** The hash will be null if the collateral is part of this transaction, otherwise it will reference an existing collateral.
| 16 | ipAddress | byte[] | IPv6 address in network byte order. Only IPv4 mapped addresses are allowed (to be extended in the future)
| 2 | port | uint_16 | Port (network byte order)
| 20 | KeyIdOwner | CKeyID | The public key hash used for owner related signing (ProTx updates, governance voting)
| 48 | PubKeyOperator | CBLSPublicKey | The BLS public key used for operational related signing (network messages, ProTx updates)
| 20 | KeyIdVoting | CKeyID | The public key hash used for voting.
| 2 | operatorReward | uint_16 | A value from 0 to 10000.
| 1-9 | scriptPayoutSize | compactSize uint | Size of the Payee Script.
| Variable | scriptPayout | Script | Payee script (p2pkh/p2sh)
| 32 | inputsHash | uint256 | Hash of all the outpoints of the transaction inputs
| 1-9 | payloadSigSize |compactSize uint | Size of the Signature
| Variable | payloadSig | vector | Signature of the hash of the ProTx fields. Signed with the key corresponding to the collateral outpoint in case the collateral is not part of the ProRegTx itself, empty otherwise.

The following annotated hexdump shows a ProRegTx transaction referencing an existing collateral. (Parts of the classical transaction section have been omitted.)

``` text
0300 ....................................... Version (3)
0100 ....................................... Type (1 - ProRegTx)

[...] ...................................... Transaction inputs omitted
[...] ...................................... Transaction outputs omitted

00000000 ................................... locktime: 0 (a block height)

fd1201 ..................................... Extra payload size (274)

ProRegTx Payload
| 0100 ..................................... Version (1)
| 0000 ..................................... Type (0)
| 0000 ..................................... Mode (0)
|
| 4859747b0eb19bb2dae5a12ef7b6a69b
| 03712bfeded1174de0b6ab1334ab2e8b ......... Outpoint TXID
| 01000000 ................................. Outpoint index number: 1
|
| 00000000000000000000ffffc0000233 ......... IP Address: ::ffff:192.0.2.51
| 270f ..................................... Port: 9999
|
|
| 1636e84d02310b0b458f3eb51d8ea8b2e684b7ce . Owner pubkey hash (ECDSA)
| 88d719278eef605d9c19037366910b59bc28d437
| de4a8db4d76fda6d6985dbdf10404fb9bb5cd0e8
| c22f4a914a6c5566 ......................... Operator public key (BLS)
| 1636e84d02310b0b458f3eb51d8ea8b2e684b7ce . Voting pubkey hash (ECDSA)
|
| f401 ..................................... Operator reward (500 -> 5%)
|
| Payout script
| 19 ....................................... Bytes in pubkey script: 25
| | 76 ..................................... OP_DUP
| | a9 ..................................... OP_HASH160
| | 14 ..................................... Push 20 bytes as data
| | | fc136008111fcc7a05be6cec66f97568
| | | 727a9e51 ............................. PubKey hash
| | 88 ..................................... OP_EQUALVERIFY
| | ac ..................................... OP_CHECKSIG
|
| 0fcfb7d939078ba6a6b81ecf1dc2e05d
| e2776f49f7b503ac254798be6a672699 ......... Inputs hash
|
| Payload signature
| 41 ....................................... Signature Size (65)
| 200476f193b465764093014ba44bd4ff
| de2b3fc92794c4acda9cad6305ca172e
| 9e3d6b1cd6e30f86678dae8e6595e53d
| 2b30bc32141b6c0151eb58479121b3e6a4 ....... Signature
```

The following annotated hexdump shows a ProRegTx transaction creating a new collateral.

**Note the presence of the output, a null Outpoint TXID and the absence of a signature (since it isn't referring to an existing collateral).** (Parts of the classical transaction section have been omitted.)

``` text
0300 ....................................... Version (3)
0100 ....................................... Type (1 - ProRegTx)

[...] ...................................... Transaction inputs omitted

02 ......................................... Number of outputs
| [...] .................................... 1 output omitted
|
| Masternode collateral output
| | 00e8764817000000 ....................... Duffs (1000 DASH)
| | 1976a9149e648c7e4b61482aa3
| | 9bd10e0bf0b5268768005f88ac ............. Script

00000000 ................................... locktime: 0 (a block height)

d1 ......................................... Extra payload size (209)

ProRegTx Payload
| 0100 ..................................... Version (1)
| 0000 ..................................... Type (0)
| 0000 ..................................... Mode (0)
|
| 00000000000000000000000000000000
| 00000000000000000000000000000000 ......... Outpoint TXID
| 01000000 ................................. Outpoint index number: 1
|
| 00000000000000000000ffffc0000233 ......... IP Address: ::ffff:192.0.2.51
| 270f ..................................... Port: 9999
|
| 757a2171bbf92517e358249f20c37a8ad2d7a5bc . Owner pubkey hash (ECDSA)
| 0e02146e9c34cfbcb3f3037574a1abb35525e2ca
| 0c3c6901dbf82ac591e30218d1711223b7ca956e
| df39f3d984d06d51 ......................... Operator public key (BLS)
| 757a2171bbf92517e358249f20c37a8ad2d7a5bc . Voting pubkey hash (ECDSA)
|
| f401 ..................................... Operator reward (500 -> 5%)
|
| Payout script
| 19 ....................................... Bytes in pubkey script: 25
| | 76 ..................................... OP_DUP
| | a9 ..................................... OP_HASH160
| | 14 ..................................... Push 20 bytes as data
| | | 9e648c7e4b61482aa39bd10e0bf0b526
| | | 8768005f ............................. PubKey hash
| | 88 ..................................... OP_EQUALVERIFY
| | ac ..................................... OP_CHECKSIG
|
| 57b115d681b9aff82824ff7e22af99d4
| ac4b39ad7be7cb70b662e9011827d589 ......... Inputs hash
|
| Payload signature
| 00 ....................................... Signature Size (0)
| .......................................... Signature (Empty)
```

## ProUpServTx

*Added in protocol version 70213 of Dash Core as described by [DIP3](https://github.com/dashpay/dips/blob/master/dip-0003.md)*

The <<glossary:masternode>> Provider Update Service (ProUpServTx) special transaction is used to update the IP Address and port of a masternode. If a non-zero operatorReward was set in the initial [ProRegTx](#proregtx), the operator may also set the scriptOperatorPayout field in the ProUpServTx.

A ProUpServTx is only valid for masternodes in the registered masternodes subset. When processed, it updates the metadata of the masternode entry and revives the masternode if it was previously marked as PoSe-banned.

A ProUpServTx is created and sent using the [`protx update_service` RPC](../api-ref/core-api-ref-remote-procedure-calls-evo.md#protx-update-service).

The special transaction type used for ProUpServTx Transactions is 2 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | ProUpServTx version number. Currently set to 1.
| 32 | proTXHash | uint256 | The hash of the initial ProRegTx
| 16 | ipAddress | byte[] | IPv6 address in network byte order. Only IPv4 mapped addresses are allowed (to be extended in the future)
| 2 | port | uint_16 | Port (network byte order)
| 1-9 | scriptOperator<br>PayoutSize | compactSize uint | Size of the Operator Payee Script.
| Variable | scriptOperator<br>Payout | Script | Operator Payee script (p2pkh/p2sh)
| 32 | inputsHash | uint256 | Hash of all the outpoints of the transaction inputs
| 1-9 | payloadSigSize |compactSize uint | Size of the Signature<br>**Note:** not present in BLS implementation
| 96 | payloadSig | vector | BLS Signature of the hash of the ProUpServTx fields. Signed by the Operator.

The following annotated hexdump shows a ProUpServTx transaction. (Parts of the
classical transaction section have been omitted.)

``` text
0300 ....................................... Version (3)
0200 ....................................... Type (2 - ProUpServTx)

[...] ...................................... Transaction inputs omitted
[...] ...................................... Transaction outputs omitted

00000000 ................................... locktime: 0 (a block height)

b5 ......................................... Extra payload size (181)

ProUpServTx Payload
| 0100 ..................................... Version (1)
|
| db60b8cecae691a3d078a2341d460b06
| b2914f6b092f1906b5c815589399b0ff ......... ProRegTx Hash
|
| 00000000000000000000ffffc0000233 ......... IP Address: ::ffff:192.0.2.51
| 270f ..................................... Port: 9999
|
| 00 ....................................... Operator payout script size (0)
| .......................................... Operator payout script (Empty)
|
| a9569d037b0eacc8bca05c5829c95283
| 4ac27d1c7e7df610500b7ba70fd46507 ......... Inputs hash
|
| Payload signature (BLS)
| 0267702ef85d186ef7fa32dc40c65f2f
| eca0a7465715eb7c30f81beb69e35ee4
| 1f6ff7f292b82a9caebb5aa961b0f915
| 02501becf629e93c0a01c76162d56a6c
| 65a9675c3ca9d5297f053e68f91393dd
| 789beed8ef7e8839695a334c2e1bd37c ......... BLS Signature (96 bytes)
```

## ProUpRegTx

*Added in protocol version 70213 of Dash Core as described by [DIP3](https://github.com/dashpay/dips/blob/master/dip-0003.md)*

The <<glossary:masternode>> Provider Update Registrar (ProUpRegTx) special transaction is used by a masternode owner to update masternode metadata (e.g. operator/voting key details or the payout script).

A ProUpRegTx is created and sent using the [`protx update_registrar` RPC](../api-ref/core-api-ref-remote-procedure-calls-evo.md#protx-update-registrar).

The special transaction type is 3 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | Provider update registrar transaction version number. Currently set to 1.
| 32 | proTXHash | uint256 | The hash of the initial ProRegTx
| 2 | mode | uint_16 | Masternode mode. Default set to 0.
| 48 | PubKeyOperator | CBLSPublicKey | The BLS public key used for operational related signing (network messages, ProTx updates)
| 20 | KeyIdVoting | CKeyID | The public key hash used for voting.
| 1-9 | scriptPayoutSize | compactSize uint | Size of the Payee Script.
| Variable | scriptPayout | Script | Payee script (p2pkh/p2sh)
| 32 | inputsHash | uint256 | Hash of all the outpoints of the transaction inputs
| 1-9 | payloadSigSize |compactSize uint | Size of the Signature
| Variable | payloadSig | vector | Signature of the hash of the ProTx fields. Signed with the key corresponding to the collateral outpoint in case the collateral is not part of the ProRegTx itself, empty otherwise.

The following annotated hexdump shows a ProUpRegTx transaction referencing an
existing collateral. (Parts of the classical transaction section have been omitted.)

``` text
0300 ....................................... Version (3)
0300 ....................................... Type (3 - ProUpRegTx)

[...] ...................................... Transaction inputs omitted
[...] ...................................... Transaction outputs omitted

00000000 ................................... locktime: 0 (a block height)

e4 ......................................... Extra payload size (228)

ProRegTx Payload
| 0100 ..................................... Version (1)
|
| ddaf13bf1b02de39711de911e646c63e
| f089b6cee786a1b776086ae130331bba ......... ProRegTx Hash
|
| 0000 ..................................... Mode (0)
|
| 0e02146e9c34cfbcb3f3037574a1abb35525e2ca
| 0c3c6901dbf82ac591e30218d1711223b7ca956e
| df39f3d984d06d51 ......................... Operator public key (BLS)
| 757a2171bbf92517e358249f20c37a8ad2d7a5bc . Voting pubkey hash (ECDSA)
|
| Payout script
| 19 ....................................... Bytes in pubkey script: 25
| | 76 ..................................... OP_DUP
| | a9 ..................................... OP_HASH160
| | 14 ..................................... Push 20 bytes as data
| | | 9e648c7e4b61482aa39bd10e0bf0b526
| | | 8768005f ............................. PubKey hash
| | 88 ..................................... OP_EQUALVERIFY
| | ac ..................................... OP_CHECKSIG
|
| 50b50b24193b2b16f0383125c1f4426e
| 883d256eeadee96d500f8c08b0e0f9e4 ......... Inputs hash
|
| Payload signature
| 41 ....................................... Signature Size (65)
| 1ffa8a27ae0301e414176d4c876cff2e
| 20b810683a68ab7dcea95de1f8f36441
| 4c56368f189a3ef7a59b83bd77f22431
| a73d347841a58768b94c771819dc2bbce3 ....... Signature
```

## ProUpRevTx

*Added in protocol version 70213 of Dash Core as described by [DIP3](https://github.com/dashpay/dips/blob/master/dip-0003.md)*

The <<glossary:masternode>> Operator Revocation (ProUpRevTx) special transaction allows an operator to revoke their key in case of compromise or if they wish to terminate service. If a masternode's operator key is revoked, the masternode becomes ineligible for payment until the owner provides a new operator key (via a ProUpRegTx).

A ProUpRevTx is created and sent using the [`protx revoke` RPC](../api-ref/core-api-ref-remote-procedure-calls-evo.md#protx-revoke).

The special transaction type used for ProUpServTx Transactions is 4 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | ProUpRevTx version number. Currently set to 1.
| 32 | proTXHash | uint256 | The hash of the initial ProRegTx
| 2 | reason | uint_16 | The reason for revoking the key.<br>`0` - Not specified<br>`1` - Termination of Service<br>`2` - Compromised Key<br>`3` - Change of key
| 32 | inputsHash | uint256 | Hash of all the outpoints of the transaction inputs
| 1-9 | payloadSigSize |compactSize uint | Size of the Signature<br>**Note:** not present in BLS implementation
| 96 | payloadSig | vector | BLS Signature of the hash of the ProUpServTx fields. Signed by the Operator.

The following annotated hexdump shows a ProUpRevTx transaction. (Parts of the classical transaction section have been omitted.)

``` text
0300 ....................................... Version (3)
0400 ....................................... Type (4 - ProUpRevTx)

[...] ...................................... Transaction inputs omitted
[...] ...................................... Transaction outputs omitted

00000000 ................................... locktime: 0 (a block height)

a4 ......................................... Extra payload size (164)

ProUpRevTx Payload
| 0100 ..................................... Version (1)
|
| ddaf13bf1b02de39711de911e646c63e
| f089b6cee786a1b776086ae130331bba ......... ProRegTx Hash
|
| 0000 ..................................... Reason: 0 (Not specified)
|
| cb0dfe113c87f8e9cde2c5d18aae12fc
| 8d0617c42c34ca5c2f2f6ab4b1dae164 ......... Inputs hash
|
| Payload signature (BLS)
| 0adaef4bf1a904308f1b0efbdfaffc93
| 864f9e047fd83415c831589180303711
| 0f0d8adb312ab43ddd7f8086042d3f5b
| 09029a6a16c341c9d2a62789b495fef4
| e068da711dac28106ff354db7249ae88
| 05877d82ff7d1af00ae2d303dea5eb3b ......... BLS Signature (96 bytes)
```

## CbTx

*Added in protocol version 70213 of Dash Core as described by [DIP4](https://github.com/dashpay/dips/blob/master/dip-0004.md)*

The Coinbase (CbTx) special transaction adds information to the <<glossary:block>> <<glossary:coinbase transaction>> that enables verification of the deterministic masternode list without the full chain (e.g. from <<glossary:SPV>> clients). This allows light-clients to properly verify <<glossary:InstantSend>> transactions and support additional deterministic masternode list functionality in the future.

The special transaction type used for CbTx Transactions is 5 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | CbTx version number. Currently set to 2.
| 4 | height | uint32_t | Height of the block
| 32 | merkleRootMNList | uint256 | Merkle root of the masternode list
| 32 | merkleRootQuorums | uint256 | *Added by CbTx version 2 in v0.14.0*<br><br>Merkle root of currently active LLMQs

Version History

| CbTx Version | First Supported Protocol Version | Dash Core Version |  Notes |
| ---------- | ----------- | -------- | -------- |
| 1 | 70213 | 0.13.0 | Enabled by activation of [DIP3](https://github.com/dashpay/dips/blob/master/dip-0003.md)
| 2 | 70214 | 0.14.0 | Enabled by activation of [DIP8](https://github.com/dashpay/dips/blob/master/dip-0008.md)

The following annotated hexdump shows a CbTx transaction.

An itemized coinbase transaction:

``` text
0300 ....................................... Version (3)
0500 ....................................... Type (5 - Coinbase)

01 ......................................... Number of inputs
| 00000000000000000000000000000000
| 00000000000000000000000000000000 ......... Previous outpoint TXID
| ffffffff ................................. Previous outpoint index
|
| 4c ....................................... Bytes in coinbase: 76
| |
| | 03 ..................................... Bytes in height
| | | 393d01 ............................... Height: 81209
| |
| | 04b9...6d2f ............................ Arbitrary data (truncated)
| 00000000 ................................. Sequence

02 ......................................... Output count
| Transaction Output 1
| | 40230e4300000000 ....................... Duffs (11.25 DASH)
| | 1976a914b7ce0ea9ce2010f58ba4aaa6
| | caa76671c438e89088ac ................... Script
|
| Transaction Output 2
| | 40230e4300000000 ....................... Duffs (11.25 DASH)
| | 1976a91405ea03a6c9dfa67e1837b3c1
| | 4965ba3cb53bce7288ac ................... P2PKH script

00000000 ................................... Locktime

46 ......................................... Extra payload size (38)

Coinbase Transaction Payload
| 0200 ..................................... Version (2)
|
| 393d0100 ................................. Block height: 81209
|
| e2dd012c5b0b1753cef0e32f978917ef
| e7a484c5080b31b4e3f966ccc0e0f8dd ......... MN List merkle root
|
| 2ef709f55fa42cb53d29d75dad77d212
| fb0bd72a47ecfe0e8aa6f660fb96396e ......... Active LLMQ merkle root
```

## QcTx

*Added in protocol version 70213 of Dash Core as described by [DIP6](https://github.com/dashpay/dips/blob/master/dip-0006.md)*

> 🚧 Note
>
> This special transaction has no inputs and no outputs and thus also pays no fee.

The Quorum Commitment (QcTx) special transaction adds the best final commitment from a <<glossary:Long-Living Masternode Quorum>> (LLMQ) Distributed Key Generation (DKG) session to the chain.

Since this special transaction pays no fees, it is mandatory by <<glossary:consensus rules>> to ensure that miners include it. Exactly one quorum commitment transaction MUST be included in every <<glossary:block>> while in the mining phase of the LLMQ process until a valid commitment is present in a block.

If a DKG failed or a <<glossary:miner>> did not receive a final commitment in-time, a null commitment has to be included in the special transaction payload. A null commitment must have the `signers` and `validMembers` bitsets set to the `quorumSize` and all bits set to zero. All other fields must be set to the null representation of the field’s types.

The special transaction type used for Quorum Commitment Transactions is 6 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | Quorum Commitment version number. Currently set to 1. Will change to 2 after Dash Core v18.0 hard fork.
| 4 | height | uint32_t | Height of the block
| Variable | commitment | qfcommit | The payload of the [`qfcommit` message](../ref/core-ref-p2p-network-quorum-messages.md#qfcommit)

The following annotated hexdump shows a QcTx transaction.

An itemized quorum commitment transaction (v1):

``` text
0300 ....................................... Version (3)
0600 ....................................... Type (6 - Quorum Commitment)

00 ......................................... Number of inputs
00 ......................................... Number of outputs

00000000 ................................... Locktime

fd4901 ..................................... Extra payload size (329)

Quorum Commitment Transaction Payload
| 0100 ..................................... Version (1)
|
| 934c0100 ................................. Block height: 85139
|
| Payload from the qfcommit message
| | 0100 ................................... Version (1)
| |
| | 01 ..................................... LLMQ Type (1)
| |
| | 6b2fd2c61cea32d939ee7fe185c7abc5
| | 01aa7001d973379f46b9200500000000 ....... Quorum hash
| |
| | 32 ..................................... Number of signers (50)
| | bfffffffffff03 ......................... Aggregrated signers bitvector
| |
| | 32 ..................................... Number of valid members (50)
| | bfffffffffff03 ......................... Valid members bitvector
| |
| | 9450e90f61a24a4205c92572666ed068
| | 40f617ac11a26d650c88769675e81197
| | 993858d8b695f120f0af7dd38c17a67e ....... Quorum public key (BLS)
| |
| | 912507814fe204c59e14720bc961c09f
| | f88a4fd1f15e9c2efd4e4f112720967d ....... Quorum verification vector hash
| |
| | Quorum threshold signature (BLS)
| | 0281c321090c2d2e59a0d3754dcfbc11
| | d76c26a152b50885d826915af4d95a73
| | 120d0e1ba7e96d89f40252e24109c323
| | 0971dda1f554d331985ca570c76b9a1a
| | ec699ec132838ae097c767d65d0a51d7
| | 017c62e062270b60b854ae912bc07437 ....... BLS Signatures (96 bytes)
| |
| | Aggregated signatures from all commitments (BLS)
| | 91f878a0ae620e2178bff06c3a3967d7
| | 433d4b82e7879bb927dd5cb605423c84
| | 0641fcddf3731da80d0515a172ff3666
| | 0f4eac88ee8fd7779e32e4f0be704078
| | df31601b87b95374cebb4b304afc543e
| | e0d4f461a2ba0e32a711197ca559dacf ....... BLS Signature (96 bytes)
```

## MnHfTx

*Added in protocol version 70222 of Dash Core as described by [DIP23](https://github.com/dashpay/dips/blob/master/dip-0023.md)*

> 🚧 Note
>
> This special transaction has no inputs and no outputs and thus also pays no fee

The Masternode Hard Fork Signal (MnHfTx) special transaction adds the masternode hard fork signal produced by an LLMQ_400_85 quorum to the chain. Since this special transaction pays no fees, it is mandatory by consensus rules to ensure that miners include it. This can be done by any miner in any block, but it should only be included once.

> 📘 Partial implementation in Dash Core 18.0
>
> Dash Core 18.0 only added the special transaction [to prepare for the full implementation](https://github.com/dashpay/dash/issues/4533) of [DIP23](https://github.com/dashpay/dips/blob/master/dip-0023.md) in Dash Core 19.0. The `mnhfsignal` P2P message referenced below is not included in Dash Core 18.0.

The special transaction type used for Quorum Commitment Transactions is 7 and the extra payload consists of the following data:

| Bytes | Name | Data type |  Description |
| ---------- | ----------- | -------- | -------- |
| 2 | version | uint_16 | Quorum Commitment version number. Currently set to 1.
| Variable | commitment | mnhfsignal | The payload of the `mnhfsignal` message (defined in [DIP23](https://github.com/dashpay/dips/blob/master/dip-0023.md#new-system) but not yet implemented)

The following annotated hexdump shows a MnHfTx transaction.

An itemized masternode hard fork signal transaction:

``` text
0300 ....................................... Version (3)
0700 ....................................... Type (7 - Masternode Hard Fork Signal)
<Add example mnhfsignal when available>
```