# Retrieving a MerkleBlock

For the [`merkleblock` message](../ref/core-ref-p2p-network-data-messages.md#merkleblock) documentation on the reference page, an actual <<glossary:merkle block>> was retrieved from the <<glossary:network>> and manually processed.  This section walks through each step of the process, demonstrating basic network communication and merkle block processing.
[block:code]
{
  "codes": [
    {
      "code": "#!/usr/bin/env python\n\nfrom time import sleep\nfrom hashlib import sha256\nimport struct\nimport sys\n\nnetwork_string = \"f9beb4d9\".decode(\"hex\")  # Mainnet\n\ndef send(msg,payload):\n    ## Command is ASCII text, null padded to 12 bytes\n    command = msg + ( ( 12 - len(msg) ) * \"\\00\" )\n\n    ## Payload length is a uint32_t\n    payload_raw = payload.decode(\"hex\")\n    payload_len = struct.pack(\"I\", len(payload_raw))\n\n    ## Checksum is first 4 bytes of SHA256(SHA256(<payload>))\n    checksum = sha256(sha256(payload_raw).digest()).digest()[:4]\n\n    sys.stdout.write(\n        network_string\n        + command\n        + payload_len\n        + checksum\n        + payload_raw\n    )\n    sys.stdout.flush()",
      "language": "python"
    }
  ]
}
[/block]

To connect to the P2P <<glossary:network>>, the trivial Python function above was developed to compute message headers and send payloads decoded from hex.
[block:code]
{
  "codes": [
    {
      "code": "## Create a version message\nsend(\"version\",\n      \"71110100\" # ........................ Protocol Version: 70001\n    + \"0000000000000000\" # ................ Services: Headers Only (SPV)\n    + \"c6925e5400000000\" # ................ Time: 1415484102\n    + \"00000000000000000000000000000000\"\n    + \"0000ffff7f000001208d\" # ............ Receiver IP Address/Port\n    + \"00000000000000000000000000000000\"\n    + \"0000ffff7f000001208d\" # ............ Sender IP Address/Port\n    + \"0000000000000000\" # ................ Nonce (not used here)\n    + \"1b\" # .............................. Bytes in version string\n    + \"2f426974636f696e2e6f726720457861\"\n    + \"6d706c653a302e392e332f\" # .......... Version string\n    + \"93050500\" # ........................ Starting block height: 329107\n    + \"00\" # .............................. Relay transactions: false\n)",
      "language": "python"
    }
  ]
}
[/block]

Peers on the network will not accept any requests until you send them a [`version` message](../ref/core-ref-p2p-network-control-messages.md#version). The receiving node will reply with their [`version` message](../ref/core-ref-p2p-network-control-messages.md#version) and a [`verack` message](../ref/core-ref-p2p-network-control-messages.md#verack).

``` python
sleep(1)
send("verack", "")
```

We're not going to validate their [`version` message](../ref/core-ref-p2p-network-control-messages.md#version) with this simple script, but we will sleep a short bit and send back our own [`verack` message](../ref/core-ref-p2p-network-control-messages.md#verack) as if we had accepted their [`version` message](../ref/core-ref-p2p-network-control-messages.md#version).

``` python
send("filterload",
      "02"  # ........ Filter bytes: 2
    + "b50f" # ....... Filter: 1010 1101 1111 0000
    + "0b000000" # ... nHashFuncs: 11
    + "00000000" # ... nTweak: 0/none
    + "00" # ......... nFlags: BLOOM_UPDATE_NONE
)
```

We set a <<glossary:bloom filter>> with the [`filterload` message](../ref/core-ref-p2p-network-control-messages.md#filterload). This filter is described in the preceding sections.

``` python
send("getdata",
      "01" # ................................. Number of inventories: 1
    + "03000000" # ........................... Inventory type: filtered block
    + "a4deb66c0d726b0aefb03ed51be407fb"
    + "ad7331c6e8f9eef231b7000000000000" # ... Block header hash
)
```

We request a merkle block for transactions matching our filter, completing our script.

To run the script, we simply pipe it to the Unix [`netcat` command](https://en.wikipedia.org/wiki/Netcat) or one of its many clones, one of which is available for practically any platform. For example, with the original netcat and using hexdump (`hd`) to display the output:

``` bash
## Connect to the Bitcoin Core peer running on localhost
python get-merkle.py | nc localhost 8333 | hd
```

Part of the response is shown in the [Parsing a MerkleBlock](core-examples-p2p-network-parsing-a-merkleblock) section.