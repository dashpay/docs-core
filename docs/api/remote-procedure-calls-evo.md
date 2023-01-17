# Evo RPCs

## BLS

*Added in Dash Core 0.13.0*

The [`bls` RPC](../api/remote-procedure-calls-evo.md#bls) provides a set of commands to execute BLS-related actions.

### BLS FromSecret

The `bls fromsecret` RPC parses a BLS secret key and returns the secret/public key pair.

*Parameter #1---secret key*

Name | Type | Presence | Description
--- | --- | --- | ---
`secret` | string (hex) | Required<br>(exactly 1) | The BLS secret key

*Result---the secret/public key pair*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | BLS key pair
→<br>`secret` | string (hex) | Required<br>(exactly 1) | A BLS secret key
→<br>`public` | string (hex) | Required<br>(exactly 1) | A BLS public key

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet bls fromsecret 52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144
```

Result:
```json
{
  "secret": "52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144",
  "public": "885d01d746c3e4d2093b0975de2d8c1f3e5a2c3e8fdaaed929f86fc9fbb278a095248163c101a2456650b415776b7990"
}
```

### BLS Generate

The `bls generate` RPC creates a new BLS secret/public key pair.

*Parameters: none*

*Result---a secret/public key pair*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | BLS key pair
→<br>`secret` | string (hex) | Required<br>(exactly 1) | A BLS secret key
→<br>`public` | string (hex) | Required<br>(exactly 1) | A BLS public key

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet bls generate
```

Result:
```json
{
  "secret": "52f35cd3d977a505485f2474e7e71ef3f60f859603d72ad6b0fa7f7bd163e144",
  "public": "885d01d746c3e4d2093b0975de2d8c1f3e5a2c3e8fdaaed929f86fc9fbb278a095248163c101a2456650b415776b7990"
}
```

*See also: none*

## ProTx

*Added in Dash Core 0.13.0*

The [`protx` RPC](../api/remote-procedure-calls-evo.md#protx) provides a set of commands to execute ProTx related actions.

### ProTx Diff

The `protx diff` RPC calculates a diff and a proof between two masternode list.

*Parameter #1---start block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`baseBlock` | number (int) | Required<br>(Exactly 1) | The starting block height

*Parameter #2---end block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`block` | number (int) | Required<br>(Exactly 1) | The ending block height

*Parameter #3---extended fields*

Name | Type | Presence | Description
--- | --- | --- | ---
`extended` | boolean | Optional<br>(0 or 1) | **Added in Dash Core 18.1.0**<br>Show additional fields (e.g. `payoutAddress`) (default=`false`)


*Result---JSON provider registration transaction details*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred
→<br>`baseBlockHash` | string (hex) | Required<br>(exactly 1) | The hash of the base block as hex in RPC byte order
→<br>`blockHash` | string (hex) | Required<br>(exactly 1) | The hash of the ending block as hex in RPC byte order
→<br>`cbTxMerkleTree` | string (hex) | Required<br>(exactly 1) | The coinbase transaction merkle tree
→<br>`cbTx` | string (hex) | Required<br>(exactly 1) | The coinbase transaction
→<br>`deletedMNs` | array | Required<br>(exactly 1) | An array of deleted masternode hashes
→<br>`mnlist` | array | Required<br>(exactly 1) | An array of masternode details
→ →<br>`proRegTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the initial provider registration transaction as hex in RPC byte order
→ →<br>`confirmedHash` | string (hex) | Required<br>(exactly 1) | The hash of the block where the ProRegTx was mined
→ →<br>`service` | string | Required<br>(exactly 1) | The IP address/Port of the masternode
→ →<br>`pubKeyOperator` | string (hex) | Required<br>(exactly 1) | The operator public key
→ →<br>`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address
→ →<br>`isValid` | bool | Required<br>(exactly 1) | Set to `true` if masternode is valid
→ →<br>`payoutAddress` | string (hex) | Required<br>(exactly 1) | **Added in Dash Core 18.1.0**<br>The owner's payout address
→ →<br>`operatorPayoutAddress` | string (hex) | Required<br>(exactly 1) | **Added in Dash Core 18.1.0**<br>The operator's payout address
→<br>`deletedQuorums` | array | Required<br>(exactly 1) | An array of deleted quorums
→ →<br>`llmqType` | number | Required<br>(exactly 1) | The quorum type
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→<br>`newQuorums` | array | Required<br>(exactly 1) | An array of new quorums
→ →<br>`version` | number | Required<br>(exactly 1) | The quorum version
→ →<br>`llmqType` | number | Required<br>(exactly 1) | The quorum type
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→ →<br>`signersCount` | number | Required<br>(exactly 1) | The number of signers for the quorum
→ →<br>`signers` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br>Bitset representing the aggregated signers of this final commitment
→ →<br>`validMembersCount` | number | Required<br>(exactly 1) | The number of valid members in the quorum
→ →<br>`validMembers` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br>Bitset of valid members in this commitment
→ →<br>`quorumPublicKey` | string (hex) | Required<br>(exactly 1) | The public key of the quorum
→ →<br>`quorumVvecHash` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br>The SHA256 hash of the quorum verification vector
→ →<br>`quorumSig` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br>Recovered threshold signature
→ →<br>`membersSig` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br>Aggregated BLS signatures from all included commitments
→<br>`merkleRootMNList` | string (hex) | Required<br>(exactly 1) | Merkle root of the masternode list
→<br>`merkleRootQuorums` | string (hex) | Optional<br>(0 or 1) | *Added in Coinbase Transaction version 2 (Dash Core 0.14.0)*<br>Merkle root of the masternode list.

*Example from Dash Core 0.16.0*

```bash
dash-cli -testnet protx diff 75000 76000
```

Result (truncated):
```json
{
  "baseBlockHash": "0000000003deb00bba101ee581cdc4e1cbd1243ec5cd190472ae93eff07c8881",
  "blockHash": "0000000000c0279636003ed0042c9a454b4c39e9a6c49bb92d420e0bf4e0f49b",
  "cbTxMerkleTree": "01000000015ef8245e2a381174f5e2cc701d5d067d9f16945179380a3ce54415114426eb510101",
  "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff4c03e02801043619ab5c08fabe6d6d736170747365743a7265737574736574d6e48c2ebd4e147373617074736574730100000000000000380000ae250000000d2f6e6f64655374726174756d2f000000000340230e43000000001976a914cb594917ad4e5849688ec63f29a0f7f3badb5da688ac4cfe1c3e000000001976a91470da282ad16926e127064b7d3d787d7f3793014788acf424f104000000001976a914312d9ccd4e73f2e66006e45701bce17125ba681e88ac00000000260100e0280100d26df127ba2765c8f098ab71199c82c59509418efe26cdf02f7c92ce738e2247",
  "deletedMNs": [
  ],
  "mnList": [
    {
      "proRegTxHash": "fef106ff6420f9c6638c9676988a8fc655750caafb506c98cb5ff3d4fea99a41",
      "confirmedHash": "0000000005d5635228f113b50fb5ad66995a7476ed20374e6e159f1f9e62347b",
      "service": "45.48.177.222:19999",
      "pubKeyOperator": "842476e8d82327adfb9b617a7ac3f62868946c0c4b6b0e365747cfb8825b8b79ba0eb1fa62e8583ae7102f59bf70c7c7",
      "votingAddress": "yf7QHemCfbmKEncwZxroTj8JtShXsC28V6",
      "isValid": true
    },
    {
      "proRegTxHash": "7d56a2cf814b344f54ac4b6485a7a5b2b5a439ea796defff67f2a5872c9df5c3",
      "confirmedHash": "00000c66555eea6272e5c7bcdb2648e1a63fd5b23a6d1d4c3f9dc5df43c6a5a8",
      "service": "178.151.192.107:19999",
      "pubKeyOperator": "8631b1ba19ed23fdab61db7a81c9aa1356eaf37d0a29a14cc493e2f863080bf909b4d3e23d536be1d18e4c842566ed67",
      "votingAddress": "yP2LXCZTVVjBFQiN2bhghQvNwdUQG8NMX8",
      "isValid": true
    },
    {
      "proRegTxHash": "be32ec53dbbfb64e5ba29e25e3716f6f4024291914ce4c858cd69f0b4e371dda",
      "confirmedHash": "0000000015717296254a7c6139a50c34ad481dc8fdf7b0ea4c8320dc3fff2759",
      "service": "173.61.30.231:19025",
      "pubKeyOperator": "86ce02e551a46f1ca9a734104b4e387984d733ba99930eb677aae126fa142f201049842422ab2f105e3c9805f1bd54e8",
      "votingAddress": "ySBU7oXuuTSJqtmUArMRFsKefJPtEDkESG",
      "isValid": false
    }
  ],
  "deletedQuorums": [
    {
      "llmqType": 1,
      "quorumHash": "00000000052b95b036c87f82d19878f69bf940e6acf9f03cd818bd07a5686d0e"
    },
    {
      "llmqType": 1,
      "quorumHash": "0000000000e8b557ea26921f4bb143e961dd35209cf8c1c7b73397322c1a5018"
    },
    {
      "llmqType": 1,
      "quorumHash": "000000000b259f422fe3b647b8f1553b846d95dc8c79699d60e48a81dcf14747"
    },
    {
      "llmqType": 1,
      "quorumHash": "00000000143365adb3c3de6a35ae247120df8ca53a61afd82cd6fd4126ca8a4d"
    }
  ],
  "newQuorums": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000001427858db64213ed3ef32ffb2546ca7f2a096adbefc197437b90612",
      "signersCount": 50,
      "signers": "ffffffffffff03",
      "validMembersCount": 50,
      "validMembers": "ffffffffffff03",
      "quorumPublicKey": "922e3683358f09a2619efb9e8329f90d5a8a608a18e26db212613ef7f95818eb6f68372fb313edbf96fdd2cdee20a66d",
      "quorumVvecHash": "2da4253e43adb732b06d88324384025a4cd0c2803bc6400462f9eb89ea314da8",
      "quorumSig": "949882d7912d7d3fef46dd856bcd6c70a080b2e5484a3c900bea04b902abd12c5f75e78d13cbdc5d352187db0e15c1b40715b9d89e998bb99437ad7ae97a1b23f922d55b6fc5cca290c05b44eda564782a3440c7ef3756fc3e9895d1ac34d3d0",
      "membersSig": "9736d9cbc7ff7189f6ef543fabc9bfc2785f60ffd4493ea4c272343da51fa61ec9867cd46b681c82a1c22a9830f8b86b0a02e34e9e71212010231024fd61cb95143591be2cace53760dba03a325e178e5fcae6a748073fadf3ab34268c8ed2bc"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "000000000148a6fced08763f3f31dd68a3d88d2d4f2d48eef44eb9311de66129",
      "signersCount": 50,
      "signers": "ffffffffffff03",
      "validMembersCount": 50,
      "validMembers": "ffffffffffff03",
      "quorumPublicKey": "814973fcf54892fa4edbf9e732341ff1227e2a89bf59cb22b52082e940f7c3ac8a7c25163cb375b3cfe3654e86eaa65d",
      "quorumVvecHash": "a91c4721c576850971313b9eb5ee7a886fd4dd4564e98ac0094e7a46e4351240",
      "quorumSig": "16abcfa4137c1900899970533cd52b0c264000b48ca6bd1d29cc9baab1ef883b378d5cdb8c1dd8bb7765e154bcc8ee360cfcdc008584e2d7c29f5be8361fecf3a4cafcdea29f1cb2e75c5d67057d0557e0d6cfa65cf85ae6ed65971b8f29a913",
      "membersSig": "18151a0b15e9ec892ae7ebc97b9e014bbe8a7f8344d24fe9f2925dae094e01500c6d5eb13b1ac6a8487be63e181a2b73053658f6b6374a01d183be1d4258ddaf0b18a4268a8a1e7d0c7ecfa414ad075d915beff5750d8ecef48b446b9c0d1da6"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000009931a8a6dcdf21a869739356e7715eb155c1a18a58c8bf13382ac33",
      "signersCount": 50,
      "signers": "ffffffffffff03",
      "validMembersCount": 50,
      "validMembers": "ffffffffffff03",
      "quorumPublicKey": "0694b46d8581423f2f68196dcc2d06be0b6b365a4100b54e351ab42f5828d09fd03941f8a1255363753a53d32b43f63b",
      "quorumVvecHash": "e0f2853af9fffc937af96264316982728fbbe483a36bff161c606f764ad9d8b9",
      "quorumSig": "16898292e519f01681c1a57606c54b7366275fa01a4912f8623eae73517ae1d3fd1607b7e8edcee43ce23141deba29fb00398d60f319adca9d460b972653715a4c5025a92141f065d92a0494cf211aa7485d6e4819514012efb107e8e2b9ba2e",
      "membersSig": "884a01e0ed65b745076198183883535d7bf636c7ebf9e13deb662ec4f4b202041fa826c978c9973380d614d11fd4071e0cf97abb3a7dd3a24f2eda0d8d7b179ab1a5837a78c53673567565aa3aaa72122d0e0bb8b6f2df092ca3da626c2b2800"
    },
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000000006097e9d08a4ca9bedbe4a97bb9bf3fe8d09372d18d2398f185cff5d",
      "signersCount": 50,
      "signers": "ffffffffffff03",
      "validMembersCount": 50,
      "validMembers": "ffffffffffff03",
      "quorumPublicKey": "10d0488558afd929508cd2d11bda7564333a904aa23c8b4a1ed57d86b217e3181497469e7220e9421e14f645a00940fc",
      "quorumVvecHash": "fbe6b3ae8d002bd648788b3173753c9cec3d4634b7df55f19b34d632b438aa70",
      "quorumSig": "17d3c06ae24312c9cda1b0f5db10b16e1d1a356f6bb050827d066c5026ecd3cd26fbd2479d781c88a2755aa78f9e16a50882bf18c75e1ab96ff1514b1f283d4fb3b10b4dcd13f8f267ec449250e7d195bc27351a74c8c456a6fcf7d847535f05",
      "membersSig": "0afd25e67d72d59c2dfbc671ae4e8163bfa2e75cda50b0c86800be5e1dd393abf8a717b147392688855f505d237154f8195b2bb30605d0ca18407e4552b7573cb08a6cb53eaf2a71894fb937af1f7783dbf5e6cb80b0cb903ea4f76266c039e7"
    }
  ],
  "merkleRootMNList": "47228e73ce927c2ff0cd26fe8e410995c5829c1971ab98f0c86527ba27f16dd2"
}
```

*See also: none*

### ProTx Info

The `protx info` RPC returns detailed information about a deterministic masternode.

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An JSON object containing a provider transaction, or JSON `null` if an error occurred
<br>Provider Transaction | object/null | Required<br>(exactly 1) | An object containing a provider transaction
→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order
→<br>`collateralHash` | string (hex) | Required<br>(exactly 1) | The hash of the collateral transaction as hex in RPC byte order
→<br>`collateralIndex` | number (int) | Required<br>(exactly 1) | The collateral index
→ →<br>`collateralAddress` | string (hex) | Required<br>(exactly 1) | The collateral address
→<br>`operatorReward` | number (int) | Required<br>(exactly 1) | The operator reward %
→<br>`state` | object/null | Required<br>(exactly 1) | An object containing a provider transaction state
→ →<br>`service` | string | Required<br>(exactly 1) | The masternode's IP:Port
→ →<br>`registeredHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was registered
→ →<br>`lastPaidHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was last paid
→ →<br>`PoSePenalty` | number (int) | Required<br>(exactly 1) | The masternode's proof of service penalty
→ →<br>`PoSeRevivedHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode recovered from a proof of service ban
→ →<br>`PoSeBanHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was banned for proof of service violations
→ →<br>`revocationReason` | number (int) | Required<br>(exactly 1) | The reason for a ProUpRegTx revocation
→ →<br>`ownerAddress` | string (hex) | Required<br>(exactly 1) | The owner address
→ →<br>`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address
→ →<br>`payoutAddress` | string (hex) | Required<br>(exactly 1) | The owner's payout address
→ →<br>`pubKeyOperator` | string (hex) | Required<br>(exactly 1) | The operator public key
→ →<br>`operatorPayoutAddress` | string (hex) | Required<br>(exactly 1) | The operator's payout address
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations this ProTx has
→<br>`wallet` | object/null | Required<br>(exactly 1) | An object containing a wallet details related to this ProTx
→ →<br>`hasOwnerKey` | bool | Required<br>(exactly 1) | The owner key is present in this wallet
→ →<br>`hasOperatorKey` | bool | Required<br>(exactly 1) | The operator key is present in this wallet
→ →<br>`hasVotingKey` | bool | Required<br>(exactly 1) | The voting key is present in this wallet
→ →<br>`ownsCollateral` | bool | Required<br>(exactly 1) | The collateral is owned by this wallet
→ →<br>`ownsPayeeScript` | bool | Required<br>(exactly 1) | The payee script is owned by this wallet
→ →<br>`ownsOperatorRewardScript` | bool | Required<br>(exactly 1) | The operator reward script is owned by this wallet
→<br>`metaInfo` | object/null | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>An object containing a metainfo related to this ProTx
→ →<br>`lastDSQ` | string | Required<br>(exactly 1) | The owner key is present in this wallet
→ →<br>`mixingTxCount` | string | Required<br>(exactly 1) | The operator key is present in this wallet
→ →<br>`lastOutboundAttempt` | integer | Required<br>(exactly 1) | Unix epoch time of the last outbound attempted
→ →<br>`lastOutboundAttemptElapsed` | integer | Required<br>(exactly 1) | Elapsed time since last outbound attempt
→ →<br>`lastOutboundSuccess` | integer | Required<br>(exactly 1) |  Unix epoch time of the last successful outbound connection
→ →<br>`lastOutboundSuccessElapsed` | integer | Required<br>(exactly 1) | Elapsed time since last successful outbound attempt


*Example from Dash Core 0.16.0*

```bash
dash-cli -testnet protx info\
 c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f
```

Result:
```json
{
  "proTxHash": "c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f",
  "collateralHash": "e3270ff48c4b802d56ee58d3d53777f7f9c289964e4df0842518075fc81345b1",
  "collateralIndex": 3,
  "collateralAddress": "yYpzTXjVx7A5uohsmW8sRy7TJp4tihVuZg",
  "operatorReward": 0,
  "state": {
    "service": "173.61.30.231:19013",
    "registeredHeight": 7090,
    "lastPaidHeight": 134608,
    "PoSePenalty": 334,
    "PoSeRevivedHeight": 96516,
    "PoSeBanHeight": 134819,
    "revocationReason": 0,
    "ownerAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
    "votingAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
    "payoutAddress": "yU3UdrmS6KpWwBDLQTkp1KjXePwWsMbYdj",
    "pubKeyOperator": "8700add55a28ef22ec042a2f28e25fb4ef04b3024a7c56ad7eed4aebc736f312d18f355370dfb6a5fec9258f464b227e"
  },
  "confirmations": 292831,
  "wallet": {
    "hasOwnerKey": false,
    "hasOperatorKey": false,
    "hasVotingKey": false,
    "ownsCollateral": false,
    "ownsPayeeScript": false,
    "ownsOperatorRewardScript": false
  },
  "metaInfo": {
    "lastDSQ": 0,
    "mixingTxCount": 0,
    "lastOutboundAttempt": 0,
    "lastOutboundAttemptElapsed": 1588171300,
    "lastOutboundSuccess": 0,
    "lastOutboundSuccessElapsed": 1588171300
  }
}
```

### ProTx List

The `protx list` RPC returns a list of provider transactions.

Lists all ProTxs in your wallet or on-chain, depending on the given type. If
`type` is not specified, it defaults to `registered`. All types have the optional
argument `detailed` which if set to `true` will result in a detailed list being
returned. If set to `false`, only the hashes of the ProTx will be returned.

*Parameter #1---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string | Optional<br>(0 or 1) | The type of ProTxs to list:<br>`registered` - all ProTxs registered at height<br>`valid` - all active/valid ProTxs at height<br>`wallet` - all ProTxs found in the current wallet<br><br>Height defaults to current chain-tip if one is not provided

*Parameter #2---detailed*

Name | Type | Presence | Description
--- | --- | --- | ---
`detailed` | bool | Optional<br>(0 or 1) | If set to `false` (default), only ProTx hashes are returned. If set to `true`, a detailed list of ProTx details is returned.

*Parameter #3---height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | number (int) | Optional<br>(0 or 1) | List ProTxs from this height (default: current chain tip).

*Result (if `detailed` was `false`)---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex): array | Required<br>(exactly 1) | Array of provider transaction (ProTx) hashes

*Result (if `detailed` was `true`)---JSON provider registration transaction details*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred
<br>Provider Transaction | object/null | Required<br>(exactly 1) | An object containing a provider transaction
→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order
→<br>`collateralHash` | string (hex) | Required<br>(exactly 1) | The hash of the collateral transaction as hex in RPC byte order
→<br>`collateralIndex` | number (int) | Required<br>(exactly 1) | The collateral index
→ →<br>`collateralAddress` | string (hex) | Required<br>(exactly 1) | The collateral address
→<br>`operatorReward` | number (int) | Required<br>(exactly 1) | The operator reward %
→<br>`state` | object/null | Required<br>(exactly 1) | An object containing a provider transaction state
→ →<br>`service` | string | Required<br>(exactly 1) | The masternode's IP:Port
→ →<br>`registeredHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was registered
→ →<br>`lastPaidHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was last paid
→ →<br>`PoSePenalty` | number (int) | Required<br>(exactly 1) | The masternode's proof of service penalty
→ →<br>`PoSeRevivedHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode recovered from a proof of service ban
→ →<br>`PoSeBanHeight` | number (int) | Required<br>(exactly 1) | The height where the masternode was banned for proof of service violations
→ →<br>`revocationReason` | number (int) | Required<br>(exactly 1) | The reason for a ProUpRegTx revocation
→ →<br>`ownerAddress` | string (hex) | Required<br>(exactly 1) | The owner address
→ →<br>`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address
→ →<br>`payoutAddress` | string (hex) | Required<br>(exactly 1) | The owner's payout address
→ →<br>`pubKeyOperator` | string (hex) | Required<br>(exactly 1) | The operator public key
→ →<br>`operatorPayoutAddress` | string (hex) | Required<br>(exactly 1) | The operator's payout address
→<br>`confirmations` | number (int) | Required<br>(exactly 1) | The number of confirmations this ProTx has
→<br>`wallet` | object/null | Required<br>(exactly 1) | An object containing a wallet details related to this ProTx
→ →<br>`hasOwnerKey` | bool | Required<br>(exactly 1) | The owner key is present in this wallet
→ →<br>`hasOperatorKey` | bool | Required<br>(exactly 1) | The operator key is present in this wallet
→ →<br>`hasVotingKey` | bool | Required<br>(exactly 1) | The voting key is present in this wallet
→ →<br>`ownsCollateral` | bool | Required<br>(exactly 1) | The collateral is owned by this wallet
→ →<br>`ownsPayeeScript` | bool | Required<br>(exactly 1) | The payee script is owned by this wallet
→ →<br>`ownsOperatorRewardScript` | bool | Required<br>(exactly 1) | The operator reward script is owned by this wallet
→<br>`metaInfo` | object/null | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>An object containing a metainfo related to this ProTx
→ →<br>`lastDSQ` | string | Required<br>(exactly 1) | The owner key is present in this wallet
→ →<br>`mixingTxCount` | string | Required<br>(exactly 1) | The operator key is present in this wallet
→ →<br>`lastOutboundAttempt` | integer | Required<br>(exactly 1) | Unix epoch time of the last outbound attempted
→ →<br>`lastOutboundAttemptElapsed` | integer | Required<br>(exactly 1) | Elapsed time since last outbound attempt
→ →<br>`lastOutboundSuccess` | integer | Required<br>(exactly 1) |  Unix epoch time of the last successful outbound connection
→ →<br>`lastOutboundSuccessElapsed` | integer | Required<br>(exactly 1) | Elapsed time since last successful outbound attempt

*Example from Dash Core 0.16.0*

```bash
dash-cli -testnet protx list
```

Result:
```json
[
  "2b4a07a9b04dc42a0c19b85edb60954a27acaadfe3ee21d0171385778f34e1c2",
  "61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929",
  "ca193751f3cbed2aa4f1b33b0acc48c7ed8b9a3679858d69cf23157a4f545176",
  "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"
]
```

List of ProTxs which are active/valid at the given chain height.

```bash
dash-cli -testnet protx list valid false 7090
```

Result:
```json
[
  "c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f"
]
```

Detailed list of ProTxs which are active/valid at the given chain height.

```bash
dash-cli -testnet protx list valid true 7090
```

Result:
```json
[
  {
    "proTxHash": "c48a44a9493eae641bea36992bc8c27eaaa33adb1884960f55cd259608d26d2f",
    "collateralHash": "e3270ff48c4b802d56ee58d3d53777f7f9c289964e4df0842518075fc81345b1",
    "collateralIndex": 3,
    "collateralAddress": "yYpzTXjVx7A5uohsmW8sRy7TJp4tihVuZg",
    "operatorReward": 0,
    "state": {
      "service": "173.61.30.231:19013",
      "registeredHeight": 7090,
      "lastPaidHeight": 0,
      "PoSePenalty": 0,
      "PoSeRevivedHeight": -1,
      "PoSeBanHeight": -1,
      "revocationReason": 0,
      "ownerAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "votingAddress": "yTMDce5yEpiPqmgPrPmTj7yAmQPJERUSVy",
      "payoutAddress": "yU3UdrmS6KpWwBDLQTkp1KjXePwWsMbYdj",
      "pubKeyOperator": "8700add55a28ef22ec042a2f28e25fb4ef04b3024a7c56ad7eed4aebc736f312d18f355370dfb6a5fec9258f464b227e"
    },
    "confirmations": 292830,
    "wallet": {
      "hasOwnerKey": false,
      "hasOperatorKey": false,
      "hasVotingKey": false,
      "ownsCollateral": false,
      "ownsPayeeScript": false,
      "ownsOperatorRewardScript": false
    },
    "metaInfo": {
      "lastDSQ": 0,
      "mixingTxCount": 0,
      "lastOutboundAttempt": 0,
      "lastOutboundAttemptElapsed": 1588171141,
      "lastOutboundSuccess": 0,
      "lastOutboundSuccessElapsed": 1588171141
    }
  }
]
```

### ProTx Register

The `protx register` RPC creates a ProRegTx referencing an existing collateral and and sends it to the network.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralHash` | string (hex) | Required<br>(exactly 1) | The collateral transaction hash

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralIndex` | string (hex) | Required<br>(exactly 1) | The collateral transaction output index

*Parameter #3---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form `IP:PORT`.<br>Must be unique on the network.<br>Can be set to `0`, which will require a ProUpServTx afterwards.

*Parameter #4---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to use for payee updates and proposal voting. The corresponding private key does not have to be known by this wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #5---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #6---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #7---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator. The value must be between `0.00` and `100.00`.<br>**Note**: If non-zero, `ipAndPort` must be zero as well.

*Parameter #8---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #9---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Parameter #10---whether to submit to the network or not*

Name | Type | Presence | Description
--- | --- | --- | ---
`submit` | bool | Optional<br>(0 or 1) |  If `true` (default), the resulting transaction is sent to the network.

*Result if `submit` is not set or set to `true`---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx register\
 8b2eab3413abb6e04d17d1defe2b71039ba6b6f72ea1e5dab29bb10e7b745948 1\
 2.3.4.5:2345 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6\
 88d719278eef605d9c19037366910b59bc28d437de4a8db4d76fda6d6985dbdf10404fb9bb5cd0e8c22f4a914a6c5566\
 yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6 5 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
```

Result:
```text
61e6d780178d353940c4cb9b3073ac0c50792bbcf0b15c1750d2028b71e34929
```

*Result if `submit` set to `false`---serialized and signed provider registration transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Serialized and signed provider registration transaction (ProRegTx)

*Example from Dash Core 0.17.0*

```bash
dash-cli -testnet protx register\ 
b16e6f6ac71d16a8be46a78491bbdba20910287f59471a46514b88d7203bac6b 1 2.3.4.5:2345\ 
yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6\ 
8ae227ffcbd4cbdc7ae2fe3e63264701ef6af1de71e6cade51867ecb7ed58b63862568522bab933987d0d043fa5590e1\ 
yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6 5 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt\ 
yUYTxqjpCfAAK4vgxXtBPywRBtZqsxN7Vy false
```

Result:
```text
0300010001fe1caa50e5b8181be868fbd9fbd93affeb6c4a91a3c73373a6b25d548c7e6d41010000\
006b48304502210081d206a8332d5b8715ca831155ef5c7e339d33cde2b0b27310b95aafc8c560f9\
02204029d00d2b5515565321ec1fd6748fa0544b7356d9a389e4d1ce6ab4bb64d364012103c67d86\
944315838aea7ec80d390b5d09b91b62483370d4979da5ccf7a7df77a9feffffff01a6f0433e0000\
00001976a9145a375814e9caf5b8575a8221be246457e5c5c28d88ac00000000fd12010100000000\
006bac3b20d7884b51461a47597f281009a2dbbb9184a746bea8161dc76a6f6eb101000000000000\
00000000000000ffff0203040509291636e84d02310b0b458f3eb51d8ea8b2e684b7ce8ae227ffcb\
d4cbdc7ae2fe3e63264701ef6af1de71e6cade51867ecb7ed58b63862568522bab933987d0d043fa\
5590e11636e84d02310b0b458f3eb51d8ea8b2e684b7cef4011976a914fc136008111fcc7a05be6c\
ec66f97568727a9e5188acb3ccf680086ae11217236efcccd67b0b72e83c79a043d6c6d064378fdd\
5f21204120fac89c76d3f116d95a675e112ddbdbb7a78f957506299fe592662acd44b46f262d1c4d\
47d9401e0a569a5488728e09542d0545ab56f8249a4b21e03445fa411e
```


### ProTx Register Fund

The `protx register_fund` RPC creates and funds a ProRegTx with the 1,000 DASH necessary for a masternode and then sends it to the network.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to send the collateral to

*Parameter #2---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form `IP:PORT`.<br>Must be unique on the network.<br>Can be set to `0`, which will require a ProUpServTx afterwards.

*Parameter #3---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to use for payee updates and proposal voting. The corresponding private key does not have to be known by this wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #4---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #5---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #6---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator.<br>The value must be between `0.00` and `100.00`.

*Parameter #7---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #8---fund address*

Name | Type | Presence | Description
--- | --- | --- | ---
`fundAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Parameter #9---whether to submit to the network or not*

Name | Type | Presence | Description
--- | --- | --- | ---
`submit` | bool | Optional<br>(0 or 1) |  If `true` (default), the resulting transaction is sent to the network.

*Result if `submit` is not set or set to `true`---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx register_fund yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7\
 3.4.5.6:3456 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw\
 0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51\
 yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw 5 yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7
```

Result:
```text
ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd
```

*Result if `submit` set to `false`---serialized and signed provider registration transaction*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Serialized and signed provider registration transaction (ProRegTx)

*Example from Dash Core 0.17.0*

```bash
dash-cli -testnet protx register_fund yNLuVTXJbjbxgrQX5LSMi7hV19We8hT2d6\ 
3.4.5.6:3456 yURczr3qY31xkQZfFu8eZvKz19eAEPQxsd\ 
0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51\
yURczr3qY31xkQZfFu8eZvKz19eAEPQxsd 5 yUYTxqjpCfAAK4vgxXtBPywRBtZqsxN7Vy\ 
yRMFHxcJ2aS2vfo5whhE2Gg73dfQVm8LAF 0
```

Result:
```text
030001000156701575e76bca5720fa364ea6efc4b713279710dd1b8906797d18bd7048b71a010000\
006b4830450221009178a387b3d82e3606e6484373508ef1ed4c1d7d98f8a0ca0851687c59edacaa\
02204d245d20689b5be1100536faaadbb1781e3a67a55e9ecc613adb2a34f419c3cd012103109325\
a92f9e6d31d2ebd0595d471275ae8d635db2a0c42358f387e1af69c14dfeffffff0200e876481700\
00001976a9141636e84d02310b0b458f3eb51d8ea8b2e684b7ce88ac8c7a918b300000001976a914\
372fd07f715c33ce88873a8e758d890e017cf02588ac00000000d101000000000000000000000000\
000000000000000000000000000000000000000000000000000000000000000000000000000000ff\
ff030405060d8058ebf95961c207ebd525793ccb43f60ce34a5cd50e02146e9c34cfbcb3f3037574\
a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d5158ebf95961\
c207ebd525793ccb43f60ce34a5cd5f4011976a9145a375814e9caf5b8575a8221be246457e5c5c2\
8d88ac45084a0f63d6f06767c941ffd5af4ed17ea0e28afa481e46b2bdbadbd8446c8c00\
```

### ProTx Register Prepare

The `protx register_prepare` RPC creates an unsigned ProTx and a message that must be signed externally with the private key that corresponds to `collateralAddress` to prove collateral ownership. The prepared transaction will also contain inputs and outputs to cover fees. The ProTx must be passed to [`protx register_submit`](#protx-register-submit).

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralHash` | string (hex) | Required<br>(exactly 1) | The collateral transaction hash

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`collateralIndex` | string (hex) | Required<br>(exactly 1) | The collateral transaction output index

*Parameter #3---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.<br>Can be set to '0', which will require a ProUpServTx afterwards.

*Parameter #4---owner address*

Name | Type | Presence | Description
--- | --- | --- | ---
`ownerAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to use for payee updates and proposal voting. The corresponding private key does not have to be known by this wallet. The address must be unused and must differ from the `collateralAddress`.

*Parameter #5---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode.

*Parameter #6---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, `ownerAddress` will be used.

*Parameter #7---operator reward*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorReward` | number | Required<br>(exactly 1) | The fraction in % to share with the operator.<br>The value must be between '0.00' and '100.00'.

*Parameter #8---payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string (hex) | Required<br>(exactly 1) | The Dash address to use for masternode reward payments.

*Parameter #9---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---unsigned transaction and message to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | JSON object containing an unsigned provider transaction and the message to be signed externally, or JSON `null` if an error occurred
→<br>`tx` | string (hex) | Required<br>(exactly 1) | The serialized unsigned ProRegTx in hex format
→<br>`collateralAddress` | string (hex) | Required<br>(exactly 1) | The collateral address
→<br>`signMessage` | string (base64) | Required<br>(exactly 1) | The string message that needs to be signed with the collateral key.

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx register_prepare\
 df41e398bb245e973340d434d386f431dbd69735a575721b0b6833856e7d31ec 1 \
 9.8.7.6:9876 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz\
 06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280c\
 yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz 1.2 yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt
```

Result:
```json
{
  "tx": "0300010001912b88876fee2f8e43e23b5e81276c163cf23d867bad4148170cb106ef9023700000000000feffffff0125623ba40b0000001976a914736e155c1039a269d4019c66219d2a18f0fee27588ac00000000d1010000000000ec317d6e8533680b1b7275a53597d6db31f486d334d44033975e24bb98e341df0100000000000000000000000000ffff090807062694ca6b243168b30461d1f19e2bb89a965a5bac067e06849865d01e4f73a6d5a025117e48f50b897e14235800501c8bfb8a6365cc8dbf5ddb67a3635d0f1dcc7d46a7ee280cca6b243168b30461d1f19e2bb89a965a5bac067e78001976a914fc136008111fcc7a05be6cec66f97568727a9e5188ace5f6b70ac55411727e25178bd417b9b03f837ad7155d90ad286f3a427203fb9f00",
  "collateralAddress": "yWuKWhDzGQqZL8rw6kGxGrfe6P8bUC2S4f",
  "signMessage": "yjJJLkYDUN6X8gWjXbCoKEXoiLeKxxMMRt|120|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|yemjhGQ99V5ayJMjoyGGPtxteahii6G1Jz|69a49e18c1253b90d39322f7e2f7af74524401bc33a27645e697e74a214e3e1e"
}
```

### ProTx Register Submit

The `protx register_submit` RPC combines the unsigned ProTx and a signature of the signMessage, signs all inputs which were added to cover fees and submits the resulting transaction to the network. Note: See [`protx register_prepare`](#protx-register-prepare) for more info about creating a ProTx and a message to sign.

*Parameter #1---collateral address*

Name | Type | Presence | Description
--- | --- | --- | ---
`tx` | string (hex) | Required<br>(exactly 1) | The serialized unsigned transaction previously returned by `protx register_prepare`

*Parameter #2---collateral index*

Name | Type | Presence | Description
--- | --- | --- | ---
`sig` | string (base64) | Required<br>(exactly 1) | The signature signed with the collateral key. Must be in base64 format.

*Result---provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider registration transaction (ProRegTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx register_submit\
 03000100012d988526d5d1efd32320023c92eff09c2963dcb021b0de9761\
 17e5e37dc7a7870000000000feffffff015f603ba40b0000001976a9140c\
 37e07eb5c608961769e6506c23c11e9f9fe00988ac00000000d101000000\
 00002d988526d5d1efd32320023c92eff09c2963dcb021b0de976117e5e3\
 7dc7a7870100000000000000000000000000ffff05060708162e243dd366\
 bf4a329968d77eac9fb63481a600938d125e1b7cba03ca2a097e402185e6\
 160232ea53e6d62898a3be8617b06ff347d967543228bd9b605547c3d478\
 b0a838ca243dd366bf4a329968d77eac9fb63481a600938dc4091976a914\
 e9bf4e6f26fecf1dfc1e04dde43472df378628b888ac6a048e7f645e8adc\
 305ccfd8652066046a0702596af13b8ac97803ade256da2900\
 \
 H90IvqVtFjZkwLJb08yMEgGixs0/FpcdvwImBcir4cYLJhD3pdX+lKD2GsPl6KNxghVXNk5/HpOdBoWAHo9u++Y=
```

Result:
```text
273ce3ebe24183ee4117b10e054cdbb108a3bde5d2f286129e29480d46a3f573
```

### ProTx Revoke

The `protx revoke` RPC creates and sends a ProUpRevTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---operator private key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) |  The operator private key belonging to the registered operator public key.

*Parameter #3---reason*

Name | Type | Presence | Description
--- | --- | --- | ---
`reason` | number | Required<br>(exactly 1) | The reason for revocation.

*Parameter #4---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update revoke transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update revoke transaction (ProUpRevTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx revoke\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1"
```

Result:
```bash
2aad36dd2ab254bee06b0b5dad51e7603691b72058d5806fd94e1d2d19a7c209
```

### ProTx Update Registrar

The `protx update_registrar` RPC creates and sends a ProUpRegTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---operator public key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPubKey` | string (hex) | Required<br>(exactly 1) | The operator public key. The private key does not have to be known. It has to match the private key which is later used when operating the masternode. If set to an empty string, the currently active operator BLS public key is reused.

*Parameter #3---voting address*

Name | Type | Presence | Description
--- | --- | --- | ---
`votingAddress` | string (hex) | Required<br>(exactly 1) | The voting address. The private key does not have to be known by your wallet. It has to match the private key which is later used when voting on proposals. If set to an empty string, the currently active voting key address is reused.

*Parameter #4---operator payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`payoutAddress` | string (hex) | Optional<br>(0 or 1) | The Dash address to use for masternode reward payments. If set to an empty string, the currently active payout address is reused.

*Parameter #5---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `payoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update registrar transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update registrar transaction (ProUpRegTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx update_registrar\
 "ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd"\
 "0e02146e9c34cfbcb3f3037574a1abb35525e2ca0c3c6901dbf82ac591e30218d1711223b7ca956edf39f3d984d06d51"\
 "yX2cDS4kcJ4LK4uq9Hd4TG7kURV3sGLZrw" "yakx4mMRptKhgfjedNzX5FGQq7kSSBF2e7"
```

Result:
```bash
702390ef06b10c174841ad7b863df23c166c27815e3be2438e2fee6f87882b91
```

### ProTx Update Service

The `protx update_service` RPC creates and sends a ProUpServTx to the network.

*Parameter #1---initial provider registration transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Parameter #2---IP Address and port*

Name | Type | Presence | Description
--- | --- | --- | ---
`ipAndPort` | string | Required<br>(exactly 1) | IP and port in the form 'IP:PORT'.<br>Must be unique on the network.

*Parameter #3---operator key*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorKey` | string (hex) | Required<br>(exactly 1) |  The operator BLS private key associated with the registered operator public key.

*Parameter #4---operator payout address*

Name | Type | Presence | Description
--- | --- | --- | ---
`operatorPayoutAddress` | string (hex) | Optional<br>(0 or 1) | The Dash address used for operator reward payments. Only allowed when the ProRegTx had a non-zero `operatorReward` value. If set to an empty string, the currently active payout address is reused.

*Parameter #5---fee source address*

Name | Type | Presence | Description
--- | --- | --- | ---
`feeSourceAddress` | string | Optional<br>(0 or 1) | If specified, the wallet will only use coins from this address to fund the ProTx. If not specified, `operatorPayoutAddress` will be used. The private key belonging to this address must be known in your wallet.

*Result---provider update service transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Provider update service transaction (ProUpServTx) hash

*Example from Dash Core 0.13.0*

```bash
dash-cli -testnet protx update_service\
 ba1b3330e16a0876b7a186e7ceb689f03ec646e611e91d7139de021bbf13afdd\
 "4.3.2.1:4321"\
 4da7e1ea30fb9e55c73ad23df0b9d3d34342acb24facf4b19420e1a26ae272d1
```

Result:
```bash
5b6cfa1bdd3c8b7e0b9550b9c4e809381f81a410bc7f241d3879dd736fd51270
```

## Quorum

*Added in Dash Core 0.14.0*

The [`quorum` RPC](../api/remote-procedure-calls-evo.md#quorum) provides a set of commands for quorums (LLMQs).

### Quorum List

The `quorum list` RPC displays a list of on-chain quorums.

*Parameter #1---quorum count*

Name | Type | Presence | Description
--- | --- | --- | ---
`count` | number | Optional<br>(0 or 1) | Number of quorums to list. Will list active quorums if `count` is not specified.

*Result---a list of quorums*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Quorum list
→<br>Quorum | array | Required<br>(1 or more) | Array of quorum details
→ →<br>Quorum Hash | string (hex) | Optional<br>(0 or more) | A quorum hash

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet quorum list
```

Result:
```json
{
  "llmq_50_60": [
    "00000000023cc6dde69bed898c83fe2328ef38b1ea9da14a599efa14caef0b7d",
    "000000002b968fb3b2fc2ff18d6e89611e366b4d38a6d0437e99bd7c37f2fd83",
    "000000000301054c038b07b5b51493d5efc3f078e3aede6eb603c47943d1cc78",
    "000000000e901278c00c896754a06f8d45d0268c6aff6e72ffb3007d07c10e73",
    "000000001bc592f2a8676203835bc6ad442abeadb9c22b8d6a2999db07354b01",
    "000000000896c37ef8a32318ee871589394f1578473b8825275b610690e47db0",
    "00000000133b192b2319a0716ad18e5788981fff51856f61205af5d6a634ba41",
    "0000000004946f3f9f82a298985f73080d62627d51f6f4ba77f3cd8c6788b3d0",
    "0000000005cb014d3df9bac0ba379f1d5b8b75f0e6d7c408d43ac1db330ec641",
    "0000000006c1653c7ee747f140dd7daa1da23a541e67a0fc0dc88db3482ec4d5"
  ],
  "llmq_400_60": [
    "0000000007697fd69a799bfa26576a177e817bc0e45b9fcfbf48b362b05aeff2"
  ],
  "llmq_400_85": [
  ]
}
```

### Quorum Info

The `quorum info` RPC returns information about a specific quorum.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorums](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types) to list:<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---quorum hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum

*Parameter #3---secret key share*

Name | Type | Presence | Description
--- | --- | --- | ---
`includeSkShare` | bool | Optional<br>(0 or 1) | Include the secret key share (default: `false`)

*Result---information about a quorum*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Quorum list
→<br>`height` | number | Required<br>(exactly 1) | Block height of the quorum
→<br>`type` | string | Required<br>(exactly 1) | Type of LLMQ
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→<br>`quorumIndex` | number | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>The index of the quorum
→<br>`minedBlock` | string (hex) | Required<br>(exactly 1) | The hash of the block that established the quorum
→<br>`members` | array | Required<br>(exactly 1) | An array containing quorum member details
→ →<br>Member | object | Required<br>(1 or more) | An object describing a particular member
→ → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→ → →<br>`service` | string | Required<br>(exactly 1) | **Added in Dash Core 18.1.0**<br>The masternode's IP:Port
→ → →<br>`pubKeyOperator` | string (hex) | Required<br>(exactly 1) | *Added in Dash Core 0.15.0*<br>The masternode's Operator public key
→ → →<br>`valid` | bool | Required<br>(exactly 1) | Indicates if the member is valid
→ → →<br>`pubKeyShare` | string | Optional<br>(0 or 1) | Member public key share
→<br>`quorumPublicKey` | string | Required<br>(exactly 1) | Quorum public key
→<br>`secretKeyShare` | string | Optional<br>(exactly 1) | Quorum secret key share

*Example from Dash Core 18.1.0*

```bash
dash-cli -testnet quorum info 1 \
  000000ebd10368ca387ce380539fad9c8ba21108a3bfd6fedeecb60d28f56ae9 true
```

Result (truncated):
```json
{
  "height": 819240,
  "type": "llmq_50_60",
  "quorumHash": "000000ebd10368ca387ce380539fad9c8ba21108a3bfd6fedeecb60d28f56ae9",
  "quorumIndex": 0,
  "minedBlock": "00000548588369399691ad308a3c588a7bf842a40347e23ef40655e315898146",
  "members": [
    {
      "proTxHash": "f77ec12ec8adb91a3a158c5f9cc3f7e2521d65eac6cda1e44763daa603a77570",
      "service": "35.89.202.171:19999",
      "pubKeyOperator": "16f8048e511e7c0c2b495a9b20030b315d75bca283b70af25d16c8809c7f2a786225c2fe47ff1c92aa8ebf586be91abc",
      "valid": true,
      "pubKeyShare": "12c305fdc5ec06785d2e89a8b64c291128e4a2034889e9f1539d9194954051a304d8bf1649a2d3a95aac200884e8e99d"
    },
    {"Truncated data":"..."},
    {
      "proTxHash": "2cd3833e1cef622e875096c70d6eb6c7083a250a6b26ca27edb3aa21ac05e3d1",
      "service": "89.47.162.137:19999",
      "pubKeyOperator": "8fc1d0cea417ed963e50d876a38bf0846b536b7e8809826e163bc9ea0f749ea8ebe00c6642e71bb84000549bda5bb1d0",
      "valid": true,
      "pubKeyShare": "8662927148ed33b8f0000f1666c277e14df9838c9dce4e3fb273866603b93502e70108408f81698e0b47cb3b5aff3a30"
    }
  ],
  "quorumPublicKey": "18401a5c5d8d8145cea2843e0c37f10d06de642ce7665599ad35dce9f7a3027b42375a9e138e185867bfe5359fd952f2",
  "secretKeyShare": "4d39c4c1cb856a5e2d96efffb4cf3695b57b5d0fb4e289e7b2be3b7592a6dfa6"
}
```

### Quorum DKGStatus

The `quorum list` RPC displays the status of the current DKG process.

>❗️
>
> Breaking change(s) in Dash Core 18.0. See parameter and/or response information for details.

*Parameter #1---detail level*

Name | Type | Presence | Description
--- | --- | --- | ---
`detail_level` | number | Optional<br>(0 or 1) | Detail level of output (default: 0):<br>`0` - Only show counts (_default_)<br>`1` - Show member indexes<br>`2` - Show member's ProTxHashes<br><br>_Note: Works only when Spork 17 is enabled and only displays details related to the node running the command._

*Result (if detail level was 0 or omitted)---JSON DKG details*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array of objects each containing a provider transaction, or JSON `null` if an error occurred
→<br>`time` | string (hex) | Required<br>(exactly 1) | The Unix epoch time
→<br>`timeStr` | string (hex) | Required<br>(exactly 1) | The UTC time as a string
→<br>`session` | array of objects | Required<br>(exactly 1) | Array of objects containing DKG Session information
→ →<br>Session | object | Required<br>(exactly 1) | DKG session object
→ → →<br>`llmqType` | string | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>[Quorum type name](https://github.com/dashpay/dips/blob/master/dip-0006/llmq-types.md)
→ → →<br>`quorumIndex` | number | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>The index of the quorum
→ → →<br>`status` | object | Required<br>(exactly 1) | DKG session status information
→ → → →<br>`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67
→ → → →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum
→ → → →<br>`quorumHeight` | number | Required<br>(exactly 1) | The block height of the quorum
→ → → →<br>`phase` | number | Required<br>(exactly 1) | The active DKG phase<br>`1` - Initialized<br>`2` - Contributing<br>`3` - Complaining<br>`4` - Justifying<br>`5` - Committing<br>`6` - Finalizing
→ → → →<br>`sentContributions` | bool | Required<br>(exactly 1) | True when contributions have been sent
→ → → →<br>`sentComplaint` | bool | Required<br>(exactly 1) | True when complaints have been sent
→ → → →<br>`sentJustification` | bool | Required<br>(exactly 1) | True when justifications have been sent
→ → → →<br>`sentPrematureCommitment` | bool | Required<br>(exactly 1) | True when premature commitments have been sent
→ → → →<br>`aborted` | bool | Required<br>(exactly 1) | True if the DKG session has been aborted
→ → → →<br>`badMembers` | number | Required<br>(exactly 1) | Number of bad members
→ → → →<br>`weComplain` | number | Required<br>(exactly 1) | Number of complaints sent
→ → → →<br>`receivedContributions` | number | Required<br>(exactly 1) | Number of contributions received
→ → → →<br>`receivedComplaints` | number | Required<br>(exactly 1) | Number of complaints received
→ → → →<br>`receivedJustifications` | number | Required<br>(exactly 1) | Number of justifications received
→ → → →<br>`receivedPrematureCommitments` | number | Required<br>(exactly 1) | Number of premature commitments received
→<br>`quorumConnections` | array of objects | Required<br>(exactly 1) | **Modified in Dash Core 18.0.0**<br>Array of objects containing quorum connection information
→ →<br>Quorum type | object | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>An object describing connection information for a quorum index and type
→ → →<br>`llmqType` | string | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>[Quorum type name](https://github.com/dashpay/dips/blob/master/dip-0006/llmq-types.md)
→ → →<br>`quorumIndex` | number | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>The index of the quorum
→ → →<br>`pQuorumBaseBlockIndex` | number | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>The height of the quorum's base block
→ → → <br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum
→ → →<br>`pindexTip` | number | Required<br>(exactly 1) | **Added in Dash Core 18.0.0**<br>The height of the quorum's index tip
→ → →<br>`quorumConnections` | array of objects | Required<br>(exactly 1) | Array of objects containing quorum connection information
→ → → →<br>Connection | object | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>An object describing a quorum connection
→ → → →→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → → →→<br>`connected` | boolean | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>Whether or not the connection is active
→ → → →→<br>`address` | string | Optional<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>Address
→ → → →→<br>`outbound` | boolean | Required<br>(exactly 1) | **Added in Dash Core 0.16.0**<br><br>Whether or not this is an outbound connection
→<br>`minableCommitments` | object | Required<br>(exactly 1) | Object containing minable commitments

*Result (if detail level was 1)---JSON DKG details including member index*

Note: detail level 1 includes all level 0 fields and expands the following fields.

Name | Type | Presence | Description
--- | --- | --- | ---
→ → →<br>`badMembers` | array | Required<br>(exactly 1) | Array containing the member index for each bad member
→ → →<br>`weComplain` | array | Required<br>(exactly 1) | Array containing the member index for each complaint sent
→ → →<br>`receivedContributions` | array | Required<br>(exactly 1) | Array containing the member index for each contribution received
→ → →<br>`receivedComplaints` | array | Required<br>(exactly 1) | Array containing the member index for each complaint received
→ → →<br>`receivedJustifications` | array | Required<br>(exactly 1) | Array containing the member index for each justification received
→ → →<br>`receivedPrematureCommitments` | array | Required<br>(exactly 1) | Array containing the member index for each commitment received

*Result (if detail level was 2)---JSON DKG details including member index and ProTx hash*

Note: detail level 2 includes all level 0 fields, adds the `allMembers` field, and expands several fields.

Name | Type | Presence | Description
--- | --- | --- | ---
→ → →<br>`badMembers` | array | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a bad member
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`weComplain` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member being complained about
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedContributions` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a contribution was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedComplaints` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a complaint was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedJustifications` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a justification was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`receivedPrematureCommitments` | object | Required<br>(exactly 1) | An array of objects with each object containing the member index and ProTx hash for a member a premature commitment was received from
→ → → →<br>Member | object | Required<br>(0 or more) | An object describing quorum member details
→ → → → →<br>`memberIndex` | number | Required<br>(exactly 1) | The quorum member's index
→ → → → →<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum member's provider registration transaction as hex in RPC byte order
→ → →<br>`allMembers` | array | Required<br>(exactly 1) | Array containing the provider registration transaction hash for all quorum members

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet quorum dkgstatus
```

Result (truncated):
``` json
{
  "time": 1644854935,
  "timeStr": "2022-02-14T16:08:55Z",
  "session": [
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 0,
      "status": {
        "llmqType": 101,
        "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
        "quorumHeight": 6072,
        "phase": 6,
        "sentContributions": true,
        "sentComplaint": false,
        "sentJustification": false,
        "sentPrematureCommitment": true,
        "aborted": false,
        "badMembers": 0,
        "weComplain": 0,
        "receivedContributions": 12,
        "receivedComplaints": 0,
        "receivedJustifications": 0,
        "receivedPrematureCommitments": 12
      }
    }
  ],
  "quorumConnections": [
    {
      "llmqType": "llmq_50_60",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_400_60",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6048,
      "quorumHash": "0000000a428025892b1d62bd27b0bf8eee521218d12f9a459a7bde20a944a3bc",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_100_67",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "ec4ca45ccce7d7f94ab824a9f4840c3a85731c8bc70ba21953992009214c7e1d",
          "connected": true,
          "address": "34.219.73.212:49030",
          "outbound": false
        },
        {
          "proTxHash": "895cb52efac54f92ed726ad9da15fd6a8c94fcabae2f9c41ad81be0c214e0d1e",
          "connected": true,
          "address": "35.88.228.131:46084",
          "outbound": false
        },
      ]
    },
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 1,
      "pQuorumBaseBlockIndex": 6073,
      "quorumHash": "000000b1823c0d77dcfbd6a11404ddbcfc259a503aec9a7aadfdfabc7602a7be",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "93b2f08a18d9ac165aad16d66d8492721f4556e53d3a2d28b045cc992ce65725",
          "connected": true,
          "address": "54.191.24.26:38528",
          "outbound": false
        },
      ]
    }
  ],
  "minableCommitments": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    },
    {
      "version": 1,
      "llmqType": 4,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  ]
}
```

*Example from Dash Core 18.0.0 (detail_level: 1)*

```bash
dash-cli -testnet quorum dkgstatus 1
```

Result (truncated):
```json
{
  "time": 1644854935,
  "timeStr": "2022-02-14T16:08:55Z",
  "session": [
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 0,
      "status": {
        "llmqType": 101,
        "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
        "quorumHeight": 6072,
        "phase": 6,
        "sentContributions": true,
        "sentComplaint": false,
        "sentJustification": false,
        "sentPrematureCommitment": true,
        "aborted": false,
        "badMembers": [
        ],
        "weComplain": [
        ],
        "receivedContributions": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11
        ],
        "receivedComplaints": [
        ],
        "receivedJustifications": [
        ],
        "receivedPrematureCommitments": [
          0,
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11
        ]
      }
    }
  ],
  "quorumConnections": [
    {
      "llmqType": "llmq_50_60",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_100_67",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
],
  "minableCommitments": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    },
    {
      "version": 1,
      "llmqType": 4,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  ]
}

```

*Example from Dash Core 18.0.0 (detail_level: 2)*

```bash
dash-cli -testnet quorum dkgstatus 2
```

Result (truncated):
```json
{
  "time": 1644854935,
  "timeStr": "2022-02-14T16:08:55Z",
  "session": [
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 0,
      "status": {
        "llmqType": 101,
        "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
        "quorumHeight": 6072,
        "phase": 6,
        "sentContributions": true,
        "sentComplaint": false,
        "sentJustification": false,
        "sentPrematureCommitment": true,
        "aborted": false,
        "badMembers": [
        ],
        "weComplain": [
        ],
        "receivedContributions": [
          {
            "memberIndex": 0,
            "proTxHash": "6503cd51fd93d0923eaee599b8f48dceb639b0f1a7e5dfd064d439c9729e1b48"
          },
          {
            "memberIndex": 1,
            "proTxHash": "f9bf9e69ef111ca5218804f004c5e31abd971699847f52364e88301559cab6f8"
          },
          {
            "memberIndex": 2,
            "proTxHash": "895cb52efac54f92ed726ad9da15fd6a8c94fcabae2f9c41ad81be0c214e0d1e"
          },
          {
            "memberIndex": 3,
            "proTxHash": "fd1fe03e178b397baa304fdcb98c7e99b6d39768029490270e17b53f4fef7aa3"
          },
          {
            "memberIndex": 4,
            "proTxHash": "ec4ca45ccce7d7f94ab824a9f4840c3a85731c8bc70ba21953992009214c7e1d"
          },
          {
            "memberIndex": 5,
            "proTxHash": "9c3173a86ef146920ad37f3b0c4f9be0f08063c1d194aaa9602d766a5de782a9"
          },
          {
            "memberIndex": 6,
            "proTxHash": "856c3dd446c0791e800aa24f6a726431a0d4df6ed3cfb3a71b1bf3951764cbf3"
          },
          {
            "memberIndex": 7,
            "proTxHash": "38e2e295b4ed4f2d93731951537fd2fa31bee87833b61443a6961117a0c970a8"
          },
          {
            "memberIndex": 8,
            "proTxHash": "e76cdb5c9e004fb9bf83bfcebf7bf59bcbe925a1d348d3e5cfb108910e45d0d1"
          },
          {
            "memberIndex": 9,
            "proTxHash": "8abb1f227473e188d0e3ff39201badd49d22f8b323f9cfdd096d109f50614b6c"
          },
          {
            "memberIndex": 10,
            "proTxHash": "8675ed9f95526868ce4cf88ffe5a26ccff90b7623516735219c6e16731e4288a"
          },
          {
            "memberIndex": 11,
            "proTxHash": "e657b9abffe8326c25236ccfb28408617d3f5c3704d703edc1271db37db62b5d"
          }
        ],
        "receivedComplaints": [
        ],
        "receivedJustifications": [
        ],
        "receivedPrematureCommitments": [
          {
            "memberIndex": 0,
            "proTxHash": "6503cd51fd93d0923eaee599b8f48dceb639b0f1a7e5dfd064d439c9729e1b48"
          },
          {
            "memberIndex": 1,
            "proTxHash": "f9bf9e69ef111ca5218804f004c5e31abd971699847f52364e88301559cab6f8"
          },
          {
            "memberIndex": 2,
            "proTxHash": "895cb52efac54f92ed726ad9da15fd6a8c94fcabae2f9c41ad81be0c214e0d1e"
          },
          {
            "memberIndex": 3,
            "proTxHash": "fd1fe03e178b397baa304fdcb98c7e99b6d39768029490270e17b53f4fef7aa3"
          },
          {
            "memberIndex": 4,
            "proTxHash": "ec4ca45ccce7d7f94ab824a9f4840c3a85731c8bc70ba21953992009214c7e1d"
          },
          {
            "memberIndex": 5,
            "proTxHash": "9c3173a86ef146920ad37f3b0c4f9be0f08063c1d194aaa9602d766a5de782a9"
          },
          {
            "memberIndex": 6,
            "proTxHash": "856c3dd446c0791e800aa24f6a726431a0d4df6ed3cfb3a71b1bf3951764cbf3"
          },
          {
            "memberIndex": 7,
            "proTxHash": "38e2e295b4ed4f2d93731951537fd2fa31bee87833b61443a6961117a0c970a8"
          },
          {
            "memberIndex": 8,
            "proTxHash": "e76cdb5c9e004fb9bf83bfcebf7bf59bcbe925a1d348d3e5cfb108910e45d0d1"
          },
          {
            "memberIndex": 9,
            "proTxHash": "8abb1f227473e188d0e3ff39201badd49d22f8b323f9cfdd096d109f50614b6c"
          },
          {
            "memberIndex": 10,
            "proTxHash": "8675ed9f95526868ce4cf88ffe5a26ccff90b7623516735219c6e16731e4288a"
          },
          {
            "memberIndex": 11,
            "proTxHash": "e657b9abffe8326c25236ccfb28408617d3f5c3704d703edc1271db37db62b5d"
          }
        ],
        "allMembers": [
          "6503cd51fd93d0923eaee599b8f48dceb639b0f1a7e5dfd064d439c9729e1b48",
          "f9bf9e69ef111ca5218804f004c5e31abd971699847f52364e88301559cab6f8",
          "895cb52efac54f92ed726ad9da15fd6a8c94fcabae2f9c41ad81be0c214e0d1e",
          "fd1fe03e178b397baa304fdcb98c7e99b6d39768029490270e17b53f4fef7aa3",
          "ec4ca45ccce7d7f94ab824a9f4840c3a85731c8bc70ba21953992009214c7e1d",
          "9c3173a86ef146920ad37f3b0c4f9be0f08063c1d194aaa9602d766a5de782a9",
          "856c3dd446c0791e800aa24f6a726431a0d4df6ed3cfb3a71b1bf3951764cbf3",
          "38e2e295b4ed4f2d93731951537fd2fa31bee87833b61443a6961117a0c970a8",
          "e76cdb5c9e004fb9bf83bfcebf7bf59bcbe925a1d348d3e5cfb108910e45d0d1",
          "8abb1f227473e188d0e3ff39201badd49d22f8b323f9cfdd096d109f50614b6c",
          "8675ed9f95526868ce4cf88ffe5a26ccff90b7623516735219c6e16731e4288a",
          "e657b9abffe8326c25236ccfb28408617d3f5c3704d703edc1271db37db62b5d"
        ]
      }
    }
  ],
  "quorumConnections": [
    {
      "llmqType": "llmq_50_60",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_100_67",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "e3a1bc7820e24820ab557c7dc7650b5a6ec326adac9599f42ed981e4227bdc0e",
          "connected": true,
          "address": "54.187.0.112:20001",
          "outbound": true
        },
      ]
    },
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 0,
      "pQuorumBaseBlockIndex": 6072,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "ec4ca45ccce7d7f94ab824a9f4840c3a85731c8bc70ba21953992009214c7e1d",
          "connected": true,
          "address": "34.219.73.212:49030",
          "outbound": false
        },
        {
          "proTxHash": "895cb52efac54f92ed726ad9da15fd6a8c94fcabae2f9c41ad81be0c214e0d1e",
          "connected": true,
          "address": "35.88.228.131:46084",
          "outbound": false
        },
      ]
    },
    {
      "llmqType": "llmq_devnet",
      "quorumIndex": 1,
      "pQuorumBaseBlockIndex": 6073,
      "quorumHash": "000000b1823c0d77dcfbd6a11404ddbcfc259a503aec9a7aadfdfabc7602a7be",
      "pindexTip": 6082,
      "quorumConnections": [
        {
          "proTxHash": "bfcfc61bb222d4744276a3591df2239c540da36f4638ce234a4490ac35254607",
          "connected": true,
          "address": "54.68.152.187:54748",
          "outbound": false
        },
        {
          "proTxHash": "93b2f08a18d9ac165aad16d66d8492721f4556e53d3a2d28b045cc992ce65725",
          "connected": true,
          "address": "54.191.24.26:38528",
          "outbound": false
        },
      ]
    }
  ],
  "minableCommitments": [
    {
      "version": 1,
      "llmqType": 1,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    },
    {
      "version": 1,
      "llmqType": 4,
      "quorumHash": "0000003d2100d243f73bd65b392f21a1023f7dfecc54505511c897a5896c0c2c",
      "quorumIndex": 0,
      "signersCount": 0,
      "signers": "00000000000000000000000000",
      "validMembersCount": 0,
      "validMembers": "00000000000000000000000000",
      "quorumPublicKey": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "quorumVvecHash": "0000000000000000000000000000000000000000000000000000000000000000",
      "quorumSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "membersSig": "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    }
  ]
}
```

### Quorum Sign

The `quorum sign` RPC requests threshold-signing for a message.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID. Signing request ids for ChainLocks and InstantSend are calculated as described in:<br> \* The [ChainLocks DIP](https://github.com/dashpay/dips/blob/master/dip-0008.md#signing-attempts)<br> \* The [LLMQ InstantSend DIP](https://github.com/dashpay/dips/blob/master/dip-0010.md#finalization-and-creation-of-islock-messages).

> 📘 
>
> For general signing requests, any 32 byte hex string can be provided as the request id. Note that if a quorum hash is not specified in parameter 4, a quorum will be selected automatically based in part on this value.

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Parameter #4---quorum hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`quorumHash` | string (hex) | Optional<br>(0 or 1) | The quorum identifier

*Parameter #5---submit*

Name | Type | Presence | Description
--- | --- | --- | ---
`submit` | bool | Optional<br>(0 or 1) | **Added in Dash Core 0.17.0**<br><br>Submits the signature share to the network if this is `true` (default). Returns an object containing the signature share if this is `false`.

*Result---(if submit = `true`) status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Result---(if submit = `false`) signature share JSON object*

Name | Type | Presence | Description
--- | --- | --- | ---
result | object | Required<br>(exactly 1) | JSON object containing signature share details
→<br>`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The quorum identifier
→<br>`quorumMember` | number | Required<br>(exactly 1) | Which quorum member created this signature share
→<br>`id` | string (hex) | Required<br>(exactly 1) | Signing request ID
→<br>`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message that was signed
→<br>`signHash` | string (hex) | Required<br>(exactly 1) | Hash of `llmqType`, `quorumHash`, `id`, and `msgHash`
→<br>`signature` | string (hex) | Required<br>(exactly 1) | Signature share

*Example from Dash Core 0.17.0*

Submit signature share to network (default):

```bash
dash-cli -testnet quorum sign 1 \
  "abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234abcd1234" \
  "51c11d287dfa85aef3eebb5420834c8e443e01d15c0b0a8e397d67e2e51aa239"
```

Result:
```json
false
```

Return signature share object: 

```bash
dash-cli -testnet quorum sign 100 \
  "0000000000000000000000000000000000000000000000000000000000000001" \
  "0000000000000000000000000000000000000000000000000000000000000002" \
  "53d959f609a654cf4e5e3c083fd6c47b7ec6cb73af4ac7329149688337b8ef9a" false
```

Result:
```json
{
  "llmqType": 100,
  "quorumHash": "53d959f609a654cf4e5e3c083fd6c47b7ec6cb73af4ac7329149688337b8ef9a",
  "quorumMember": 2,
  "id": "0000000000000000000000000000000000000000000000000000000000000001",
  "msgHash": "0000000000000000000000000000000000000000000000000000000000000002",
  "signHash": "39458221939396a45a2e348caada646eabd52849990827d40e33eb1399097b3c",
  "signature": "9716545a0c28ff70900a71fabbadf3c13e4ae562032122902405365f1ebf3da813c8a97d765eb8b167ff339c1638550c13822217cf06b609ba6a78f0035684ca7b4afdb7146ce74a30cfb6770f852aade8c27ffec67c79f85be31964573fb51c"
}
```


### Quorum GetRecSig

The `quorum getrecsig` RPC gets the recovered signature for a previous threshold-signing message request.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---recovered signature*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | Recovered signature details
→<br>`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The block hash of the quorum  
→<br>`id` | string (hex) | Required<br>(exactly 1) | The signing session ID
→<br>`msgHash` | string (hex) | Required<br>(exactly 1) | The message hash
→<br>`sig` | string (hex) | Required<br>(exactly 1) | The recovered signature
→<br>`hash` | string (hex) | Required<br>(exactly 1) | The hash of the recovered signature

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet quorum getrecsig 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
```json
{
  "llmqType": 1,
  "quorumHash": "00000000008344da08e4d262773ea545472fbf625f78b3ebfe5fc067c33b1d22",
  "id": "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f",
  "msgHash": "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4",
  "sig": "1365171c408d686af2ca8f5fae91cdf9cf0b5eec60b0b161b9288a1c68e2cd68f225495a787415c924c5953a6282d131178aa6baf4c2673d19549fc627740cf71d295f8a38b9970525a7f248d54a548e16da285b5c1f3ec0740ad40edbcc8615",
  "hash": "d9b7f7904746fbb3eeaeec36fadc79b351f6a854cd22ee9e607592aee972fcb2"
}
```

### Quorum HasRecSig

The `quorum hasrecsig` RPC checks for a recovered signature for a previous threshold-signing message request.

> 🚧 Regtest Network Only
>
> Note: Used for RegTest testing only.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet quorum hasrecsig 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
```text
true
```

### Quorum IsConflicting

The `quorum isconflicting` RPC checks if there is a conflict for a threshold-signing message request.

> 🚧 Regtest Network Only
>
> Note: Used for RegTest testing only.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on success

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet quorum isconflicting 1 \
  "e980ebf295b42f24b03321ffb255818753b2b211e8c46b61c0b6fde91242d12f" \
  "907087d4720850e639b7b5cc41d7a6d020e5a50debb3bc3974f0cb3d7d378ea4"
```

Result:
```text
false
```

### Quorum MemberOf

The [`quorum` RPC](../api/remote-procedure-calls-evo.md#quorum) checks which quorums the given masternode is a member of.

*Parameter #1---proTxHash*

Name | Type | Presence | Description
--- | --- | --- | ---
proTxHash | string | Required<br>(exactly 1) | ProTxHash of the masternode.

*Parameter #2---scanQuorumsCount*

Name | Type | Presence | Description
--- | --- | --- | ---
scanQuorumsCount | number | Optional | Number of quorums to scan for. If not specified, the active quorum count for each specific quorum type is used.

*Result---list of quorums the masternode is a member of*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | Array of objects | Required<br>(exactly 1) | Array containing info for quorum's the masternode belongs to
→<br>Quorum | object | Required<br>(0 or more) | An object describing quorum details
→ →<br>`height` | number | Required<br>(exactly 1) | Block height of the quorum
→ →<br>`type` | string | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types)
→ →<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→ →<br>`minedBlock` | string (hex) | Required<br>(exactly 1) | The hash of the block that established the quorum
→ →<br>`quorumPublicKey` | string (hex) | Required<br>(exactly 1) | Quorum public key
→ →<br>`isValidMember` | bool | Required<br>(exactly 1) | Indicates if the member is valid
→ →<br>`memberIndex` | number | Required<br>(exactly 1) | Index of the member within the quorum

*Example from Dash Core 0.15.0*

```bash
dash-cli -testnet quorum memberof 1 \
  39c07d2c9c6d0ead56f52726b63c15e295cb5c3ecf7fe1fefcfb23b2e3cfed1f 1
```

Result:
```json
[
  {
    "height": 72000,
    "type": "llmq_400_60",
    "quorumHash": "0000000007697fd69a799bfa26576a177e817bc0e45b9fcfbf48b362b05aeff2",
    "minedBlock": "00000000014d910dca80944b52aa3f522d5604254043b8354d641912aace4343",
    "quorumPublicKey": "03a3fbbe99d80a9be8fc59fd4fe43dfbeba9119b688e97493664716cdf15ae47fad70fea7cb93f20fba10d689f9e3c02",
    "isValidMember": true,
    "memberIndex": 80
  }
]
```

*See also: none*

### Quorum ListExtended

The `quorum listextended` RPC returns an extended list of on-chain quorums.

*Parameter #1---height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | numeric | Optional<br>(0 or 1) | The height index. Will list active quorums at tip if "height" is not specified.

*Result---list extended*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing an extended list of on-chain quorums
→<br>`quorumName` | array of objects | Required<br>(exactly 1) | List of quorum details per some quorum type
→→<br>`xxxx` | object | Required<br>(exactly 1) | Quorum hash. Note: most recent quorums come first
→→→<br>`creationHeight` | numeric | Required<br>(exactly 1) | Block height where the DKG started
→→→<br>`quorumIndex` | numeric | Required<br>(exactly 1) | Quorum index (applicable only to rotated quorums)
→→→<br>`minedBlockHash` | string | Required<br>(exactly 1) | Blockhash where the commitment was mined.
→→→<br> `numValidMembers` | numeric | Required<br>(exactly 1) | The total of valid members.
→→→<br> `healthRatio` | numeric | Required<br>(exactly 1) | The ratio of healthy members to quorum size. Range [0.0 - 1.0].

*Example from Dash Core 18.2.0*

```bash
dash-cli quorum listextended 1800330
```
Result:
```
{
  "llmq_60_75": [
    {
      "000000000000003892d192fe4c76865c398b117e6d28f4e5978f5fea07a392a0": {
        "quorumIndex": 0,
        "creationHeight": 1800288,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001e209abbe9ddf3d9d6f413ec76920de87071dd50ea90b38766": {
        "quorumIndex": 1,
        "creationHeight": 1800289,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000019273ab7f86e2a4e52779141a01373909cd058c48c23849bee": {
        "quorumIndex": 2,
        "creationHeight": 1800290,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000022b4e1fba61c99235ae6f233a76dded4c4ddc2919680cb54e8": {
        "quorumIndex": 3,
        "creationHeight": 1800291,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000016c2fe9dc3a0f3f66325351667b42985e46ab15a87dbe64df5": {
        "quorumIndex": 4,
        "creationHeight": 1800292,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002ef4d32dc86ec7cad427bd187991c868fd4cccbf62732cbbfb": {
        "quorumIndex": 5,
        "creationHeight": 1800293,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000d3cdd5dce4bbe7b327112bd5b637f96cb64cf07faedf7833b": {
        "quorumIndex": 6,
        "creationHeight": 1800294,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000022833d76c3ea60bb0f9cec5a9aee66012e3310561e7fff273": {
        "quorumIndex": 7,
        "creationHeight": 1800295,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000da0750d6d6df6c9aff6b1b37333a485c9e2a590943bf3a300": {
        "quorumIndex": 8,
        "creationHeight": 1800296,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000014d22d5fff6cc3645e3144b1831425a3fd19e376b8ae1fd14": {
        "quorumIndex": 9,
        "creationHeight": 1800297,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "0000000000000018193220b520572d4f9a622a6767358b2af5fd721a57dab2f0": {
        "quorumIndex": 10,
        "creationHeight": 1800298,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002a94bbb787ddf45687b5982e894157884067d6c5c8ed721495": {
        "quorumIndex": 11,
        "creationHeight": 1800299,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000ddc0112c3d2c625127ccac4311cb8031759a8238ed9e84d8b": {
        "quorumIndex": 12,
        "creationHeight": 1800300,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "000000000000002bb301832bf8d48ccf67256a7d470cb89348d3fb22bc75467d": {
        "quorumIndex": 13,
        "creationHeight": 1800301,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001439d25b7cec34aabd39454956ca0ef632a33ee1923b63bcb5": {
        "quorumIndex": 14,
        "creationHeight": 1800302,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000016ca53419e336df1f57c22e22e7347eb6ee185911eeb0eadbc": {
        "quorumIndex": 15,
        "creationHeight": 1800303,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "000000000000002f80f43d095ffd11397d69414b72dc3b22ca471ac7a18aa2d0": {
        "quorumIndex": 16,
        "creationHeight": 1800304,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "00000000000000207de79166196c12d914f69fa1c0895b9d51dfc66de1d670e6": {
        "quorumIndex": 17,
        "creationHeight": 1800305,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "0000000000000000d71b16a4160d5c9cc7751593be3c16328ddb2eee95957f13": {
        "quorumIndex": 18,
        "creationHeight": 1800306,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 57,
        "healthRatio": "0.95"
      }
    },
    {
      "0000000000000019530a9727b0a44d5551451a7d78608be53fdedcf3c9d8a443": {
        "quorumIndex": 19,
        "creationHeight": 1800307,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000027f61ba67222e4ab8a0c7713d0d2c38344c1f7159541ae663a": {
        "quorumIndex": 20,
        "creationHeight": 1800308,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000121db16ad865fa36be61404a78bba17e372df7e12597941796": {
        "quorumIndex": 21,
        "creationHeight": 1800309,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "000000000000002c024394c7e0fdc031d7904d538dd6e3688d765dd1dac62172": {
        "quorumIndex": 22,
        "creationHeight": 1800310,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001ca51cd8d63690283d2afa9ccb69e987c146439ecd25e8b8ae": {
        "quorumIndex": 23,
        "creationHeight": 1800311,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000096c70b0cd1fed28e481f1b74076c8591450357fff57a0cd1e": {
        "quorumIndex": 24,
        "creationHeight": 1800312,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000028d654215c87a18e86966d25d3d57a62e02ce5bb8a16407aa9": {
        "quorumIndex": 25,
        "creationHeight": 1800313,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000026116f41a22ef0c5c5442ebbd31e9226ea218ebaf2bef09e68": {
        "quorumIndex": 26,
        "creationHeight": 1800314,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002aa07eb158ab1a70d27a382921de2b940eab09b1d175da58f3": {
        "quorumIndex": 27,
        "creationHeight": 1800315,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000028f04886bb10557f2b62373bbeecc54e40b1306fc2960bf6fc": {
        "quorumIndex": 28,
        "creationHeight": 1800316,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001f57ef24b442689b83f459291f441f63d1d152f18669759bdf": {
        "quorumIndex": 29,
        "creationHeight": 1800317,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 59,
        "healthRatio": "0.98"
      }
    },
    {
      "000000000000000b1243e19772259b34f29a57bc807ebb155fbb68791af37610": {
        "quorumIndex": 30,
        "creationHeight": 1800318,
        "minedBlockHash": "0000000000000046e498ceae65713b6daf142db12ccb012fac488acbfd84aad5",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002c406fb450d718b989b951f3c230839062d929e1af7e3cbaee": {
        "quorumIndex": 31,
        "creationHeight": 1800031,
        "minedBlockHash": "000000000000002c9242df9a454e7e0aad7f7d4bf40c84c7adacc0e99c5d9a80",
        "numValidMembers": 60,
        "healthRatio": "1.00"
      }
    }
  ],
  "llmq_400_60": [
    {
      "000000000000003892d192fe4c76865c398b117e6d28f4e5978f5fea07a392a0": {
        "creationHeight": 1800288,
        "minedBlockHash": "00000000000000121db16ad865fa36be61404a78bba17e372df7e12597941796",
        "numValidMembers": 400,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002a19e055ca3767d6200b5b8a872e978610209721e8520c3916": {
        "creationHeight": 1800000,
        "minedBlockHash": "0000000000000008dcd194b9702bbf8fab74cf150ca6b2ec54377874839a0f60",
        "numValidMembers": 400,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000017e56702f42874c51b1869e5225f50765cabe9f1ee0b33fa5b": {
        "creationHeight": 1799712,
        "minedBlockHash": "0000000000000026f22894d7d24de94e57f2683cefae3c6fdb4e043e26750711",
        "numValidMembers": 399,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001f1672260b4edac3e5f278e55c09dc4d51e93b9a143f4bcc23": {
        "creationHeight": 1799424,
        "minedBlockHash": "000000000000002de4624c6476c3533bace5b8811a9ecf48ddeae624f94214c5",
        "numValidMembers": 400,
        "healthRatio": "1.00"
      }
    }
  ],
  "llmq_400_85": [
    {
      "000000000000002a19e055ca3767d6200b5b8a872e978610209721e8520c3916": {
        "creationHeight": 1800000,
        "minedBlockHash": "0000000000000008dcd194b9702bbf8fab74cf150ca6b2ec54377874839a0f60",
        "numValidMembers": 397,
        "healthRatio": "0.99"
      }
    },
    {
      "000000000000001f1672260b4edac3e5f278e55c09dc4d51e93b9a143f4bcc23": {
        "creationHeight": 1799424,
        "minedBlockHash": "000000000000002de4624c6476c3533bace5b8811a9ecf48ddeae624f94214c5",
        "numValidMembers": 400,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000003972108d2bd0d2e3ef5193b2709ab9f1938d91b446d52bbf1a": {
        "creationHeight": 1798848,
        "minedBlockHash": "00000000000000443ccd4f40d534dbc0031a505becf13ad14d8f3c15534db40d",
        "numValidMembers": 399,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000021318ce8dec7d7239bc4ffb407b51e7f75f89116348ab7f63d": {
        "creationHeight": 1798272,
        "minedBlockHash": "0000000000000025e4189f7d4ece51b344fd50f5660352e15d2af45e2476adde",
        "numValidMembers": 399,
        "healthRatio": "1.00"
      }
    }
  ],
  "llmq_100_67": [
    {
      "00000000000000096c70b0cd1fed28e481f1b74076c8591450357fff57a0cd1e": {
        "creationHeight": 1800312,
        "minedBlockHash": "0000000000000017553cc929c0bcd570b444f5caa46bb1c53ac9b6b4b587a6b1",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000003892d192fe4c76865c398b117e6d28f4e5978f5fea07a392a0": {
        "creationHeight": 1800288,
        "minedBlockHash": "000000000000000ddc0112c3d2c625127ccac4311cb8031759a8238ed9e84d8b",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000023d18e24d490138bc33061fb5d354d6a93b7e8655bb7fb5cd5": {
        "creationHeight": 1800264,
        "minedBlockHash": "000000000000002d698057b2a3424feaba9f5e2d2a3f8e18b0df3eda7a6d7ae1",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001410a901c3afa742d883c9fdabce4bc5ae511e5332b6ba4a2c": {
        "creationHeight": 1800240,
        "minedBlockHash": "000000000000001efdc8e694bd889398686a57859d2063880b9b22ff80e59992",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001e7c54a085503e8d8d50ad7255298a490db86d94d2190025b3": {
        "creationHeight": 1800216,
        "minedBlockHash": "000000000000002bab372f9a27d68cf1f3bf4a2c393d2228b8a60dea0d7069b0",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000012000e6134e98fdae4c5174e29fb4e92b97f72b5b31de8b22e": {
        "creationHeight": 1800192,
        "minedBlockHash": "00000000000000266fd7587535728e4f10a4aabdc6aeddce425166ff62498ee8",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000d7bfac2eb39c8ca7e34e406f10d34309e383bf6cd12955f33": {
        "creationHeight": 1800168,
        "minedBlockHash": "000000000000001ee28ea86d5682ea13ae10cfda81a5ec702def62a7190448fa",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000ec2e9281eb00e49d28794b7aa0e7bc2ca2087446f8bd950d2": {
        "creationHeight": 1800144,
        "minedBlockHash": "000000000000001aa3571b0b3433bf3d40e2f7065c9c62a7016cf9c6cbd1225d",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000df63557d980360d610b802fd3929444cadd2aaf052d11c80c": {
        "creationHeight": 1800120,
        "minedBlockHash": "000000000000000147ecaf84980dcceaee55053536c21c91906e9068641dbb8f",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000014ce6fe9b7c4c4237d21954e9f5bce96b0fa87ed6e780dea10": {
        "creationHeight": 1800096,
        "minedBlockHash": "00000000000000286fc19ecbb6f25c69cba2ceadc9064e5534c4efb252599ad3",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000061da2087af9502da3b7d8a443569b93dbe130e7a5e22bdab1": {
        "creationHeight": 1800072,
        "minedBlockHash": "0000000000000008866e1a7ee16a99c4baf59dd311a041314c9f1a6c2bd99666",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001e63afa146c3b3af04e11b103bf431b6795af6f27fa7e93b27": {
        "creationHeight": 1800048,
        "minedBlockHash": "0000000000000031106ea328f2aa48fd86f689dfb84376e7f3c6f9a71c5ff8e9",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000020d38f6a522b60b098a83ae65f29fc8c0ce998aad9a551117d": {
        "creationHeight": 1800024,
        "minedBlockHash": "0000000000000018c126af1636f8d82fc48bf2f919992d709f423a3d71cfa9ac",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000002a19e055ca3767d6200b5b8a872e978610209721e8520c3916": {
        "creationHeight": 1800000,
        "minedBlockHash": "000000000000000de079e14e271ad9714ff33adc5636922ba943a65e21b90a8a",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000383e3d518a7249e65ab5b642ea01456bd920124ec4985c56a": {
        "creationHeight": 1799976,
        "minedBlockHash": "000000000000002738b4c991238340cfe94e08a5ca88144ffbc90272d0f5c853",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000038267cd98aa082c4e43521edc6feaff53af21a8f134c1ed05f": {
        "creationHeight": 1799952,
        "minedBlockHash": "00000000000000064636f2fc5338f6d34033928614487e055cd3a54e7933b8f9",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000000acb20bef7d6a0a4b4b10a276c64d631d5c86fae05a33dfe0b": {
        "creationHeight": 1799928,
        "minedBlockHash": "0000000000000010fc8ee7e13fc198da76b25c598a59708327f44013e4e78aa0",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000005b452484413d52b186bf8a24174bb83ae673d03c04d9b3cc1": {
        "creationHeight": 1799904,
        "minedBlockHash": "000000000000000cb6c4587f83021b38cab2b1be05248ae8e06525da2078101a",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000013978d488be84a2b1a9a3fd936a1be6a250e4cdd8de0e7318e": {
        "creationHeight": 1799880,
        "minedBlockHash": "0000000000000021d6f2991e2c47875b7aa906a63f78457a1e7ee458962ba65d",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000008cc627164e04430716df733f61dfe01795e78b4bf60051294": {
        "creationHeight": 1799856,
        "minedBlockHash": "0000000000000010a8367e8d02a1774d3c54b075e2016e57ce90ef8a9426fcfa",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000003497f267d65d3a29dc7d79b2925833bc92dbaf5096572427d8": {
        "creationHeight": 1799832,
        "minedBlockHash": "000000000000000374f39b533e45c86ad8109140412b3ac4872f88acb1505799",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "0000000000000008556be7271f9942e38cbfe85ad8423b8c134fe0edbbd2c08e": {
        "creationHeight": 1799808,
        "minedBlockHash": "000000000000002309807a942f1e7ec628e92283df34d67db04e82c5c3907f21",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "00000000000000276299f465ea5ecd680b4f6a6c1cf63a213f4ad98c5974ba4b": {
        "creationHeight": 1799784,
        "minedBlockHash": "00000000000000129cd44a7f7a824116156a325f61a7a69822ebd49c18457d11",
        "numValidMembers": 100,
        "healthRatio": "1.00"
      }
    },
    {
      "000000000000001d6f064000bf1258786d73dc87a8bd2bad3913483ea3b9f3aa": {
        "creationHeight": 1799760,
        "minedBlockHash": "000000000000001b7b5a5653a1ef67ad355321c4f2fccd93f2b4c56605fc2fea",
        "numValidMembers": 99,
        "healthRatio": "0.99"
      }
    }
  ]
}

```

*See also: none*

### Quorum RotationInfo

The `quorum rotationinfo` RPC returns  quorum rotation information. The response is a JSON representation of the data that would be returned in a [`qrinfo` message](../reference/p2p-network-data-messages.md#qrinfo).

*Parameter #1---block request hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`blockRequestHash` | string (hex) | Required<br>(exactly 1) | The block hash of the request

*Parameter #2---extra share*

Name | Type | Presence | Description
--- | --- | --- | ---
`extraShare` | bool | Optional<br>(0 or 1) | Request an extra share (default: false). This extra share would support validation against the previous set of LLMQs.

*Parameter #3---base block hashes number*

Name | Type | Presence | Description
--- | --- | --- | ---
`baseBlockHash...` | string (hex) | Optional<br>(0 or more) | Block hashes (default: "")

*Result---rotation info*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing quorum rotation info
→<br>`extraShare` | bool | Required<br>(exactly 1) | Whether or not an extra share is included
→<br>`quorumSnapshotAtHMinusC` | object | Required<br>(exactly 1) | Quorum snapshot at `h-c`
→<br>`quorumSnapshotAtHMinus2C` | object | Required<br>(exactly 1) | Quorum snapshot at `h-2c` 
→<br>`quorumSnapshotAtHMinus3C` | object | Required<br>(exactly 1) | Quorum snapshot at `h-3c`
→<br>`mnListDiffTip` | object | Required<br>(exactly 1) | Masternode list diff for the tip
→<br>`mnListDiffH` | object | Required<br>(exactly 1) | Masternode list diff for `h`
→<br>`mnListDiffAtHMinusC` | object | Required<br>(exactly 1) | Masternode list diff for `h-c`
→<br>`mnListDiffAtHMinus2C` | object | Required<br>(exactly 1) | Masternode list diff for `h-2c` 
→<br>`mnListDiffAtHMinus3C` | object | Required<br>(exactly 1) | Masternode list diff for `h-3c`
→<br>`blockHashList` | array | Required<br>(exactly 1) | Array of block hashes. Returns the last successfully mined quorum per quorumIndex until `blockRequestHash`
→<br>`quorumSnapshotList` | array of objects | Required<br>(exactly 1) | Array of quorum snapshot list objects
→<br>`mnListDiffList` | array of objects | Required<br>(exactly 1) | Array of masternode list diff objects

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet quorum rotationinfo 000001e1ef5f2e2bbc3de3b8b3c554e756ef2b7dcd1eb7552ff48fe319caff4b
```

Result (truncated):
```json
{
  "extraShare": false,
  "quorumSnapshotAtHMinusC": {
    "activeQuorumMembers": [
      true,
      false,...
    ],
    "mnSkipListMode": 1,
    "mnSkipList": [
      7,
      1,
      6,
      7
    ]
  },
  "quorumSnapshotAtHMinus2C": {
    "activeQuorumMembers": [
      true,
      true,...
    ],
    "mnSkipListMode": 1,
    "mnSkipList": [
      5,
      4,
      6,
      9
    ]
  },
  "quorumSnapshotAtHMinus3C": {
    "activeQuorumMembers": [
      true,
      true,...
    ],
    "mnSkipListMode": 1,
    "mnSkipList": [
      4,
      3,
      7
    ]
  },
  "mnListDiffTip": {
    "baseBlockHash": "000008ca1832a4baf228eb1553c03d3a2c8e02399550dd6ea8d65cec3ef23d2e",
    "blockHash": "000001f10408e797a2b8f5dd8a7e5835b7b54c82bf4c7d913bb60a028cb64acb",
    "cbTxMerkleTree": "0100000001e862054f249eb3f84689d7bf5f42e89b1e540bd19feb5d656616e967c61837800101",
    "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff050289070101ffffffff0200c817a8040000001976a914c0aa7affe002c1189d021ea819c2160f7100ef0288ac00ac23fc060000001976a914c0aa7affe002c1189d021ea819c2160f7100ef0288ac0000000046020089070000a0b1aca79a7d78ab800b5146a095e22033513ea6019164b0e46412e953400dd33953a26d62bed490814a65a7e9184094d0294d53676bf08272cc339f2cd41214",
    "deletedMNs": [
    ],
    "mnList": [
      {
        "proRegTxHash": "ef99baa5848b2e2d012db5b0c17958e4ef6578c2c31a60f8cc12225168014ba1",
        "confirmedHash": "000001d855b97191009c5ef8f915895ca2d51105c12df1671cb5faedbbb0f7ef",
        "service": "34.220.68.124:20001",
        "pubKeyOperator": "04bfadc894a7855412800db1941efc5284c0e19dd21512067e01bed98bfd939201e8bffd5de039177ef4ec15aa4c0bd5",
        "votingAddress": "yMPLoqwqfnsTdQTTzcmont2HRkQyUewram",
        "isValid": true
      },...      
    ],
    "deletedQuorums": [
    ],
    "newQuorums": [
      {
        "version": 2,
        "llmqType": 101,
        "quorumHash": "0000021a5928d86124863b0ad62585a6115b354424685c0ecc8adb00f29dd157",
        "quorumIndex": 3,
        "signersCount": 12,
        "signers": "ff0f",
        "validMembersCount": 12,
        "validMembers": "ff0f",
        "quorumPublicKey": "1252d661adab4e272767caa002e3fa1fa99ae95a8f2b75fa3f217801073032da15d3a21a19e6f1a3e1f09212cf87f8ae",
        "quorumVvecHash": "a8719a7be6b82bd052c99bc89a8e1ad831a2d33b2440f5a1cfe66d4be1f6ee8e",
        "quorumSig": "022288b10b1d94457de8312a884d520cf50058675c7f527a50629e27fd191142be594101213402b56f7a7e0736f71b70046c92bc4ad81a08cfecd7f3dbdecaf7050479f0227099c74f0be5ef302dd626701a1359075187fe799033619f6c8bf9",
        "membersSig": "8ef10d202123e5fea80c8c0cd0ad8c4094b605cb977a1e3f9205f7f08fe1da2f1b4c2fa1dcc147ef55eee1bd24bd783513941ae485425400743edc3f2bceaa83b6424e3aa7d4578864a962a2a37066dac4c09ae4fde4569225edec3476b153eb"
      },...
    ],
    "merkleRootMNList": "d30d4053e91264e4b0649101a63e513320e295a046510b80ab787d9aa7acb1a0",
    "merkleRootQuorums": "1412d42c9f33cc7282f06b67534d29d0944018e9a7654a8190d4be626da25339"
  },
  "mnListDiffH": {...},
  "mnListDiffAtHMinusC": {...},
  "mnListDiffAtHMinus2C": {...},
  "mnListDiffAtHMinus3C": {...},
  "blockHashList": [
    "000000956145f9b48231bbb2a7acd54301823f5619854df4487879dff18f2d79",
    "0000002cc74d9300f5d8a5436cfaead69fd1aaf3d68a00e57bd89e878a76a841",
    "0000002911d8f6c21571280953e9e581a6996822fab82adfb766c44e49d050e4",
    "00000064edcdaea4f2962b3a7bf40bcb0aa8ee00a73da86c6bf80ef7c90af0ce"
  ],
  "quorumSnapshotList": [
    {
      "activeQuorumMembers": [
        true,
        true,...
      ],
      "mnSkipListMode": 1,
      "mnSkipList": [
        9,
        1,
        3
      ]
    }
  ],
  "mnListDiffList": [
    {
      "baseBlockHash": "000008ca1832a4baf228eb1553c03d3a2c8e02399550dd6ea8d65cec3ef23d2e",
      "blockHash": "000001a6c183a9ec58e1130f3c745dd7729a793974e7d97a10b2a3cb20e42a0a",
      "cbTxMerkleTree": "010000000178e366554c6cfc0999d1991ba439d4c3b5f62b36f3f4f73c40f6d716f4a55d1a0101",
      "cbTx": "03000500010000000000000000000000000000000000000000000000000000000000000000ffffffff0502c0060101ffffffff0200c817a8040000001976a914c0aa7affe002c1189d021ea819c2160f7100ef0288ac00ac23fc060000001976a914c0aa7affe002c1189d021ea819c2160f7100ef0288ac00000000460200c0060000a0b1aca79a7d78ab800b5146a095e22033513ea6019164b0e46412e953400dd3dc1437d53f3dcdb89ea5503743ea6ba4eba87c8fb2f47d8e12ea07acc1e39692",
      "deletedMNs": [
      ],
      "mnList": [...],
      "deletedQuorums": [
      ],
      "newQuorums": [
        {
          "version": 2,
          "llmqType": 101,
          "quorumHash": "000002132c42566f37b89e90ae92277db8a89fa49bfbd1b2a638f9d10d92e219",
          "quorumIndex": 3,
          "signersCount": 12,
          "signers": "ff0f",
          "validMembersCount": 12,
          "validMembers": "ff0f",
          "quorumPublicKey": "920379ef7f296d9f8c5826c73ad78d026b4bb1dca97c83fb6c4bde23094482be631e375664a65eabd79138ed529e467c",
          "quorumVvecHash": "670e3972eb4f0b42f944fd1c333808ae93d66748f9876e42e91fe503f5dab3b7",
          "quorumSig": "151ee55b5ad68308d0a16ac47b237a6434bf205d80ffe4cbc5a0b84a70401d863cab7137c40edce2a6b92cd09f07c9ac18fd66c45a7077369f9dfc100ea2e5b5a49549e933ce4dafa8a9cbdb718de945fb805a5eb0c3f02c7159a5db6549a4e8",
          "membersSig": "10745b04fa0c164e99b75ff8641c32282468daf928a393f8f98de58b24cffff0faab999b5ffebbb2d804aa6367ca52270ff669041175f6743af534127259b6984fbaae935bd6929e810acb1424b67e4a7af90c64bae477accc88a85ebf3d3891"
        },...
     ],
      "merkleRootMNList": "d30d4053e91264e4b0649101a63e513320e295a046510b80ab787d9aa7acb1a0",
      "merkleRootQuorums": "9296e3c1ac07ea128e7df4b28f7ca8eba46bea433750a59eb8cd3d3fd53714dc"
    }
  ]
}
```

### Quorum SelectQuorum

The `quorum selectquorum` RPC returns information about the quorum that would/should sign a request.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorums](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types) to list:<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---request id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | The request ID

*Result---quorum hash and list of quorum members*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | Array of objects | Required<br>(exactly 1) | Array containing info for quorum's the masternode belongs to
→<br>`quorumHash` | string (hex) | Required<br>(exactly 1) | The hash of the quorum
→→<br>`recoveryMembers` | array | Required<br>(exactly 1) | Array containing ProRegTx hashes
→→→<br>ProRegTx Hash | string (hex) | Required<br>(exactly 1) | The hash of the provider transaction as hex in RPC byte order

*Example from Dash Core 0.16.0*

```bash
dash-cli -testnet quorum selectquorum 1 \
  b95205c3bba72e9edfbe7380ec91fe5a97e16a189e28f39b03c6822757ad1a34
```

Result:
```json
{
  "quorumHash": "00000ba8932486c66ed0742fd6b0f4e65afc75ab1e7886c6ef84580dfb7da34f",
  "recoveryMembers": [
    "0130c115522681b87082db1f45c38423d1a018a8e1559c2491103931e891c220",
    "dcd5dd71c4bd50c76d428f72b4a5731bd819720fbc656fff717548e2fe8cbd09",
    "a25c2f4549da0135411122ee9c2d37e8375577dc97431a282a5c374b4c71463a",
    "a1aaa653e5183d6a4525abfd0a76fc7d6a68393a1c4259117028dfce4fd215e1",
    "4c9eb7849590cca2aa18bf9aeeb1e4196c833740de2b111a7690eb62319b0735",
    "f38b8c5cb6c9e712aeeb150b9591cbdc70e99f9f26c1516955dd506b20dd9876",
    "afe12673c32de351e9f5a29178cd55656f03e64357be872536eb50b059032fe0",
    "651d56765c77b8c16b829a4a68f6d39cab40c913d0d365d7b7fd254ccc6cb2f1",
    "f88d0e5349d0bf7e4426a7461d7931d09f54c13edb6d83306c2521d19eb0b14b",
    "bdba1f169ab1e73c4dc96f4133b337c36907976e26a4612ffa5ae18869eba96c",
    "94044c070f9ce6bdd05c2b655ad2383c8402a74c10e0a9a3099d759b33cb7630",
    "515f77efd5983a765dc5740b0e0d3fae6e867917ca384467b24e31dda68c7369",
    "d1ebecfb816f5b4b5f34c91c0aab9c1b643c8567473e6ee35e02e01c9f2304c0",
    "2755d546b114aaec98589cf5b946e408a8996e4837234d2eee97e1da8c71e9ce",
    "b04b5240a8fc5ae62865dfa2e2558894f4b53d82fe88771e5345407b560d59bc",
    "53750150229202353bfbc3a2c866b993dd33a4c749d8f18ddcb1f5caf7e901ef",
    "7a5d1e05d4772feede8b9e71e17e013f99e77c622f13897b8a96339d6d06e1fc",
    "24f6fae5b5afd001d1046425f38e6ef523140afafc83013468bd31feb343f307",
    "18f2e176adf88043c41b406d0c97a2dd529d5daaca8b8ac49f72e6da30334926",
    "73191708ab5b21cc7ede9b12bc1e79de97ad5c4b9717a4fbf5de0ed1f3a5836a",
    "b57da176c0b6deae786afd318a8e00e351bed0f47ceac28f5b6d3d502f1c68d7",
    "161b2dcf8243162d11065eefd0948cb79d96dfa8ae869e34763a2bbd7d1d5d55",
    "fac81f18b3a968f5f881324d8eb38983f3f892c4999c2f46809c4de620b784d2",
    "42267d2c50a68350c880a488ec25ba0eac4e7cd436eb97c686fe0a6d035d25d3",
    "0be00b051c77fd4b6dac46a63b939f73726dc61dd80616e4573a9465f1aafa93"
  ]
}

```

*See also: none*

### Quorum Verify

> 👍 
> 
> Added in Dash Core 0.17.0

The `quorum verify` RPC tests if a quorum signature is valid for a request id and a message hash.

*Parameter #1---LLMQ Type*

Name | Type | Presence | Description
--- | --- | --- | ---
`llmqType` | number | Required<br>(exactly 1) | [Type of quorum](https://github.com/dashpay/dips/blob/master/dip-0006.md#current-llmq-types):<br>`1` - LLMQ_50_60<br>`2` - LLMQ_400_60<br>`3` - LLMQ_400_85<br>`4` - LLMQ_100_67

*Parameter #2---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #3---message hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`msgHash` | string (hex) | Required<br>(exactly 1) | Hash of the message to be signed

*Parameter #4---signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`signature` | string (hex) | Required<br>(exactly 1) | Quorum signature to verify

*Parameter #5---quorum hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`quorumHash` | string (hex) | Optional<br>(0 or 1) | The quorum identifier. Set to `""` if you want to specify `signHeight` instead.

*Parameter #6---sign height*

Name | Type | Presence | Description
--- | --- | --- | ---
`signHeight` | number | Optional<br>(0 or 1) | The height at which the message was signed. Only works when `quorumHash` is `""`.

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on verification success

*Example from Dash Core 0.17.0*

Verify the provided signature was valid:

```bash
dash-cli -testnet quorum verify 1 \
  "2ceeaa7ff20de327ef65b14de692199d15b67b9458d0ded7d68735cce98dd039" \
  "8b5174d0e95b5642ebec23c3fe8f0bbf8f6993502f4210322871bba0e818ff3b" \
  "99cf2a0deb08286a2d1ffdd2564b35522fd748c8802e561abed330dea20df5cb5a5dffeddbe627ea32cb36de13d5b4a516fdfaebae9886b2f7969a5d112416cf8d1983ebcbf1463a64f7522505627e08b9c76c036616fbb1649271a2773a1653" \
  "000000583a348d1a0a5f753ef98e6a69f9bcd9b27919f10eb1a1c3edb6c79182"
```

Result:
```json
true
```

## VerifyChainLock

> 👍 
> 
> Added in Dash Core 0.17.0

The `verifychainlock` RPC tests if a quorum signature is valid for a ChainLock.

*Parameter #1---block hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`blockhash` | string (hex) | Required<br>(exactly 1) | The block hash of the ChainLock

*Parameter #2---signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`signature` | string (hex) | Required<br>(exactly 1) | The ChainLock signature to verify

*Parameter #3---block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`blockHeight` | number | Optional<br>(0 or 1) | The height of the ChainLock. There will be an internal lookup of `blockHash` if this is not provided.

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on verification success

*Example from Dash Core 0.17.0*

Verify the provided signature was valid:

```bash
dash-cli -testnet verifychainlock \
  "00000036d5c520be6e9a32d3829efc983a7b5e88052bf138f80a2b3988689a24" \
  "97ec34efd1615b84af62495e54024880752f57790cf450ae974b80002440963592d96826e24f109e6c149411b70bb9a0035443752368590adae60365cf4251464e0423c1263e9c56a33eae9be9e9c79a117151b2173bcee93497008cace8d793"
```

Result:
```json
true
```

## VerifyISLock

> 👍 
> 
> Added in Dash Core 0.17.0

The `verifyislock` RPC tests if a quorum signature is valid for an InstantSend Lock.

*Parameter #1---id*

Name | Type | Presence | Description
--- | --- | --- | ---
`id` | string (hex) | Required<br>(exactly 1) | Signing request ID

*Parameter #2---transaction id*

Name | Type | Presence | Description
--- | --- | --- | ---
`txid` | string (hex) | Required<br>(exactly 1) | The transaction id (TXID)

*Parameter #3---signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`signature` | string (hex) | Required<br>(exactly 1) | The InstantSend Lock signature to verify

*Parameter #4---maximum height*

Name | Type | Presence | Description
--- | --- | --- | ---
`maxHeight` | number | Optional<br>(0 or 1) | The maximum height to search quorums from

*Result---status*

Name | Type | Presence | Description
--- | --- | --- | ---
result | bool | Required<br>(exactly 1) | True or false depending on verification success

*Example from Dash Core 0.17.0*

Verify the provided signature was valid:

```bash
dash-cli -testnet verifyislock \
  "d0b1a9c70fdfff6bf7f6cbe3d1fe33a4ca44ceb17059b6381a4ac25d9c9b6495" \
  "8b5174d0e95b5642ebec23c3fe8f0bbf8f6993502f4210322871bba0e818ff3b"
```

Result:
```json
false
```