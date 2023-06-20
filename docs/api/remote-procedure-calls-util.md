```{eval-rst}
.. meta::
  :title: Util RPCs
  :description: A list of utility remote procedure calls in Dash Core.
```

# Util RPCs

## CreateMultiSig

The [`createmultisig` RPC](../api/remote-procedure-calls-util.md#createmultisig) creates a P2SH multi-signature address.

*Parameter #1---the number of signatures required*

Name | Type | Presence | Description
--- | --- | --- | ---
Required | number (int) | Required<br>(exactly 1) | The minimum (*m*) number of signatures required to spend this m-of-n multisig script

*Parameter #2---the full public keys*

>❗️ Deprecation Warning
>
> As of Dash Core 0.17.0, using addresses with `createmultisig` is unsupported. Clients must use [`addmultisigaddress`](../api/remote-procedure-calls-wallet.md#addmultisigaddress) to create multisig addresses.

Name | Type | Presence | Description
--- | --- | --- | ---
Keys | array | Required<br>(exactly 1) | An array of strings with each string being a public key
→<br>Key | string | Required<br>(1 or more) | A public key against which signatures will be checked. There must be at least as many keys as specified by the `Required` parameter, and there may be more keys

*Result---P2SH address and hex-encoded redeem script*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | An object describing the multisig address
→<br>`address` | string (base58) | Required<br>(exactly 1) | The P2SH address for this multisig redeem script
→<br>`redeemScript` | string (hex) | Required<br>(exactly 1) | The multisig redeem script encoded as hex

*Example from Dash Core 0.16.0*

Creating a 1-of-2 P2SH multisig address by combining two full public keys:

``` bash
dash-cli -testnet createmultisig 1 '''
  [
    "03283a224c2c014d1d0ef82b00470b6b277d71e227c0e2394f9baade5d666e57d3",
    "02594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb6223"
  ]
'''
```

Result:

``` json
{
  "address": "8jYUv8hJcbSUPbwYmzp1XMPU6SXoic3hwi",
  "redeemScript": "512103283a224c2c014d1d0ef82b00470b6b277d71e227c0e2394f9baade5d666e57d32102594523b004e82849a66b3da096b1e680bf2ed5f7d03a3443c027aa5777bb622352ae"
}
```

*See also*

* [AddMultiSigAddress](../api/remote-procedure-calls-wallet.md#addmultisigaddress): adds a P2SH multisig address to the wallet.
* [DecodeScript](../api/remote-procedure-calls-raw-transactions.md#decodescript): decodes a hex-encoded P2SH redeem script.

## DeriveAddresses

*Added in Dash Core 18.0.0*

The [`deriveaddresses` RPC](../api/remote-procedure-calls-util.md#deriveaddresses) derives one or more addresses corresponding to an output [descriptor](https://github.com/dashpay/dash/blob/master/doc/descriptors.md).

Examples of output descriptors are:

| Descriptor format | Description |
| - | - |
| `pkh(<pubkey>)` | P2PKH outputs for the given pubkey |
| `sh(multi(<n>,<pubkey>,<pubkey>,...))` | P2SH-multisig outputs for the given threshold and pubkeys |
| `raw(<hex script>)` | Outputs whose scriptPubKey equals the specified hex scripts |

In the above, <pubkey> either refers to a fixed public key in hexadecimal notation, or to an xpub/xprv optionally followed by one or more path elements separated by "/", where "h" represents a hardened child key. For more information on output descriptors, see the documentation in the [doc/descriptors.md](https://github.com/dashpay/dash/blob/master/doc/descriptors.md) file.

*Parameter #1---the descriptor*

Name | Type | Presence | Description
--- | --- | --- | ---
`descriptor` | string | Required<br>(exactly 1) | The [descriptor](https://github.com/dashpay/dash/blob/master/doc/descriptors.md)

*Parameter #2---range*

Name | Type | Presence | Description
--- | --- | --- | ---
`range` | number | Optional<br>(0 or 1) | If a ranged descriptor is used, this specifies the end or the range (in [begin,end] notation) to derive (e.g. "[0,2]").

*Result---the derived addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | Array of derived addresses
→<br>Address | string | Required<br>(0 or more) | The derived address(es)

*Example from Dash Core 18.0.0*

Analyse a descriptor:

``` bash
dash-cli  deriveaddresses "pkh([8a54e0c5]0214889c34100d00aca6e7cbfe0fa72d83c28857585740bff5f3db6b37e51d9aaa)#wyvgzv2k"
```

Result:

``` json
[
  "yYvsn6vdnkeq9VG1JbkfqKbjv3gUmFmnny"
]
```

*See also*

* [GetDescriptorInfo](#getdescriptorinfo): analyses a descriptor.
* [ScanTxOutset](../api/remote-procedure-calls-wallet.md#scantxoutset): signs a message with the private key of an address.

## EstimateSmartFee

The [`estimatesmartfee` RPC](../api/remote-procedure-calls-util.md#estimatesmartfee) estimates the transaction fee per kilobyte that needs to be paid for a transaction to begin confirmation within a certain number of blocks and returns the number of blocks for which the estimate is valid.

*Parameter #1---how many confirmations the transaction may wait before being included*

Name | Type | Presence | Description
--- | --- | --- | ---
conf_target | number (int) | Required<br>(exactly 1) | Confirmation target in blocks (1 - 1008)

*Parameter #2---estimate mode*

Name | Type | Presence | Description
--- | --- | --- | ---
estimate_mode | string | Optional<br>Default=<br>`CONSERVATIVE` | The fee estimate mode. Whether to return a more conservative estimate which also satisfies a longer history. A conservative estimate potentially returns a higher feerate and is more likely to be sufficient for the desired target, but is not as responsive to short term drops in the prevailing fee market.  Must be one of:<br>`UNSET` (defaults to `CONSERVATIVE`)<br>`ECONOMICAL`<br>`CONSERVATIVE`

*Result---the fee the transaction needs to pay per kilobyte*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | JSON Object containing estimate information
→<br>`feerate` | number (Dash) | Optional<br>(0 or 1) | The estimated fee the transaction should pay in order to be included within the specified number of blocks.  If the node doesn't have enough information to make an estimate, this field will not be returned
→<br>`error` | JSON array (strings) | Optional<br>(0 or 1) | Errors encountered during processing
→<br>`blocks` | number | Required<br>(exactly 1) | Block number where the estimate was found

*Examples from Dash Core 0.15.0*

``` bash
dash-cli estimatesmartfee 6
```

Result:

``` json
{
  "feerate": 0.00044345,
  "blocks": 6
}
```

Requesting data the node can't calculate (out of range):

``` bash
dash-cli estimatesmartfee 2
```

Result:

``` json
{
  "errors": [
    "Insufficient data or no feerate found"
  ],
  "blocks": 2
}
```

*See also*

* [SetTxFee](../api/remote-procedure-calls-wallet.md#settxfee): sets the transaction fee per kilobyte paid by transactions created by this wallet.

## GetDescriptorInfo

*Added in Dash Core 18.0.0*

The [`getdescriptorinfo` RPC](../api/remote-procedure-calls-util.md#getdescriptorinfo) analyses a [descriptor](https://github.com/dashpay/dash/blob/master/doc/descriptors.md).

*Parameter #1---the descriptor*

Name | Type | Presence | Description
--- | --- | --- | ---
`descriptor` | string | Required<br>(exactly 1) | The [descriptor](https://github.com/dashpay/dash/blob/master/doc/descriptors.md)

*Result---the descriptor info*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the descriptor
→<br>`descriptor` | string | Required<br>(exactly 1) | The descriptor in canonical form, without private keys
→<br>`checksum` | string | Required<br>(exactly 1) | The checksum for the input descriptor
→<br>`isrange` | bool | Required<br>(exactly 1) | Whether the descriptor is ranged
→<br>`issolvable` | bool | Required<br>(exactly 1) | Whether the descriptor is solvable
→<br>`hasprivatekeys` | bool | Required<br>(exactly 1) | Whether the input descriptor contained at least one private key

*Example from Dash Core 18.0.0*

Analyse a descriptor:

``` bash
dash-cli getdescriptorinfo "pkh([d34db33f/84h/0h/0h]0279be667ef9dcbbac55a06295Ce870b07029Bfcdb2dce28d959f2815b16f81798)"
```

Result:

``` json
{
  "descriptor": "pkh([d34db33f/84'/0'/0']0279be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798)#9ffuvyvv",
  "checksum": "yrc20h56",
  "isrange": false,
  "issolvable": true,
  "hasprivatekeys": false
}
```

*See also*

* [ScanTxOutset](../api/remote-procedure-calls-wallet.md#scantxoutset): signs a message with the private key of an address.

## SignMessageWithPrivKey

*Added in Dash Core 0.12.3 / Bitcoin Core 0.13.0*

The [`signmessagewithprivkey` RPC](../api/remote-procedure-calls-util.md#signmessagewithprivkey) signs a message with a given private key.

*Parameter #1---the private key to sign with*

Name | Type | Presence | Description
--- | --- | --- | ---
Private Key | string (base58) | Required<br>(exactly 1) | The private key to sign the message with encoded in base58check using wallet import format (WIF)

*Parameter #2---the message to sign*

Name | Type | Presence | Description
--- | --- | --- | ---
Message | string | Required<br>(exactly 1) | The message to sign

*Result---the message signature*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base64) | Required<br>(exactly 1) | The signature of the message, encoded in base64.

*Example from Dash Core 0.12.3*

Sign a the message "Hello, World!" using the following private key:

``` bash
dash-cli signmessagewithprivkey cNKbZBqUCjuBRSnAJWwFWxKESJ5Lw\
G4uxBSJ1UeBNBGVRupFKr6S "Hello, World!"
```

Result:

``` text
IBx8jxFjutPlcZcFdQPlA2n/B4yTrYhH43qYJURKRj7LWhSD0ERE/nnRLOnXi/gwULUcqfqOKqnqkSvuJjlgEvc=
```

*See also*

* [SignMessage](../api/remote-procedure-calls-wallet.md#signmessage): signs a message with the private key of an address.
* [VerifyMessage](../api/remote-procedure-calls-util.md#verifymessage): verifies a signed message.

## ValidateAddress

The [`validateaddress` RPC](../api/remote-procedure-calls-util.md#validateaddress) returns information about the given Dash address.

>❗️
>
> Breaking change(s) in Dash Core 18.0. See parameter and/or response information for details.

*Parameter #1---a P2PKH or P2SH address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH or P2SH address to validate encoded in base58check format

*Result---information about the address*

> 🚧 Dash Core 0.17.0 Deprecations
>
> Parts of this command have been deprecated and moved to the [getaddressinfo RPC](../api/remote-procedure-calls-wallet.md#getaddressinfo). Clients must transition to using getaddressinfo to access this information before upgrading to v18.0.
The following deprecated fields have moved to `getaddressinfo` and will only be shown here with `-deprecatedrpc=validateaddress`: `ismine`, `iswatchonly`,
`script`, `hex`, `pubkeys`, `sigsrequired`, `pubkey`, `addresses`, `embedded`, `iscompressed`, `account`, `timestamp`, `hdkeypath`.

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Information about the address
→<br>`isvalid` | bool | Required<br>(exactly 1) | Set to `true` if the address is a valid P2PKH or P2SH address; set to `false` otherwise
→<br>`address` | string (base58) | Optional<br>(0 or 1) | The Dash address given as parameter
→<br>`scriptPubKey` | string (hex) | Optional<br>(0 or 1) | The hex encoded scriptPubKey generated by the address
→<br>`isscript` | bool | Optional<br>(0 or 1) | Set to `true` if a P2SH address; otherwise set to `false`.  Only returned if the address is in the wallet
→<br>~~`ismine`~~ | ~~bool~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Set to `true` if the address belongs to the wallet; set to false if it does not.  Only returned if wallet support enabled~~
→<br>~~`iswatchonly`~~ | ~~bool~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Set to `true` if the address is watch-only.  Otherwise set to `false`.  Only returned if address is in the wallet~~
→<br>~~`script`~~ | ~~string~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Only returned for P2SH addresses belonging to this wallet. This is the type of script:<br>• `pubkey` for a P2PK script inside P2SH<br>• `pubkeyhash` for a P2PKH script inside P2SH<br>• `multisig` for a multisig script inside P2SH<br>• `nonstandard` for unknown scripts~~
→<br>~~`hex`~~ | ~~string (hex)~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Only returned for P2SH addresses belonging to this wallet.  This is the redeem script encoded as hex~~
→<br>~~`addresses`~~ | ~~array~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Only returned for P2SH addresses belonging to the wallet.  A P2PKH addresses used in this script, or the computed P2PKH addresses of any pubkeys in this script.  This array will be empty for `nonstandard` script types~~
→ →<br>~~Address~~ | ~~string~~ | ~~Optional<br>(0 or more)~~ | ~~A P2PKH address~~
→<br>~~`sigsrequired`~~ | ~~number (int)~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Only returned for multisig P2SH addresses belonging to the wallet.  The number of signatures required by this script~~
→<br>~~`pubkey`~~ | ~~string (hex)~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~The public key corresponding to this address.  Only returned if the address is a P2PKH address in the wallet~~
→<br>~~`iscompressed`~~ | ~~bool~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~Set to `true` if a compressed public key or set to `false` if an uncompressed public key.  Only returned if the address is a P2PKH address in the wallet~~
→<br>~~`account`~~ | ~~string~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~The account this address belong to.  May be an empty string for the default account.  Only returned if the address belongs to the wallet~~
→<br>~~`timestamp`~~ | ~~number (int)~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~The creation time of the key if available in seconds since epoch (Jan 1 1970 GMT)~~
→<br>~~`hdkeypath`~~ | ~~string~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~The HD keypath if the key is HD and available~~  
→<br>~~`hdmasterkeyid`~~ | ~~string (hash160)~~ | ~~Optional<br>(0 or 1)~~ | **Removed in Dash Core 0.17.0**<br>~~The Hash160 of the HD master public key~~  

*Example from Dash Core 0.17.0*

Validate the following P2PKH address from the wallet:

``` bash
dash-cli validateaddress yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb
```

Result:

``` json
{
  "isvalid": true,
  "address": "yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb",
  "scriptPubKey": "76a9141b767409bd8717b56cfcb00747811432ab1aa8a788ac",
  "isscript": false
}
```

Validate the following P2SH multisig address from the wallet:

``` bash
dash-cli -testnet validateaddress 8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW
```

Result:

``` json
{
  "isvalid": true,
  "address": "8uJLxDxk2gEMbidF5vT8XLS2UCgQmVcroW",
  "scriptPubKey": "a914a33155e490d146e656a9bac2cbee9c625ef42f0a87",
  "isscript": true
}
```

*See also*

* [ImportAddress](../api/remote-procedure-calls-wallet.md#importaddress): adds an address or pubkey script to the wallet without the associated private key, allowing you to watch for transactions affecting that address or pubkey script without being able to spend any of its outputs.
* [GetNewAddress](../api/remote-procedure-calls-wallet.md#getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.
* [GetAddressInfo](../api/remote-procedure-calls-wallet.md#getaddressinfo): returns information about the given Dash address.

## VerifyMessage

The [`verifymessage` RPC](../api/remote-procedure-calls-util.md#verifymessage) verifies a signed message.

*Parameter #1---the address corresponding to the signing key*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH address corresponding to the private key which made the signature.  A P2PKH address is a hash of the public key corresponding to the private key which made the signature.  When the ECDSA signature is checked, up to four possible ECDSA public keys will be reconstructed from from the signature; each key will be hashed and compared against the P2PKH address provided to see if any of them match.  If there are no matches, signature validation will fail

*Parameter #2---the signature*

Name | Type | Presence | Description
--- | --- | --- | ---
Signature | string (base64) | Required<br>(exactly 1) | The signature created by the signer encoded as base-64 (the format output by the [`signmessage` RPC](../api/remote-procedure-calls-wallet.md#signmessage))

*Parameter #3---the message*

Name | Type | Presence | Description
--- | --- | --- | ---
Message | string | Required<br>(exactly 1) | The message exactly as it was signed (e.g. no extra whitespace)

*Result: `true`, `false`, or an error*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | boolean | Required<br>(exactly 1) | Set to `true` if the message was signed by a key corresponding to the provided P2PKH address; set to `false` if it was not signed by that key; set to JSON `null` if an error occurred

*Example from Dash Core 0.12.2*

Check the signature on the message created in the example for
`signmessage`:

``` bash
dash-cli -testnet verifymessage \
  yNpezfFDfoikDuT1f4iK75AiLp2YLPsGAb \
  H4XULzfHCf16In2ECk9Ta9QxQPq639zQto2JA3OLlo3JbUdrClvJ89+A1z+Z9POd6l8LJhn1jGpQYF8mX4jkQvE= \
  'Hello, World!'
```

Result:

``` json
true
```

*See also*

* [SignMessage](../api/remote-procedure-calls-wallet.md#signmessage): signs a message with the private key of an address.
