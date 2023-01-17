# P2P Networks

This section describes the Dash P2P network protocol (but it is not a specification). It does not describe the <<glossary:BIP70 payment protocol>>, the [GetBlockTemplate mining protocol](../guide/core-guide-mining-block-prototypes.md#getblocktemplate-rpc), or any network protocol never implemented in an official version of Dash Core.

All peer-to-peer communication occurs entirely over TCP.

> 🚧 
>
> Note: unless their description says otherwise, all multi-byte integers mentioned in this section are transmitted in little-endian order.
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/2f6f207-home-map-1.svg",
        "home-map-1.svg",
        259,
        150,
        "#000000"
      ],
      "sizing": "55"
    }
  ]
}
[/block]

```{toctree}
:maxdepth: 2

core-ref-p2p-network-constants-and-defaults
core-ref-p2p-network-protocol-versions
core-ref-p2p-network-message-headers
core-ref-p2p-network-control-messages
core-ref-p2p-network-data-messages
core-ref-p2p-network-governance-messages
core-ref-p2p-network-instantsend-messages
core-ref-p2p-network-masternode-messages
core-ref-p2p-network-privatesend-messages
core-ref-p2p-network-quorum-messages
core-ref-p2p-network-deprecated-messages
```
