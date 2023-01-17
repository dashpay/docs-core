# Wallet RPCs (Deprecated)

>❗️ Wallet Support
>
> RPCs that require wallet support are **not available on masternodes** for security reasons. Such RPCs are designated with a "_Requires wallet support_" message.

## GetAccount

>❗️
>
> **Warning:** `setaccount` will be removed in Dash Core v18.0. Use the RPCs listed in the See Also subsection below instead. To use this command in Dash Core v0.17, start dashd with `-deprecatedrpc=accounts`.

> 📘 
>
> Requires <<glossary:wallet>> support (**unavailable on masternodes**)

The [`getaccount` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccount) returns the name of the account associated with the given address.


*Parameter #1---a Dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | A P2PKH or P2SH Dash address belonging either to a specific account or the default account (\\")"

*Result---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string | Required<br>(exactly 1) | The name of an account, or an empty string (\\", the default account)"

*Example from Dash Core 0.12.2*

``` bash
dash-cli -testnet getaccount yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq
```

Result:

``` text
doc test
```

*See also*

* [GetAddressesByAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaddressesbyaccount): returns a list of every address assigned to a particular account.

## GetAccountAddress

>❗️
>
> **Warning:** `getaccountaddress` will be removed in Dash Core v18.0. Use the RPCs listed in the See Also subsection below instead. To use this command in Dash Core v0.17, start dashd with `-deprecatedrpc=accounts`.

> 📘
>
> Requires <<glossary:wallet>> support (**unavailable on masternodes**)

The [`getaccountaddress` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccountaddress) returns the current Dash address for receiving payments to this account. If the account doesn't exist, it creates both the account and a new address for receiving payment.  Once a payment has been received to an address, future calls to this RPC for the same account will return a different address.

*Parameter #1---an account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of an account.  Use an empty string (\\") for the default account.  If the account doesn't exist, it will be created"

*Result---a Dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | string (base58) | Required<br>(exactly 1) | An address, belonging to the account specified, which has not yet received any payments

*Example from Dash Core 0.12.2*

Get an address for the default account:

``` bash
dash-cli -testnet getaccountaddress ""
```

Result:

``` text
yNUQ6RzTpNj5GP5ebdRcusJ7K9JJKx6VvV
```

*See also*

* [GetNewAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getnewaddress): returns a new Dash address for receiving payments. If an account is specified, payments received with the address will be credited to that account.
* [GetRawChangeAddress](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getrawchangeaddress): returns a new Dash address for receiving change. This is for use with raw transactions, not normal use.
* [GetAddressesByAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaddressesbyaccount): returns a list of every address assigned to a particular account.

## GetAddressesByAccount

>❗️
>
> **Warning:** `getaddressesbyaccount` will be removed in Dash Core v18.0. Use the RPCs listed in the See Also subsection below instead. To use this command in Dash Core v0.17, start dashd with `-deprecatedrpc=accounts`.

> 📘 
>
> Requires <<glossary:wallet>> support (**unavailable on masternodes**)

The [`getaddressesbyaccount` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaddressesbyaccount) returns a list of every address assigned to a particular account.

*Parameter #1---the account name*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of the account containing the addresses to get.  To get addresses from the default account, pass an empty string (\\")"

*Result---a list of addresses*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | array | Required<br>(exactly 1) | An array containing all addresses belonging to the specified account.  If the account has no addresses, the array will be empty
Address | string (base58) | Optional<br>(1 or more) | A P2PKH or P2SH address belonging to the account

*Example from Dash Core 0.12.2*

Get the addresses assigned to the account "doc test":

``` bash
dash-cli -testnet getaddressesbyaccount "doc test"
```

Result:

``` json
[
  "yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq",
  "yhT2HS1SxvXkMVdAdf6RNtGPfuVFvwZi35"
]
```

*See also*

* [GetAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccount): returns the name of the account associated with the given address.
* [GetBalance](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#getbalance): gets the balance in decimal dash across all accounts or for a particular account.

## SetAccount

> 🚧 
>
> **Warning:** `setaccount` will be removed in a later version of Dash Core.  Use the RPCs listed in the See Also subsection below instead.

> 📘
>
> Requires <<glossary:wallet>> support (**unavailable on masternodes**)

The [`setaccount` RPC](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#setaccount) puts the specified address in the given account.

*Parameter #1---a dash address*

Name | Type | Presence | Description
--- | --- | --- | ---
Address | string (base58) | Required<br>(exactly 1) | The P2PKH or P2SH address to put in the account.  Must already belong to the wallet

*Parameter #2---an account*

Name | Type | Presence | Description
--- | --- | --- | ---
Account | string | Required<br>(exactly 1) | The name of the account in which the address should be placed.  May be the default account, an empty string (\\")"

*Result---`null` if successful*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null | Required<br>(exactly 1) | Set to JSON `null` if the address was successfully placed in the account

*Example from Dash Core 0.12.2*

Put the address indicated below in the "doc test" account.

``` bash
dash-cli -testnet setaccount \
    yMTFRnrfJ4NpnYVeidDNHVwT7uuNsVjevq "doc test"
```

(Success: no result displayed.)

*See also*

* [GetAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaccount): returns the name of the account associated with the given address.
* [GetAddressesByAccount](../api-ref/core-api-ref-remote-procedure-calls-wallet-deprecated.md#getaddressesbyaccount): returns a list of every address assigned to a particular account.
* [SetLabel](../api-ref/core-api-ref-remote-procedure-calls-wallet.md#setlabel): sets the label associated with the given address.