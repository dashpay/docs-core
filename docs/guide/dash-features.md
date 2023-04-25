# Dash Features

## Overview

Dash aims to be the most user-friendly and scalable payments-focused cryptocurrency in the world. The Dash [network](../resources/glossary.md#network) features instant transaction confirmation, double spend protection, anonymity similar to that of physical cash, a self-governing, self-funding model driven by incentivized full [nodes](../resources/glossary.md#node) (masternodes) and a clear [roadmap](https://www.dash.org/roadmap/) for future development.

## Dash Nodes

While Dash is based on Bitcoin and compatible with many key components of the Bitcoin ecosystem, its two-tier network structure offers significant improvements in transaction speed, anonymity and governance. This section of the documentation describes these key features that set Dash apart in the blockchain economy.

### Masternodes

The most important differentiating feature of the Dash payments network is the concept of a masternode. On a traditional p2p network, nodes participate equally in the sharing of data and network resources.

However, the Dash network has a second layer of network participants that provide enhanced functionality in exchange for compensation. This second layer of masternodes enables the industry-leading features described in this section - most notably: [InstantSend](../guide/dash-features-instantsend.md), [ChainLocks](../guide/dash-features-chainlocks.md), [CoinJoin](../guide/dash-features-privatesend.md), and [Governance](../guide/dash-features-governance.md).

#### High-Performance Masternodes

> 📘
>
> New in Dash Core v19.0

High-Performance Masternodes (HPMNs) are a new type of masternode created to host [Dash Platform](https://dashplatform.readme.io/docs/introduction-what-is-dash-platform) – a Web3 technology stack for building decentralized applications on the Dash network. The collateral required to own an HPMN is 4000 DASH, as opposed to 1000 DASH for regular masternodes.

HPMNs serve Platform along with Core, while regular masternodes only serve Core. The recommended specs for HPMNs are higher than those for regular masternodes. HPMNs will receive 100% of the fees generated from Platform and 37.5% of the masternode portion of Core block rewards. Regular MNs will receive the remaining 62.5% of the masternode portion of Core block rewards and 0% of Platform fees.

### Full nodes

Full nodes in Dash are equivalent to full nodes in Bitcoin. They download and validate the entire blockchain against the consensus rules. Unlike masternodes, full nodes do not provide additional services and thus are not compensated.

### Disable Governance Mode

> 📘
>
> New in Dash Core v0.16.0

Prior to Dash Core v0.16.0, Lite Mode disabled all Dash-specific functionality. Dash Core v0.16.0 introduced Disable Governance Mode to replace Lite Mode. This mode enables access to most Dash features (e.g., InstantSend, ChainLocks, and CoinJoin) while also supporting block pruning.

As with the previous Lite Mode, masternodes **_cannot_** be run in disable governance mode since they are paid to provide governance services that the mode disables.

Disable governance mode is enable by setting `disablegovernance=1` in the `dash.conf` file or by running Dash Core with the command line parameter `-disablegovernance=1`.

### Lite Mode

>❗️ Deprecated in Dash Core v0.16.0
>
> Please use [disable governance](#disable-governance-mode) mode

Lite mode provides a way to run Dash Core full nodes with Dash-specific functionality disabled. Masternodes **_cannot_** be run in lite mode since they are paid to provide the services that lite mode disables. Disabled items include: [InstantSend](../guide/dash-features-instantsend.md), [ChainLocks](../guide/dash-features-chainlocks.md), [CoinJoin](../guide/dash-features-privatesend.md), Masternode-related information, and [Governance](../guide/dash-features-governance.md) details.

>❗️ Lite mode effects
>
> Since nodes running in lite mode do not execute InstantSend/ChainLock logic, they are unaware of transaction lock status and will always show `false` for the lock status returned in RPC responses (e.g. [GetTransaction's](../api/remote-procedure-calls-wallet.md#gettransaction) `chainlock`, `instantlock`, and `instantlock_internal` fields).

Lite mode is enable by setting `litemode=1` in the `dash.conf` file or by running Dash Core with the command line parameter `-litemode=1`.

```{toctree}
:maxdepth: 3

dash-features-instantsend
dash-features-chainlocks
dash-features-governance
dash-features-privatesend
dash-features-masternode-quorums
dash-features-proof-of-service
dash-features-masternode-payment
dash-features-masternode-sync
dash-features-historical-reference
```
