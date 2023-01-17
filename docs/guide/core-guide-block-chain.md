# Blockchain

The blockchain provides Dash's public ledger, an ordered and timestamped record of transactions. This system is used to protect against double spending and modification of previous transaction records.

Each full node in the Dash network independently stores a blockchain containing only blocks validated by that node. When several nodes all have the same blocks in their blockchain, they are considered to be in <<glossary:consensus>>. The validation rules these nodes follow to maintain consensus are called <<glossary:consensus rules>>. This section describes many of the consensus rules used by Dash Core.

```{toctree}
:maxdepth: 3

core-guide-block-chain-block-chain-overview
core-guide-block-chain-proof-of-work
core-guide-block-chain-block-height-and-forking
core-guide-block-chain-transaction-data
core-guide-block-chain-consensus-rule-changes
```
