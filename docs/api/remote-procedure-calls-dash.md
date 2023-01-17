# Dash RPCs

## GetGovernanceInfo

The [`getgovernanceinfo` RPC](#getgovernanceinfo) returns an object containing governance parameters.

*Parameters: none*

*Result---information about the governance system*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the governance system
→<br>`governanceminquorum` | number (int) | Required<br>(exactly 1) | The absolute minimum number of votes needed to trigger a governance action
→<br>`proposalfee` | number (int) | Required<br>(exactly 1) | The collateral transaction fee which must be paid to create a proposal in Dash
→<br>`superblockcycle` | number (int) | Required<br>(exactly 1) | The number of blocks between superblocks
→<br>`superblockmaturitywindow` | number (int) | Required<br>(exactly 1) | The superblock trigger creation window
→<br>`lastsuperblock` | number (int) | Required<br>(exactly 1) | The block number of the last superblock
→<br>`nextsuperblock` | number (int) | Required<br>(exactly 1) | The block number of the next superblock

*Example from Dash Core 18.1.0*

``` bash
dash-cli -testnet getgovernanceinfo
```

Result:
``` json
{
  "governanceminquorum": 1,
  "proposalfee": 1.00000000,
  "superblockcycle": 24,
  "superblockmaturitywindow": 24,
  "lastsuperblock": 827256,
  "nextsuperblock": 827280
}
```

*See also:*

* [GObject](#gobject): provides a set of commands for managing governance objects and displaying information about them.

**<span id="getprivatesendinfo"></span>**
## GetCoinJoinInfo

The [`getcoinjoininfo` RPC](#getcoinjoininfo) returns an object containing an information about CoinJoin settings and state (previously named `getprivatesendinfo` prior to Dash Core 0.17.0).

*Parameters: none*

*Result---(for regular nodes) information about the pool*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the pool
→<br>`enabled` | bool | Required<br>(exactly 1) | Whether CoinJoin functionality is enabled
→<br>`multisession` | bool | Required<br>(exactly 1) | Whether CoinJoin multisession option is enabled
→<br>`max_sessions` | number (int) | Required<br>(exactly 1) | How many parallel sessions can there be at once
→<br>`max_rounds` | number (int) | Required<br>(exactly 1) | How many rounds to process
→<br>`max_amount` | number (int) | Required<br>(exactly 1) | How many DASH to keep processed
→<br>`max_denoms` | number (int) | Required<br>(exactly 1) | **Removed in Dash Core 0.16.0**<br>How many inputs of each denominated amount to create
→<br>`denoms_goal` | number (int) | Required<br>(exactly 1) | _Added in Dash Core 0.16.0_<br>How many inputs of each denominated amount to target
→<br>`denoms_hardcap` | number (int) | Required<br>(exactly 1) | _Added in Dash Core 0.16.0_<br>Maximum limit of how many inputs of each denominated amount to create
→<br>`queue_size` | number (int) | Required<br>(exactly 1) | How many queues there are currently on the network
→<br>`running` | bool | Required<br>(exactly 1) | Whether CoinJoin is currently running
→<br>`sessions` | array of json objects | Required<br>(exactly 1) | Information about session(s)
→ →<br>Session | object | Optional<br>(1 or more) | Information for a session
→ → →<br>`protxhash` | string | Required<br>(exactly 1) | The ProTxHash of the masternode
→ → →<br>`outpoint` | string (txid-index) | Required<br>(exactly 1) | The outpoint of the masternode
→ → →<br>`service` | string (host:port) | Required<br>(exactly 1) | The IP address and port of the masternode
→ → →<br>`denomination` | number (int) | Required<br>(exactly 1) | The denomination of the session (in DASH)
→ → →<br>`state` | string | Required<br>(exactly 1) | Current state of the session
→ → →<br>`entries_count` | number (int) | Required<br>(exactly 1) | The number of entries in the session
→<br>`keys_left` | number (int) | Required<br>(exactly 1) | How many new keys are left since last automatic backup
→<br>`warnings` | string | Optional<br>(exactly 1) | Any warnings

*Result---(for masternodes) information about the pool*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the pool
→<br>`queue_size` | number (int) | Required<br>(exactly 1) | How many queues there are currently on the network
→<br>`denomination` | number (int) | Required<br>(exactly 1) | The denomination of the session (in DASH)
→<br>`state` | string | Required<br>(exactly 1) | Current state of the session
→<br>`entries_count` | number (int) | Required<br>(exactly 1) | The number of entries in the session

*Example from Dash Core 0.17.0 (regular node)*

``` bash
dash-cli -testnet getcoinjoininfo
```

Result:
``` json
{
  "enabled": true,
  "multisession": true,
  "max_sessions": 4,
  "max_rounds": 16,
  "max_amount": 2000,
  "denoms_goal": 50,
  "denoms_hardcap": 300,
  "queue_size": 3,
  "running": true,
  "sessions": [
    {
      "protxhash": "0515c9a411df0f1bd9940d9a2e4f6d739c29c52fc8c045c383f1ff6acc87c7b7",
      "outpoint": "0a6520a6ef523de71fd0ca70441e1fd648483f094442d986b24e2c9391be61cf-29",
      "service": "54.170.119.85:26216",
      "denomination": 10.00010000,
      "state": "QUEUE",
      "entries_count": 0
    }
  ],
  "keys_left": 998,
  "warnings": ""
}
```

*See also: none*

## GetSuperblockBudget

The [`getsuperblockbudget` RPC](#getsuperblockbudget) returns the absolute maximum sum of superblock payments allowed.

*Parameter #1---block index*

Name | Type | Presence | Description
--- | --- | --- | ---
index | number (int) | Required<br>(exactly 1) | The superblock index

*Result---maximum sum of superblock payments*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The absolute maximum sum of superblock payments allowed, in DASH

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getsuperblockbudget 7392
```

Result:
``` text
367.20
```

*See also:*

* [GetGovernanceInfo](#getgovernanceinfo): returns an object containing governance parameters.

## GObject

The [`gobject` RPC](#gobject) provides a set of commands for managing governance objects and displaying information about them.

### GObject Check

The `gobject check` RPC validates governance object data (_proposals only_).

*Parameter #1---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | The data (hex) of a governance proposal object

*Result---governance object status*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Object containing status
→<br>`Object Status` | string | Required<br>(exactly 1) | Status of the governance object

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject check 7b22656e645f65706f6368223a3135363034353730\
35352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22796\
4354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061\
796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333\
439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result:
``` json
{
  "Object status": "OK"
}
```

### GObject Count

The `gobject count` RPC returns the count of governance objects and votes.

*Parameter #1---mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Optional<br>(exactly 1) | Result return format:<br>`json` (default)<br>`all` - Default before Dash Core 0.12.3 (for backwards compatibility)

**Command Mode - `json`**

*Result---count of governance objects and votes*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>`objects_total` | int | Required<br>(exactly 1) | Total object count
→<br>`proposals` | int | Required<br>(exactly 1) | Proposal count
→<br>`triggers` | int | Required<br>(exactly 1) | Trigger count
→<br>`other` | int | Required<br>(exactly 1) | Non-proposal/trigger count
→<br>`erased` | int | Required<br>(exactly 1) | Erased count
→<br>`votes` | int | Required<br>(exactly 1) | Vote count

*Example from Dash Core 0.14.0 (mode: `json`/default)*

``` bash
dash-cli -testnet gobject count
```

Result (wrapped):
``` json
{
  "objects_total": 3,
  "proposals": 3,
  "triggers": 0,
  "other": 0,
  "erased": 4,
  "votes": 18
}
```

**Command Mode - `all`**

*Result---count of governance objects and votes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The count of governance objects and votes

*Example from Dash Core 0.14.0 (mode: `all`)*

``` bash
dash-cli -testnet gobject count all
```

Result (wrapped):
``` text
Governance Objects: 177 (Proposals: 177, Triggers: 0, Other: 0; Erased: 5), \
Votes: 9680
```

### GObject Deserialize

The `gobject deserialize` RPC deserializes a governance object from a hex string to JSON.

*Parameter #1---object data (hex)*

Name | Type | Presence | Description
--- | --- | --- | ---
`hex_data` | string (hex) | Required<br>(exactly 1) | The data (hex) of a governance object

**Results**

The result output varies depending on the type of governance object being
deserialized. Examples are shown below for both proposal and trigger object types.

**Result - Proposal**

*Result---governance proposal object deserialized to JSON*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Array of governance objects
→ →<br>`end_epoch` | string | Required<br>(exactly 1) | Governance object info as string
→ →<br>`name` | string (hex) | Required<br>(exactly 1) | Proposal name
→ →<br>`payment_address` | string (hex) | Required<br>(exactly 1) | Proposal payment address.<br>**_Support for P2SH addresses (e.g. multisig) added in Dash Core v18.0.0._**
→ →<br>`payment_amount` | string | Required<br>(exactly 1) | Proposal payment amount
→ →<br>`start_epoch` | string (hex) | Required<br>(exactly 1) | Proposal start
→ →<br>`type` | int | Required<br>(exactly 1) | Object type
→ →<br>`url` | string | Required<br>(exactly 1) | Proposal URL

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject deserialize 7b22656e645f65706f6368223a313536303435\
373035352c226e616d65223a2274657374222c227061796d656e745f61646472657373223a22\
7964354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c2270\
61796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a31353630343533\
3439302c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result:
``` json
{
  "end_epoch": 1560457055,
  "name": "test",
  "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
  "payment_amount": 5,
  "start_epoch": 1560453490,
  "type": 1,
  "url": "http://test.com"
}
```

**Result - Trigger**

*Result---governance trigger object deserialized to JSON*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Array of governance objects
→ →<br>`event_block_height` | int | Required<br>(exactly 1) | Block height to activate trigger
→ →<br>`payment_addresses` | string (hex) | Required<br>(exactly 1) | Proposal payment address
→ →<br>`payment_amounts` | string | Required<br>(exactly 1) | Proposal payment amount
→ →<br>`proposal_hashes` | string (hex) | Required<br>(exactly 1) | Proposal hashes
→ →<br>`type` | int | Required<br>(exactly 1) | Object type

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject deserialize 7b226576656e745f626c6f636b5f68656967687\
4223a203131393539322c20227061796d656e745f616464726573736573223a20227954686d6e\
75565a316765516e79776f456147627079333362695435473573587a62222c20227061796d656\
e745f616d6f756e7473223a2022312e3335393631393331222c202270726f706f73616c5f6861\
73686573223a20223836333966636464653131626432373032373663396330333564366435346\
3653962393138323465366466373532636164376464646331616532663734386435222c202274\
797065223a20327d
```

Result (wrapped):
``` json
{
  "event_block_height": 119592,
  "payment_addresses": "yThmnuVZ1geQnywoEaGbpy33biT5G5sXzb",
  "payment_amounts": "1.35961931",
  "proposal_hashes": "8639fcdde11bd270276c9c035d6d54ce9b91824e6df752cad7dddc1ae2f748d5",
  "type": 2
}
```

### GObject Diff

The `gobject diff` RPC Lists governance objects differences since last diff.

*Parameter #1---signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `valid`<br>• `funding`<br>• `delete`<br>• `endorsed`<br>• `all` (_DEFAULT_)

*Parameter #2---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `proposals`<br>• `triggers`<br>• `all` (_DEFAULT_)

*Result---governance objects*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>Governance Object(s) | object | Required<br>(1 or more) | Key: Governance object hash<br>Values: Governance object details
→ →<br>`DataHex` | string (hex) | Required<br>(exactly 1) | Governance object info as hex string
→ →<br>`DataString` | string | Required<br>(exactly 1) | Governance object info as string
→ →<br>`Hash` | string (hex) | Required<br>(exactly 1) | Hash of this governance object
→ →<br>`CollateralHash` | string (hex) | Required<br>(exactly 1) | Hash of the collateral payment transaction
→ →<br>`ObjectType` | number | Required<br>(exactly 1) | Object types:<br>`1` - Unknown<br>`2` - Proposal<br>`3` - Trigger
→ →<br>`CreationTime` | number | Required<br>(exactly 1) | Object creation time as Unix epoch time
→ →<br>`SigningMasternode` | string (hex) | Optional<br>(0 or 1) | Signing masternode's vin (only present in triggers)
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`fLocalValidity` | boolean | Required<br>(exactly 1) | Valid by the blockchain
→<br>`IsValidReason` | string | Required<br>(exactly 1) | `fLocalValidity` error result. Empty if no error returned.
→<br>`fCachedValid` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as a valid and understood governance object (e.g, the serialized data is correct format, etc)
→<br>`fCachedFunding` | boolean | Required<br>(exactly 1) | Minimum network support has been reached for this object to be funded (doesn't mean it will be for sure though)
→<br>`fCachedDelete` | boolean | Required<br>(exactly 1) | Minimum network support has been reached saying this object should be deleted from the system entirely
→<br>`fCachedEndorsed` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as endorsed

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject diff all all
```

Result (truncated):
``` json
{
  "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343533353731222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323634343939222c227061796d656e745f61646472657373223a2279697355653636445352487048504233514245426764574746637068435933626234222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323634343939222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323634343939227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507453571\",\"name\":\"testproposal\",\"payment_address\":\"yisUe66DSRHpHPB3QBEBgdWGFcphCY3bb4\",\"payment_amount\":\"2\",\"start_epoch\":\"1507264499\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507264499\"}]]",
    "Hash": "17c2bd32005c5168a52f9b5caa74d875ee8a6867a6109f36923887ef6c36b301",
    "CollateralHash": "a25c44b57931afd74530ce39741f91456446a8fd794d2f1c58c42d6f492647ad",
    "ObjectType": 1,
    "CreationTime": 1507264499,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  }
}
```

### GObject Get

The `gobject get` RPC returns a governance object by hash.

*Parameter #1---object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | The hash of a governance object

*Result---governance object details*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>`DataHex` | string (hex) | Required<br>(exactly 1) | Governance object info as hex string
→<br>`DataString` | string | Required<br>(exactly 1) | Governance object info as string
→<br>`Hash` | string (hex) | Required<br>(exactly 1) | Hash of this governance object
→<br>`CollateralHash` | string (hex) | Required<br>(exactly 1) | Hash of the collateral payment transaction
→<br>`ObjectType` | number | Required<br>(exactly 1) | Object types:<br>`1` - Unknown<br>`2` - Proposal<br>`3` - Trigger
→<br>`CreationTime` | number | Required<br>(exactly 1) | Object creation time as Unix epoch time
→<br>`FundingResult` | object | Required<br>(exactly 1) | Funding vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`ValidResult` | object | Required<br>(exactly 1) | Object validity vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`DeleteResult` | object | Required<br>(exactly 1) | Delete vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`EndorsedResult` | object | Required<br>(exactly 1) | Endorsed vote details
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`fLocalValidity` | boolean | Required<br>(exactly 1) | Valid by the blockchain
→<br>`IsValidReason` | string | Required<br>(exactly 1) | `fLocalValidity` error result. Empty if no error returned.
→<br>`fCachedValid` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as a valid and understood governance object (e.g, the serialized data is correct format, etc)
→<br>`fCachedFunding` | boolean | Required<br>(exactly 1) | Minimum network support has been reached for this object to be funded (doesn't mean it will be for sure though)
→<br>`fCachedDelete` | boolean | Required<br>(exactly 1) | Minimum network support has been reached saying this object should be deleted from the system entirely
→<br>`fCachedEndorsed` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as endorsed

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject get \
	42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff
```

Result (wrapped):
``` json
{
  "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343339353130222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530343338222c227061796d656e745f61646472657373223a22795668577955345933756456784d5234464b3333556741534a41436831436835516a222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530343338222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530343338227d5d5d",
  "DataString": "[[\"proposal\",{\"end_epoch\":\"1507439510\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250438\",\"payment_address\":\"yVhWyU4Y3udVxMR4FK33UgASJACh1Ch5Qj\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250438\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250438\"}]]",
  "Hash": "42253a7bec554b97a65d2889e6cb9a1cf308b3d47a778c704bf9cdc1fe1bf6ff",
  "CollateralHash": "cb09bd0310c0a67cde9387ad4d8908a7ad9f5d89c5afd58e9332b8bd26a646c7",
  "ObjectType": 1,
  "CreationTime": 1507246694,
  "FundingResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "ValidResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "DeleteResult": {
    "AbsoluteYesCount": 31,
    "YesCount": 31,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "EndorsedResult": {
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0
  },
  "fLocalValidity": true,
  "IsValidReason": "",
  "fCachedValid": true,
  "fCachedFunding": false,
  "fCachedDelete": false,
  "fCachedEndorsed": false
}
```

### GObject Getcurrentvotes

The `gobject getcurrentvotes` RPC gets only current (tallying) votes for a governance object hash (does not include old votes).

*Parameter #1---object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | The hash of a governance object

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>Vote Info | string | Required<br>(1 or more) | Key: vote-hash<br><br>Value: vinMasternode, time, outcome, and signal of the vote

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject getcurrentvotes 78941af577f639ac94440e4855a1ed8f\
  696f1506d1c0bed4f4b68f05be26d3ca
```

Result (truncated):
``` json
{
  "174aaba65982d25a23f437e2a66ec3836146ba7b7ce5b3fe2d5476907f7079d9": "2eab488e3a7b030303de0d18e357ce17a9fc6b8876705d61076bbe923b2e5fc8-1:1509354047:YES:DELETE",
  "444d4d871ec35479804f060c733f516908382642ec2dfce6044a59fcadfdcd60": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1508866932:YES:FUNDING",
  "d49a472c62e9d8105931829fc50ef6c6ce04a230507646ee0eaa615e863ef3a0": "18e496fe85b61ac9a5fcaec1ef683c7e3fc9bce4a83c883608427ecfb1002fca-1:1509117071:YES:DELETE",
  "78442507441d4524d2493b8568d130415c1eb394adb2fe38d6ffeb199115bc5d": "3df7fb192e21c34da99bdd10c34e58ecaf3f3c37d6b2289f0ffedba5050188cc-1:1509312524:YES:DELETE",
  "aa4dc9d3b9e74e8c1ffc725b737d07f8a32e43c64907e4bea19e64a86135f08a": "af9f5646ace92f76b3a01b0abe08716a0a7ded64074c2d2e712c93174b9013d1-1:1508866932:YES:FUNDING",
}
```

### GObject List

The `gobject list` RPC Lists governance objects (can be filtered by signal and/or object type).

*Parameter #1---signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `valid`<br>• `funding`<br>• `delete`<br>• `endorsed`<br>• `all` (_DEFAULT_)

*Parameter #2---type*

Name | Type | Presence | Description
--- | --- | --- | ---
`type` | string (hex) | Optional<br>(exactly 1) | Type of governance object signal: <br>• `proposals`<br>• `triggers`<br>• `all` (_DEFAULT_)

*Result---governance objects*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Information about the governance object
→<br>Governance Object(s) | object | Required<br>(1 or more) | Key: Governance object hash<br>Values: Governance object details
→ →<br>`DataHex` | string (hex) | Required<br>(exactly 1) | Governance object info as hex string
→ →<br>`DataString` | string | Required<br>(exactly 1) | Governance object info as string
→ →<br>`Hash` | string (hex) | Required<br>(exactly 1) | Hash of this governance object
→ →<br>`CollateralHash` | string (hex) | Required<br>(exactly 1) | Hash of the collateral payment transaction
→ →<br>`ObjectType` | number | Required<br>(exactly 1) | Object types:<br>`1` - Unknown<br>`2` - Proposal<br>`3` - Trigger
→ →<br>`CreationTime` | number | Required<br>(exactly 1) | Object creation time as Unix epoch time
→ →<br>`SigningMasternode` | string (hex) | Optional<br>(0 or 1) | Signing masternode's vin (only present in triggers)
→ →<br>`AbsoluteYesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes minus number of `No` votes
→ →<br>`YesCount` | number | Required<br>(exactly 1) | Number of `Yes` votes
→ →<br>`NoCount` | number | Required<br>(exactly 1) | Number of `No` votes
→ →<br>`AbstainCount` | number | Required<br>(exactly 1) | Number of `Abstain` votes
→<br>`fLocalValidity` | boolean | Required<br>(exactly 1) | Valid by the blockchain
→<br>`IsValidReason` | string | Required<br>(exactly 1) | `fLocalValidity` error result. Empty if no error returned.
→<br>`fCachedValid` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as a valid and understood governance object (e.g, the serialized data is correct format, etc)
→<br>`fCachedFunding` | boolean | Required<br>(exactly 1) | Minimum network support has been reached for this object to be funded (doesn't mean it will be for sure though)
→<br>`fCachedDelete` | boolean | Required<br>(exactly 1) | Minimum network support has been reached saying this object should be deleted from the system entirely
→<br>`fCachedEndorsed` | boolean | Required<br>(exactly 1) | Minimum network support has been reached flagging this object as endorsed

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject list all proposals
```

Result (truncated):
``` json
{
  "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343430303338222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323530393636222c227061796d656e745f61646472657373223a2279544c636f506d4e315963654432534345474d6b6e34395753565a4277626f646e6e222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323530393636222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323530393636227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507440038\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507250966\",\"payment_address\":\"yTLcoPmN1YceD2SCEGMkn49WSVZBwbodnn\",\"payment_amount\":\"2\",\"start_epoch\":\"1507250966\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507250966\"}]]",
    "Hash": "b370fa1afd61aca9aa879abea3087e29656a670478f281d4196efb4e7e893ffe",
    "CollateralHash": "a51ea89c14735f8b5df37cd846b3561494cc616d4a741e4ef83b368d45c960ba",
    "ObjectType": 1,
    "CreationTime": 1507250966,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  },
  "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff": {
    "DataHex": "5b5b2270726f706f73616c222c7b22656e645f65706f6368223a2231353037343534383935222c226e616d65223a227465737470726f706f73616c5f2d5f6162636465666768696a6b6c6d6e6f707172737475767778797a3031323334353637383931353037323635383233222c227061796d656e745f61646472657373223a2279664e68484c4c695936577a5a646a51766137324a64395134313468516578514c68222c227061796d656e745f616d6f756e74223a2232222c2273746172745f65706f6368223a2231353037323635383233222c2274797065223a312c2275726c223a2268747470733a2f2f7777772e6461736863656e7472616c2e6f72672f702f746573745f70726f706f73616c5f31353037323635383233227d5d5d",
    "DataString": "[[\"proposal\",{\"end_epoch\":\"1507454895\",\"name\":\"testproposal_-_abcdefghijklmnopqrstuvwxyz01234567891507265823\",\"payment_address\":\"yfNhHLLiY6WzZdjQva72Jd9Q414hQexQLh\",\"payment_amount\":\"2\",\"start_epoch\":\"1507265823\",\"type\":1,\"url\":\"https://www.dashcentral.org/p/test_proposal_1507265823\"}]]",
    "Hash": "906ae4dbd285e1025832ac9b3160073ecbfeef094d34cf81b3d797a349c720ff",
    "CollateralHash": "1707470c4372ba048b72945365b4bb71afc8a986e0755c1f1e8a37bba21fde83",
    "ObjectType": 1,
    "CreationTime": 1507265823,
    "AbsoluteYesCount": 0,
    "YesCount": 0,
    "NoCount": 0,
    "AbstainCount": 0,
    "fBlockchainValidity": true,
    "IsValidReason": "",
    "fCachedValid": true,
    "fCachedFunding": false,
    "fCachedDelete": false,
    "fCachedEndorsed": false
  }
}
```

### GObject Prepare

The `gobject prepare` RPC prepares a governance object by signing and creating a collateral transaction.

> 👍 
> 
> Note: Dash Core v18.0.0 added support for directing proposal payouts to P2SH addresses such as multisig.

*Parameter #1---parent hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`parent-hash` | string (hex) | Required<br>(exactly 1) | Hash of the parent object. Usually the root node which has a hash of 0

*Parameter #2---revision*

Name | Type | Presence | Description
--- | --- | --- | ---
`revision` | int | Required<br>(exactly 1) | Object revision number

*Parameter #3---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time (Unix epoch time)

*Parameter #4---data*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | **Updated in Dash Core 0.14.0 to require all new proposals to use JSON serialization.**<br><br>Object data (JSON object with governance details). Additional details regarding this are provided in an example below.

*Parameter #5---use-IS*

Name | Type | Presence | Description
--- | --- | --- | ---
`use-IS` | boolean | Optional<br>(0 or 1) | *Deprecated and ignored since Dash Core 0.15.0*

*Parameter #6---outputHash*

Name | Type | Presence | Description
--- | --- | --- | ---
`outputHash` | string (hex) | Optional<br>(0 or 1) | *Added in Dash Core 0.13.0*<br><br>The single output to submit the proposal fee from

*Parameter #7---outputIndex*

Name | Type | Presence | Description
--- | --- | --- | ---
`outputIndex` | numeric | Optional<br>(0 or 1) | *Added in Dash Core 0.13.0*<br><br>The output index (required if the `outputHash` parameter is provided)

*Result---collateral transaction ID*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Transaction ID for the collateral transaction

**Details of the `data-hex` field:**

The `data-hex` field is comprised of a JSON object as described in [GObject
Deserialize](#gobject-deserialize) which is serialized to hex.

An example of a proposal JSON object is shown here:

``` json
{
  "end_epoch": 1560457055,
  "name": "test",
  "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
  "payment_amount": 5,
  "start_epoch": 1560453490,
  "type": 1,
  "url": "http://test.com"
}
```

To serialize the object, first remove all spaces from the JSON object as shown below:

``` json
{"end_epoch":1560457055,"name":"test","payment_address":"yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB","payment_amount":5,"start_epoch":1560453490,"type":1,"url":"http://test.com"}
```

Then convert the string to its hex equivalent as shown below. This is what will
be used for the `data-hex` field of the `gobject prepare` command:

``` bash
7b22656e645f65706f6368223a313536303435373035352c226e616d65223a2274657374222c\
227061796d656e745f61646472657373223a227964354b4d52457333474c4d65366d544a5972\
33597248316a75774e777246436642222c227061796d656e745f616d6f756e74223a352c2273\
746172745f65706f6368223a313536303435333439302c2274797065223a312c2275726c223a\
22687474703a2f2f746573742e636f6d227d
```

*Example from Dash Core 0.14.0*

``` bash
gobject prepare 0 1 1560449223 7b22656e645f65706f6368223a3135363034353730353\
52c226e616d65223a2274657374222c227061796d656e745f61646472657373223a227964354\
b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061796d6\
56e745f616d6f756e74223a352c2273746172745f65706f6368223a313536303435333439302\
c2274797065223a312c2275726c223a22687474703a2f2f746573742e636f6d227d
```

Result (Collateral Transaction ID):
``` bash
3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262
```

*See also:*

* [GObject List-Prepared](#gobject-list-prepared): returns a list of governance objects prepared by this wallet

### GObject List-Prepared

The `gobject list-prepared` RPC returns a list of governance objects prepared by this wallet with [`gobject prepare`](#gobject-prepare) sorted by their creation time.

*Parameter #1---count*

Name | Type | Presence | Description
--- | --- | --- | ---
`count` | number (int) | Optional<br>(0 or 1) | Maximum number of objects to return

*Result---list of governance objects*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | List of governance objects
→<br>Governance Object | object | Required<br>(0 or more) | Proposal object
→ →<br>`objectHash` | string (hex) | Required<br>(exactly 1) | Proposal object hash
→ →<br>`parentHash` | string (hex) | Required<br>(exactly 1) | Hash of the parent object. Usually the root node which has a hash of 0
→ →<br>`collateralHash` | string (hex) | Required<br>(exactly 1) | Hash of the collateral payment transaction
→ →<br>`createdAt` | number (int) | Required<br>(exactly 1) | Proposal creation time as Unix epoch time
→ →<br>`revision` | number (int) | Required<br>(exactly 1) | Proposal revision number
→ →<br>`data` | object | Required<br>(exactly 1) | Object containing governance object data
→ → →<br>`end_epoch` | string | Required<br>(exactly 1) | Governance object info as string
→ → →<br>`name` | string (hex) | Required<br>(exactly 1) | Proposal name
→ → →<br>`payment_address` | string (hex) | Required<br>(exactly 1) | Proposal payment address
→ → →<br>`payment_amount` | string | Required<br>(exactly 1) | Proposal payment amount
→ → →<br>`start_epoch` | string (hex) | Required<br>(exactly 1) | Proposal start
→ → →<br>`type` | number (int) | Required<br>(exactly 1) | Object type
→ → →<br>`url` | string | Required<br>(exactly 1) | Proposal URL
→ → →<br>`hex` | string (hex) | Required<br>(exactly 1) | Governance object data as hex

*Example from Dash Core 0.17.0*

``` bash
gobject list-prepared
```

Result (Collateral Transaction ID):
``` json
[
  {
    "objectHash": "307cde2e485968548cd1a19473bf48f788c16178d82f63cbe849c33988d9592b",
    "parentHash": "0000000000000000000000000000000000000000000000000000000000000000",
    "collateralHash": "987570add8979576cb8a4ee510df448fd2ae7097628b7980559489ecb116b0fa",
    "createdAt": 1608143561,
    "revision": 1,
    "data": {
      "end_epoch": 1608151237,
      "name": "test",
      "payment_address": "yd5KMREs3GLMe6mTJYr3YrH1juwNwrFCfB",
      "payment_amount": 5,
      "start_epoch": 1608147672,
      "type": 1,
      "url": "https://www.dash.org",
      "hex": "7b22656e645f65706f6368223a313630383135313233372c226e616d65223a2274657374222c227061796d656e745f61646472657373223a227964354b4d52457333474c4d65366d544a597233597248316a75774e777246436642222c227061796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a313630383134373637322c2274797065223a312c2275726c223a2268747470733a2f2f7777772e646173682e6f7267227d"
    }
  }
]
```

*See also:*

* [GObject Prepared](#gobject-prepare): prepares a governance object by signing and creating a collateral transaction

### GObject Submit

The `gobject submit` RPC submits a governance object to network (objects must
first be prepared via `gobject prepare`).

Note: Parameters 1-4 should be the same values as the ones used for `gobject
prepare`.

*Parameter #1---parent hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`parent-hash` | string (hex) | Required<br>(exactly 1) | Hash of the parent object. Usually the root node which has a hash of 0

*Parameter #2---revision*

Name | Type | Presence | Description
--- | --- | --- | ---
`revision` | int | Required<br>(exactly 1) | Object revision number

*Parameter #3---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time

*Parameter #4---data*

Name | Type | Presence | Description
--- | --- | --- | ---
`data-hex` | string (hex) | Required<br>(exactly 1) | **Updated in Dash Core 0.14.0 to require all new proposals to use JSON serialization.**<br><br>Object data (JSON object with governance details). See [GObject Prepare](#gobject-prepare) for additional details about this field.

*Parameter #5---fee transaction ID*

Name | Type | Presence | Description
--- | --- | --- | ---
`data` | string (hex) | Required<br>(exactly 1) | Fee transaction ID - required for all objects except triggers

*Result---governance object hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (hex) | Required<br>(exactly 1) | Governance object hash

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet gobject submit 0 1 1560449223 7b22656e645f65706f6368223a3\
13536303435373035352c226e616d65223a2274657374222c227061796d656e745f61646472\
657373223a227964354b4d52457333474c4d65366d544a597233597248316a75774e7772464\
36642222c227061796d656e745f616d6f756e74223a352c2273746172745f65706f6368223a\
313536303435333439302c2274797065223a312c2275726c223a22687474703a2f2f7465737\
42e636f6d227d \
3fd758e7a5761bb07b2850b8ba432ef42c1ea80f0921d2eab0682697dda78262
```

Result (Governance Object Hash):
``` bash
e353b2ab5f7e7cb24b95e00e153ec2a6339249672f18b8e8e144aa711678710d
```

*See also:*

* [GObject Prepared](#gobject-prepare): prepares a governance object by signing and creating a collateral transaction

### GObject Vote-alias

The `gobject vote-alias` RPC votes on a governance object by masternode alias (using masternode.conf setup).

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #4---masternode alias*

Name | Type | Presence | Description
--- | --- | --- | ---
`alias` | string | Required<br>(exactly 1) | Alias of voting masternode

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>Masternode Alias | object | Required<br>(1 or more) | Name of the masternode alias
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-alias \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b \
funding yes MN01
```

Result:
``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "MN01": {
      "result": "success"
    }
  }
}
```

### GObject Vote-conf

The `gobject vote-conf` RPC votes on a governance object by masternode configured in dash.conf.

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>`dash.conf` | object | Required<br>(1 or more) |
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-conf \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes
```

``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "dash.conf": {
      "result": "success"
    }
  }
}
```

### GObject Vote-many

The `gobject vote-many` RPC votes on a governance object by all masternodes (using masternode.conf setup).

*Parameter #1---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #2---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #3---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #4---masternode alias*

Name | Type | Presence | Description
--- | --- | --- | ---
`alias` | string | Required<br>(exactly 1) | Alias of voting masternode

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The governance object votes
→<br>`overall` | string | Required<br>(1 or more) | Reports number of vote successes/failures
→<br>`detail` | object | Required<br>(exactly 1) | Vote details
→ →<br>Masternode Alias | object | Required<br>(1 or more) | Name of the masternode alias
→ → →<br>`result` | string | Required<br>(exactly 1) | Vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet gobject vote-many \
0bf97bce78b3b642c36d4ca8e9265f8f66de8774c220221f57739c1956413e2b funding yes
```

``` json
{
  "overall": "Voted successfully 1 time(s) and failed 0 time(s).",
  "detail": {
    "MN01": {
      "result": "success"
    }
  }
}
```

*See also:*

* [GetGovernanceInfo](#getgovernanceinfo): returns an object containing governance parameters.
* [GetSuperblockBudget](#getsuperblockbudget): returns the absolute maximum sum of superblock payments allowed.

## Masternode

The [`masternode` RPC](#masternode) provides a set of commands for managing masternodes and displaying information about them.

### Masternode Count

The `masternode count` RPC prints the number of all known masternodes.

> 🚧 Dash Core 0.17.0 change
>
> The previously deprecated `mode` parameter was removed in Dash Core 0.17.0. Information regarding the previous functionality is available in [an older version of the documentation](https://dashcore.readme.io/v0.16.0/docs/core-api-ref-remote-procedure-calls-dash#masternode-count).

*Parameters: none*

*Result---number of known masternodes*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Masternode count by mode
→<br>`total` | int | Required<br>(exactly 1) | Count of all masternodes
→<br>`enabled` | int | Required<br>(exactly 1) | Count of enabled masternodes

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet masternode count
```

Result:
``` bash
{
  "total": 185,
  "enabled": 130
}
```

### Masternode Current

>❗️ Deprecated in Dash Core 0.17.0
>
> This RPC has been deprecated and will be removed in a future version of Dash Core

The `masternode current` RPC prints info on current masternode winner to be paid the next block (calculated locally).

*Parameters: none*

*Result---current winning masternode info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>`height` | int | Required<br>(exactly 1) | Block height
→<br>`IP:port` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`payee` | string | Required<br>(exactly 1) | Payee address

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode current
```

Result:
``` json
{
  "height": 76179,
  "IP:port": "34.242.53.163:26155",
  "proTxHash": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d",
  "outpoint": "9de76b8291d00026ab0af86306023c7b90f8e9229dc04916fe1335bf5e11f15d-1",
  "payee": "yZnU7YJJgGQKvKPQFqXJ4k4DGSsRMhgLXx"
}
```

### Masternode List

The `masternode list` prints a list of all known masternodes.

This RPC uses the same parameters and returns the same data as
[masternodelist](#masternodelist). Please reference it for full details.

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet masternode list \
	rank f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f
```

Result:
``` json
{
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1": 11
}
```

### Masternode Outputs

The `masternode outputs` RPC prints masternode compatible outputs.

> ❗️ Breaking change
>
> Dash Core 18.1.0 changed the response format from a JSON object (Key: TXID, Value: transaction index) to the current array representation

*Parameters: none*

*Result---masternode outputs*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | array | Required<br>(exactly 1) | Masternode compatible outputs
→<br>Output | string | Required<br>(0 or more) | Masternode compatible output (TXID:Index)

*Example from Dash Core 18.1.0*

``` bash
dash-cli -testnet masternode outputs
```

Result:
``` json
[
  "f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f-1"
]
```

### Masternode Payments

> 👍 
> 
> Added in Dash Core 0.17.0

The `masternode payments` RPC prints an array of deterministic masternodes and their payments for the specified block.

By default, payment information is returned for only the chain tip. More block winners can be requested via the optional `count` parameter.

*Parameter #1---block hash*

Name | Type | Presence | Description
--- | --- | --- | ---
Block Hash | string (hex) | Optional<br>(exactly 1) | The hash of the starting block (default: tip)

*Parameter #2---count*

Name | Type | Presence | Description
--- | --- | --- | ---
Count | number (int) | Optional<br>(exactly 1) | The number of blocks to return (default: 1). Will return <count> previous blocks if <count> is negative. Both 1 and -1 correspond to the chain tip.
. 
*Result---masternode payments*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | array of objects | Required<br>(exactly 1) | List of masternode payment info
→<br>Block Payment | object | Optional<br>(0 or more) | Masternode payment info for a block
→→<br>`height` | number (int) | Required<br>(exactly 1) | The height of the block
→→<br>`blockhash` | number (int) | Required<br>(exactly 1) | The hash of the block
→→<br>`amount` | number (int) | Required<br>(exactly 1) | Amount received in this block by all masternodes
→→<br>`masternodes` | array of objects | Required<br>(exactly 1) | Masternodes that received payments in this block
→→→<br>Masternode | object | Required<br>(1 or more) | Masternode info
→→→→<br>`proTxHash` | string (hex) | Required<br>(exactly 1) | The hash of the corresponding ProRegTx
→→→→<br>`amount` | number (int) | Required<br>(exactly 1) | Amount received by this masternode
→→→→<br>`payees` | array of objects | Required<br>(exactly 1) | Payees who received a share of this payment
→→→→→<br>Payee | objects | Required<br>(1 or more) | Payee info→→→→→<br>`address` | string | Required<br>(exactly 1) | Payee address
→→→→→→<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→→→→→→<br>`amount` | number (int) | Required<br>(exactly 1) | Amount received by this payee

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet masternode payments
```

Result (block 407822):
``` json
[
  {
    "height": 407822,
    "blockhash": "0000030ae0ca262af12918eac9069e61c481e17ac65a26c87ee44427699c3f3a",
    "amount": 1253571429,
    "masternodes": [
      {
        "proTxHash": "c865b48a09801c61dce5804f28fe994c72577254ea1859cf1c37fe92b428e757",
        "amount": 1253571429,
        "payees": [
          {
            "address": "yP72QU7PMG8wNQVTtaQrCLVKCmbuDeAK91",
            "script": "76a9141e8efb321d5cad77e28e4e6b51546932579d02f588ac",
            "amount": 1253571429
          }
        ]
      }
    ]
  }
]
```

*See also:*

* [Masternode Winner](#masternode-winner): prints info on the next masternode winner to vote for.
* [Masternode Winners](#masternode-winners): prints the list of masternode winners.

### Masternode Status

The `masternode status` RPC prints masternode status information.

*Parameters: none*

*Result---masternode status info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Masternode status info
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`service` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string (hex) | Optional<br>(0 or 1) | The masternode's ProRegTx hash
→<br>`collateralHash` | string (hex) | Optional<br>(0 or 1) | The masternode's collateral hash
→<br>`collateralIndex` | int | Optional<br>(0 or 1) | Index of the collateral
→<br>`dmnState` | object | Optional<br>(0 or 1) | Deterministic Masternode State
→ →<br>`service` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→ →<br>`registeredHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was registered
→ →<br>`lastPaidHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last paid
→ →<br>`PoSePenalty` | int | Required<br>(exactly 1) | Current proof-of-service penalty
→ →<br>`PoSeRevivedHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last revived from a PoSe ban
→ →<br>`PoSeBanHeight` | int | Required<br>(exactly 1) | Block height at which the masternode was last PoSe banned
→ →<br>`revocationReason` | int | Required<br>(exactly 1) | Reason code for of masternode operator key revocation
→ →<br>`ownerAddress` | string | Required<br>(exactly 1) | The owner address
→ →<br>`votingAddress` | string | Required<br>(exactly 1) | The voting address
→ →<br>`payoutAddress` | string | Required<br>(exactly 1) | The payout address
→ →<br>`pubKeyOperator` | string | Required<br>(exactly 1) | The operator public key
→ →<br>`operatorPayoutAddress` | string | Optional<br>(0 or 1) | The operator payout address
→<br>`state` | string | Required<br>(exactly 1) | The masternode's state. Valid states are:<br>• `WAITING_FOR_PROTX`<br>• `POSE_BANNED`<br>• `REMOVED`<br>• `OPERATOR_KEY_CHANGED`<br>• `PROTX_IP_CHANGED`<br>• `READY`<br>• `ERROR`<br>• `UNKNOWN`
→<br>`status` | string | Required<br>(exactly 1) | The masternode's status (description based on current state)

*Example from Dash Core 0.13.2*

``` bash
dash-cli -testnet masternode status
```

Result:
``` json
{
  "outpoint": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357-0",
  "service": "45.32.237.76:19999",
  "proTxHash": "04d06d16b3eca2f104ef9749d0c1c17d183eb1b4fe3a16808fd70464f03bcd63",
  "collateralHash": "d1be3a1aa0b9516d06ed180607c168724c21d8ccf6c5a3f5983769830724c357",
  "collateralIndex": 0,
  "dmnState": {
    "service": "45.32.237.76:19999",
    "registeredHeight": 7402,
    "lastPaidHeight": 59721,
    "PoSePenalty": 0,
    "PoSeRevivedHeight": 61915,
    "PoSeBanHeight": -1,
    "revocationReason": 0,
    "ownerAddress": "yT8DDY5NkX4ZtBkUVz7y1RgzbakCnMPogh",
    "votingAddress": "yMLrhooXyJtpV3R2ncsxvkrh6wRennNPoG",
    "payoutAddress": "yTsGq4wV8WF5GKLaYV2C43zrkr2sfTtysT",
    "pubKeyOperator": "02a2e2673109a5e204f8a82baf628bb5f09a8dfc671859e84d2661cae03e6c6e198a037e968253e94cd099d07b98e94e"
  },
  "state": "READY",
  "status": "Ready"
}
```

### Masternode Winner

>❗️ Deprecated in Dash Core 0.17.0
>
> This RPC has been deprecated and will be removed in a future version of Dash Core

The `masternode winner` RPC prints info on the next masternode winner to vote for.

*Parameters: none*

*Result---next masternode winner info*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>`height` | int | Required<br>(exactly 1) | Block height
→<br>`IP:port` | string | Required<br>(exactly 1) | The IP address/port of the masternode
→<br>`proTxHash` | string | Required<br>(exactly 1) | The masternode's Provider Registration transaction hash
→<br>`outpoint` | string | Required<br>(exactly 1) | The masternode's outpoint
→<br>`payee` | string | Required<br>(exactly 1) | Payee address

*Example from Dash Core 0.14.0*

``` bash
dash-cli -testnet masternode winner
```

Result:
``` json
{
  "height": 76191,
  "IP:port": "34.242.53.163:26173",
  "proTxHash": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f",
  "outpoint": "024608d03beb6a6065f14a29a837c68ae449ac1e17056819366ca0b72b6dd81f-1",
  "payee": "yhp182AnF7gUAyHiWgSbDrKqHKt2dzhoyW"
}
```

*See also:*

* [Masternode Payments](#masternode-payments): prints an array of deterministic masternodes and their payments for the specified block.
* [Masternode Winners](#masternode-winners): prints the list of masternode winners.


### Masternode Winners

The `masternode winners` RPC prints the list of masternode winners.

By default, the 10 previous block winners, the current block winner, and the
next 20 block winners are displayed. More past block winners can be requested
via the optional `count` parameter.

*Parameter #1---count*

Name | Type | Presence | Description
--- | --- | --- | ---
Count | string (hex) | Optional<br>(exactly 1) | Number of previous block winners to display (default: 10)

*Parameter #2---filter*

Name | Type | Presence | Description
--- | --- | --- | ---
Filter | string | Optional<br>(exactly 1) | Payment address to filter by

*Result---masternode winners*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | Winning masternode info
→<br>Masternode Winner | int | Required<br>(exactly 1) | Key: Block height<br>Value: payee address. As of Dash Core 0.17.0, all payees will be listed (e.g. both owner and operator where applicable).

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet masternode winners
```

Result (current block - 37458):
``` json
{
  "37448": "ygSWwhyzU61FNEta8gDh8gfoH5EZZUvc5m,yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
  "37449": "yjGZLzSSoFfTFgLDJrgniXfYxu3xF9xKQg",
  "37450": "yRTo1wXWoNnPFWcQVepKGXuLsoypnPkGWj",
  "37451": "yYMFRAYZ25XspHZ1EXC39wUMx9FhoC5VT2",
  "37452": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v",
  "37453": "yX5y3otE4LitGYiSfZhVH4LdbwHShdzQ8v",
  "37454": "yUamtYUFhqUxCMny3JTcZJTyttVt8SYFug",
  "37455": "yU35XcdGMnj8Exa2ZZqCg4ongiNqQwpeUZ",
  "37456": "yaJc6tADbEjxQBAC69ugWNoTFpzxqkcgWd",
  "37457": "yf4WpwRX17p7YRkHJPQpHMXTwzi5s2VDcR",
  "37458": "ydbfUYWfLm6xg7Y5aBLjy38DvksrvNcHEc",
  "37459": "yYp9k2iuDptT2MB7qVZtVy6ModHtLXFjio",
  "37460": "yP1UHNx26ShYLej56SbHiTiPAUv2QppbUv",
  "37461": "yaCtZRpiYnVFMyWELHZF74v9ayLKCLPcC9",
  "37462": "ygYFnLHoVRyhRoxd6fXQ9nmEafX4eLoWkB",
  "37463": "yM5kTThWi8MnAFtZqx98Zipp1BbyypUZGK",
  "37464": "yeDY39aiqbBHbJft5F6rokR23EaZca6UTU",
  "37465": "yMME1ns1xfpGS2XbFPktsNyp7Cjr1BoJxb",
  "37466": "ycn5RWc4Ruo35FTS8bJwugVyCEkfVcrw9a",
  "37467": "yUTDkKKhbvDrnwkiaoP8HvqxTNC6rNnUe2",
  "37468": "yTstes2nSaSpvu9nTapiCGnjCLvLD5fUqt",
  "37469": "Unknown",
  "37470": "Unknown",
  "37471": "Unknown",
  "37472": "Unknown",
  "37473": "Unknown",
  "37474": "Unknown",
  "37475": "Unknown",
  "37476": "Unknown",
  "37477": "Unknown"
}
```

Get a filtered list of masternode winners

``` bash
dash-cli -testnet masternode winners 150 "yTZ99"
```

Result:
``` json
{
  "37338": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
  "37339": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
  "37432": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM",
  "37433": "yTZ99fCnjNu33RDRtawf81iwJ9uxXFmkgM"
}
```

*See also:*

* [MasternodeList](#masternodelist): returns a list of masternodes in different modes.
* [Masternode Payments](#masternode-payments): prints an array of deterministic masternodes and their payments for the specified block.
* [Masternode Winner](#masternode-winner): prints info on the next masternode winner to vote for.

## Masternodelist

The [`masternodelist` RPC](#masternodelist) returns a list of masternodes in different modes.

*Parameter #1---List mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Optional (exactly 1);<br>Required to use `filter` | The mode to run list in

*Mode Options (Default=json)*

Mode | Description
--- | --- | --- |
`addr` | Print IP address associated with a masternode (can be additionally filtered, partial match)
`full` | Print info in format 'status payee lastpaidtime lastpaidblock IP' (can be additionally filtered, partial match)
`info` | Print info in format 'status payee IP' (can be additionally filtered, partial match)
`json` (Default) | Print info in JSON format (can be additionally filtered, partial match)
`lastpaidblock` | Print the last block height a node was paid on the network
`lastpaidtime` | Print the last time a node was paid on the network
`owneraddress` | Print the masternode owner Dash address
`payee` | Print Dash address associated with a masternode (can be additionally filtered, partial match)
`pubKeyOperator` | Print the masternode operator public key
`status` | Print masternode status: ENABLED / POSE_BANNED (can be additionally filtered, partial match)
`votingaddress` | Print the masternode voting Dash address

*Parameter #2---List filter*

Name | Type | Presence | Description
--- | --- | --- | ---
`filter` | string | Optional<br>(exactly 1) | Filter results. Partial match by outpoint by default in all modes, additional matches in some modes are also available.

*Result---the masternode list*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the masternode sync status
→<br>Masternode Info | string | Required<br>(1 or more) | The requested masternode info. Output varies based on selected `mode` and `filter` parameters

*Example from Dash Core 18.0.0*

Get unfiltered Masternode list in default mode

``` bash
dash-cli -testnet masternodelist
```

Result:
``` json
{
  "cf9840b16f0c28e39beb89e06b995a12425f6a836ed899aa8203a448b31724c6-0": {
    "proTxHash": "56948a65b01f83e37958e194840496c8a728f9f64c0335fd13e7561cfd6c14c0",
    "address": "52.36.244.225:19999",
    "payee": "yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
    "status": "ENABLED",
    "pospenaltyscore": 0,
    "lastpaidtime": 1650381993,
    "lastpaidblock": 708881,
    "owneraddress": "yhfoDh5AmCT2psSyKyAuY7CgwzGDygPm9Y",
    "votingaddress": "yhfoDh5AmCT2psSyKyAuY7CgwzGDygPm9Y",
    "collateraladdress": "yLXmtxaxAZ18WRwcjmZwVfmLSH5TdAXPzV",
    "pubkeyoperator": "00ea87eef15f38c1a844d77348e687794c601277011c933026cdfdb649524632b055feea3539abc48472cb447d281d65"
  },
  "08ff009239143f043be80da2c501a4a505fc5b142b27a1e00590f172dd323799-0": {
    "proTxHash": "6cc91317f635db636537b9f01ae4441de5ff97bb59a9c998224080f11d7d88e0",
    "address": "52.39.164.105:19999",
    "payee": "yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr",
    "status": "ENABLED",
    "pospenaltyscore": 0,
    "lastpaidtime": 1650398582,
    "lastpaidblock": 708995,
    "owneraddress": "yXay1hpiuwqdWMUoTzJknA1ZQLUHZDghS2",
    "votingaddress": "yXay1hpiuwqdWMUoTzJknA1ZQLUHZDghS2",
    "collateraladdress": "ycbvtNd6HqP6eFa9WEFeS1q9bsh1J7DG18",
    "pubkeyoperator": "03d890d1bc938b48547c8730000c4dcd5a940e55e82d1322ea600cc90c319111603fa52f928ec9d5dd29784b96f34af9"
  },
  "6f506a5dbb0e88fe83242d4f9641b6f4a2616d22c889b74f29b5bfa6291dfdca-1": {
    "proTxHash": "34f19e4ac7e1b2abbded7fe0d19991cde34eb7797d8e81fe01d6e73db2097180",
    "address": "3.20.70.18:10003",
    "payee": "ySLuZnXd8ciZNXV5FEWpqRryT4viJdwazM",
    "status": "POSE_BANNED",
    "pospenaltyscore": 365,
    "lastpaidtime": 1578387987,
    "lastpaidblock": 243103,
    "owneraddress": "yP2swcUzQ7MHtaubyg3uKrRcM7oWER3X9Q",
    "votingaddress": "yP2swcUzQ7MHtaubyg3uKrRcM7oWER3X9Q",
    "collateraladdress": "yX8n7oXabwxJHS3tDW2nfB4viPFi98NAwS",
    "pubkeyoperator": "0fb7164d86058e2b22c4a6f6917714dfa4a2cb4d54bebbf3c9300ebfe1759b33d15b0b68e32999aae19bf0dd92341e40"
  }
}
```

Get a filtered Masternode list

``` bash
dash-cli -testnet masternodelist full "NEW"
```

Result:
``` json
{
  "cf9840b16f0c28e39beb89e06b995a12425f6a836ed899aa8203a448b31724c6-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650381993 708881 52.36.244.225:19999",
  "6f506a5dbb0e88fe83242d4f9641b6f4a2616d22c889b74f29b5bfa6291dfdca-1": "       POSE_BANNED 365 ySLuZnXd8ciZNXV5FEWpqRryT4viJdwazM 1578387987 243103 3.20.70.18:10003",
  "52feab469665752944186952b361815ba53e5296457de6d1bd23baf80db36f0a-0": "           ENABLED 0 yac7gAK3cKuDnYD4RmGaJiMnCssgu7Q7A5 1650385230 708906 54.185.249.226:19999",
  "c44721bf0b5be6de4b7706eaef15c2d500bba148e21947907bd52f77d18bebbd-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650397178 708981 34.219.169.55:19999",
  "893d83df0dfc05ac284b96c2b31d4db1d34552f814bd834b8c75f43c56945565-1": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650385930 708913 54.213.219.155:19999",
  "23464abc2f724de235e69e72ef5068f1b2701521b88e7b2740b93978ff54909b-1": "       POSE_BANNED 346 yhDhNgubyF1NEmT6qtiTXTbr3KMiJwUTxk 1555111615  78830 198.199.74.241:19999",
  "d0e28cd51e674fe00af162877cb70e0ceed1906fef616b2d231ef009f6e4786a-0": "           ENABLED 0 yP8A3cbdxRtLRduy5mXDsBnJtMzHWs6ZXr 1650396597 708974 34.220.41.134:19999",
  "213a1c4beb216e8697d8d15701c248bcf91a889f4989fbb4275293b3aa697802-1": "       POSE_BANNED 0 yfzLmLJUEYcC8LEygLB6AQFxCwsF3fV9Fw 1564053511 143062 [::]:0"
}
```

*See also:*

* [Masternode](#masternode): provides a set of commands for managing masternodes and displaying information about them.
* [MnSync](#mnsync): returns the sync status, updates to the next step or resets it entirely.

## MnSync

The [`mnsync` RPC](#mnsync) returns the sync status, updates to the next step or resets it entirely.

*Parameter #1---Command mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`status` - Get masternode sync status<br>`next` - Move to next sync asset<br>`reset` - Reset sync status

**Command Mode - `status`**

*Result---the sync status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object/null | Required<br>(exactly 1) | Information about the masternode sync status
→<br>`AssetID` | number (int) | Required<br>(exactly 1) | The sync asset ID
→<br>`AssetName` | string | Required<br>(exactly 1) | The sync asset name
→<br>`AssetStartTime` | number (int) | Required<br>(exactly 1) | The sync asset start time
→<br>`Attempt` | number (int) | Required<br>(exactly 1) | The sync attempt number
→<br>`IsBlockchainSynced` | boolean | Required<br>(exactly 1) | Blockchain sync status
→<br>`IsSynced` | boolean | Required<br>(exactly 1) | Masternode sync status
→<br>`IsFailed` | boolean | Required<br>(exactly 1) | _Removed in Dash Core 0.16.0_<br>Masternode list sync fail status

Sync Assets

AssetID | AssetName
--- | --- | --- |
0 | MASTERNODE_SYNC_INITIAL (merged with `MASTERNODE_SYNC_BLOCKCHAIN` in Dash Core 0.16.0)
1 | MASTERNODE_SYNC_BLOCKCHAIN (previously `MASTERNODE_SYNC_WAITING`)
4 | MASTERNODE_SYNC_GOVERNANCE
-1 | MASTERNODE_SYNC_FAILED (removed in Dash Core 0.16.0)
999 | MASTERNODE_SYNC_FINISHED

*Example from Dash Core 0.16.0*

Get Masternode sync status

``` bash
dash-cli -testnet mnsync status
```

Result:
``` json
{
  "AssetID": 999,
  "AssetName": "MASTERNODE_SYNC_FINISHED",
  "AssetStartTime": 1507662300,
  "Attempt": 0,
  "IsBlockchainSynced": true,
  "IsSynced": true,
}
```

**Command Mode - `next`**

*Result---next command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet mnsync next
```

Result:
``` text
sync updated to MASTERNODE_SYNC_GOVERNANCE
```

**Command Mode - `reset`**

*Result---reset command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status:<br>`success` or `failure`

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet mnsync reset
```

Result:
``` text
success
```

*See also:*

* [Masternode](#masternode): provides a set of commands for managing masternodes and displaying information about them.
* [MasternodeList](#masternodelist): returns a list of masternodes in different modes.

<span id="privatesend"></span>
## CoinJoin

As of Dash Core 0.12.3, this is not supported on masternodes since wallet functionality is disabled on them for security reasons.

The [`coinjoin` RPC](#coinjoin) controls the CoinJoin process (previously named `privatesend` prior to Dash Core 0.17.0).

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`start` - Start CoinJoin<br>`stop` - Stop CoinJoin<br>`reset` - Reset CoinJoin

**Command Mode - `start`**

*Result---start command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet coinjoin start
```

Result:
``` text
Mixing started successfully
```

**Command Mode - `stop`**

*Result---stop command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet coinjoin stop
```

Result:
``` text
Mixing was stopped
```

**Command Mode - `reset`**

*Result---reset command return status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Command return status

*Example from Dash Core 0.17.0*

``` bash
dash-cli -testnet coinjoin reset
```

Result:
``` text
Mixing was reset
```

*See also: none*

## Spork

The [`spork` RPC](#spork) shows information about the current state of sporks.

> 🚧 
>
> Dash Core 18.1 moved spork setting functionality into a dedicated RPC, [`sporkupdate`](#sporkupdate).

To display the status of sporks, use the `show` or `active` syntax.

*Parameter #1---Command mode*

Name | Type | Presence | Description
--- | --- | --- | ---
`mode` | string | Required<br>(exactly 1) | The command mode to use:<br>`show` - Display spork values<br>`active` - Display spork activation status

**Command Mode - `show`**

*Result---spork values*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing status
→<br>`Spork Value` | int64_t | Required<br>(1 or more) | Spork value (epoch datetime to enable/disable)

*Example from Dash Core 18.1.0*

``` bash
dash-cli -testnet spork show
```

Result:
``` json
{
  "SPORK_2_INSTANTSEND_ENABLED": 0,
  "SPORK_3_INSTANTSEND_BLOCK_FILTERING": 0,
  "SPORK_9_SUPERBLOCKS_ENABLED": 0,
  "SPORK_17_QUORUM_DKG_ENABLED": 0,
  "SPORK_19_CHAINLOCKS_ENABLED": 0,
  "SPORK_21_QUORUM_ALL_CONNECTED": 1,
  "SPORK_23_QUORUM_POSE": 0
}
```

**Command Mode - `active`**

*Result---spork active status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Object containing status
→<br>`Spork Activation Status` | bool | Required<br>(1 or more) | Spork activation status

*Example from Dash Core 18.1.0*

``` bash
dash-cli -testnet spork active
```

Result:
``` json
{
  "SPORK_2_INSTANTSEND_ENABLED": true,
  "SPORK_3_INSTANTSEND_BLOCK_FILTERING": true,
  "SPORK_9_SUPERBLOCKS_ENABLED": true,
  "SPORK_17_QUORUM_DKG_ENABLED": true,
  "SPORK_19_CHAINLOCKS_ENABLED": true,
  "SPORK_21_QUORUM_ALL_CONNECTED": true,
  "SPORK_23_QUORUM_POSE": true
}
```

*See also:*

* [Sporkupdate](#sporkupdate): updates the value of the provided spork.

## Sporkupdate

The [`sporkupdate` RPC](#sporkupdate) updates the value of the provided spork.

> 📘
>
> Signing spork update messages requires `-sporkkey` to be set via the command line or dash.conf file.

To update the state of a spork activation, use the `<name> [value]` syntax.

*Parameter #1---Spork name*

Name | Type | Presence | Description
--- | --- | --- | ---
`name` | string | Required<br>(exactly 1) | The name of the spork to update

*Parameter #2---Spork value*

Name | Type | Presence | Description
--- | --- | --- | ---
`value` | int | Required<br>(exactly 1) | The value to assign the spork

*Result---spork update status*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | Update status (`success` or `null`)

*Example from Dash Core 18.1.0*

``` bash
dash-cli -testnet spork SPORK_2_INSTANTSEND_ENABLED 0
```

Result:
``` bash
null
```

*See also:*

* [Spork](#spork): shows information about the current state of sporks.

## VoteRaw

The [`voteraw` RPC](#voteraw) compiles and relays a governance vote with provided external signature instead of signing vote internally

*Parameter #1---masternode collateral transaction hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`masternode-collateral-tx-hash` | string (hex) | Required<br>(exactly 1) | Hash of the masternode collateral transaction

*Parameter #2---masternode collateral transaction index*

Name | Type | Presence | Description
--- | --- | --- | ---
`masternode-collateral-tx-index` | string | Required<br>(exactly 1) | Index of the masternode collateral transaction

*Parameter #3---governance hash*

Name | Type | Presence | Description
--- | --- | --- | ---
`governance-hash` | string (hex) | Required<br>(exactly 1) | Hash of the governance object

*Parameter #4---vote signal*

Name | Type | Presence | Description
--- | --- | --- | ---
`signal` | string | Required<br>(exactly 1) | Vote signal: `funding`, `valid`, or `delete`

*Parameter #5---vote outcome*

Name | Type | Presence | Description
--- | --- | --- | ---
`outcome` | string | Required<br>(exactly 1) | Vote outcome: `yes`, `no`, or `abstain`

*Parameter #6---time*

Name | Type | Presence | Description
--- | --- | --- | ---
`time` | int64_t | Required<br>(exactly 1) | Create time

*Parameter #7---vote signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`vote-sig` | string (base64) | Required<br>(exactly 1) | The vote signature created by external application (i.e. [Dash Masternode Tool](https://github.com/Bertrand256/dash-masternode-tool) or [dashmnb](https://github.com/chaeplin/dashmnb)).<br><br>Must match the Dash Core ([governance vote signature format](https://github.com/dashpay/dash/blob/v0.15.x/src/governance/governance-vote.cpp#L180-L181)).

*Result---votes for specified governance*

Name | Type | Presence | Description
--- | --- | --- | ---
Result | object | Required<br>(exactly 1) | The vote result

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet voteraw \
f6c83fd96bfaa47887c4587cceadeb9af6238a2c86fe36b883c4d7a6867eab0f 1 \
65a358fefaace40fc07053350be23e519178519290f963dab8ba92f6f85f98c3 \
funding yes 1512507255 \
H1jXKZQp1TZWBPW11E665OwmGBYV1038FohEr0au7zp+O5BCKmVDP/3rGq38ZMy3KOpwnBu6ehd6jlas79hsRBY=
```

Result:
``` bash
Voted successfully
```

*See also:*

* [GObject](#gobject): provides a set of commands for managing governance objects and displaying information about them.