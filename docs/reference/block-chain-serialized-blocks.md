# Serialized Blocks

Under current <<glossary:consensus rules>>, a <<glossary:block>> is not valid unless its serialized size is less than or equal to 2 MB. All fields described below are counted towards the serialized size.

| Bytes    | Name         | Data Type        | Description |
| - | - | - | - |
| 80       | block header | block_header     | The <<glossary:block header>> in the format described in the [block header section](../ref/core-ref-block-chain-block-headers.md).
| *Varies* | txn_count    | <<glossary:compactSize uint>> | The total number of transactions in this block, including the coinbase transaction.
| *Varies* | txns         | <<glossary:raw transaction>>  | Every transaction in this block, one after another, in raw transaction format.  Transactions must appear in the data stream in the same order their TXIDs appeared in the first row of the merkle tree.  See the [merkle tree section](../ref/core-ref-block-chain-block-headers.md#merkle-trees) for details.

## Coinbase

The first transaction in a block must be a <<glossary:coinbase transaction>> which should collect and spend any <<glossary:transaction fee>> paid by transactions included in this block.

### Block Subsidy
Until the coin limit (~18 million Dash) is hit, all blocks are entitled to receive a block subsidy of newly created Dash value. The newly created value should be spent in the coinbase transaction.

The block subsidy declines by ~7.1% per year until all Dash is mined. Subsidy calculations are performed by the Dash Core [GetBlockSubsidy()](https://github.com/dashpay/dash/blob/v0.15.x/src/validation.cpp#L1012) function.

### Block Reward
Together, the transaction fees and block subsidy are called the <<glossary:block reward>>. A coinbase transaction is invalid if it tries to spend more value than is available from the block reward.

The block reward is divided into three parts: <<glossary:miner>>, <<glossary:masternode>>, and <<glossary:superblock>>. The miner and masternode portions add up to 90% of the block subsidy with the remaining 10% allocated to the governance system.

| Payee | Subsidy | Description |
| ----- | -------- | ----------- |
| Miner | Varies | Payment for mining
| Masternode | Varies | Payment for masternode services ([CoinJoin](../guide/core-guide-dash-features-privatesend.md), [InstantSend](../guide/core-guide-dash-features-instantsend.md), [Governance](https://docs.dash.org/en/stable/introduction/features.html#decentralized-governance), etc.)
| Superblock | 10% | Payment for maintenance/expansion of the ecosystem (Core development, marketing, integration, etc.)
[block:image]
{
  "images": [
    {
      "image": [
        "https://files.readme.io/fa5bfbe-mining-banner-1.svg",
        "mining-banner-1.svg",
        217,
        150,
        "#ffffff"
      ],
      "sizing": "50"
    }
  ]
}
[/block]
#### Block Reward Reallocation

Dash Core v0.16 included logic to gradually adjust the block reward allocation once the BIP-9 activation threshold was met. The reward reallocation was signaled via BIP-9 bit 5 and was activated at block 1374912 upon signalling by a sufficient number of blocks. 

This reallocation will eventually result in miners receiving 40% of the non-governance block subsidy and masternodes receiving 60% of it rather than the 50/50 split that was used for several years.

**Reward reallocation changes**

Reward reallocation changes began at the first superblock following activation (block 1379128) and then occur every three superblock cycles (approximately once per quarter) until the reallocation is complete.

| Quarter | Block     | Miner % | Masternode % | Change \(%\) |
| :-: | :-: | :-: | :-: | :-:
| -               | -                    | 50     | 50          | 0.00%      |
| Q4 2020 | 1,379,128      | 48.7   | 51.3        | 1.30%       |
| Q1 2021   | 1,428,976    | 47.4    | 52.6        | 1.30%      |
| Q2 2021  | 1,478,824     | 46.7   | 53.3        | 0.70%      |
| Q3 2021  | 1,528,672     | 46.0  | 54.0         | 0.70%      |
| Q4 2021  | 1,578,520     | 45.4   | 54.6        | 0.60%     |
| Q1 2022  | 1,628,368     | 44.8   | 55.2        | 0.60%     |
| Q2 2022 | 1,678,216      | 44.3   | 55.7        | 0.50%      |
| Q3 2022 | 1,728,064     | 43.8   | 56.2        | 0.50%      |
| **Q4 2022** | **1,777,912**       | **43.3**   | **56.7**        | **0.50%**       |
| Q1 2023  | 1,827,760      | 42.8   | 57.2        | 0.50%      |
| Q2 2023 | 1,877,608      | 42.3   | 57.7        | 0.50%       |
| Q3 2023 | 1,927,456      | 41.8   | 58.2        | 0.50%       |
| Q4 2023 | 1,977,304      | 41.5   | 58.5        | 0.30%       |
| Q1 2024  | 2,027,152      | 41.2   | 58.8        | 0.30%       |
| Q2 2024 | 2,077,000     | 40.9   | 59.1        | 0.30%       |
| Q3 2024 | 2,126,848      | 40.6   | 59.4        | 0.30%      |
| Q4 2024 | 2,176,696      | 40.3   | 59.7        | 0.30%       |
| Q1 2025  | 2,226,544     | 40.1   | 59.9        | 0.20%       |
| Q2 2025 | 2,276,392     | 40      | 60           | 0.10%       |