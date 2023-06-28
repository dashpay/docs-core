```{eval-rst}
.. _dashcore-arguments-and-commands-dash-wallet:
.. meta::
  :title: dash-wallet Arguments and Commnads
  :description: The dash-wallet application is an offline tool for creating and interacting with Dash Core wallet files.
```

# dash-wallet

The `dash-wallet` application is an offline tool for creating and interacting with Dash Core wallet files. By default dash-wallet will act on wallets in the default mainnet wallet directory in the datadir. To change the target wallet, use the `-datadir`, `-wallet` and `-testnet`/`-regtest` arguments.

## Usage

```bash
Usage:
  dash-wallet [options] <command>
```

### Options

```
  -?
       Print this help message and exit

  -datadir=<dir>
       Specify data directory

  -wallet=<wallet-name>
       Specify wallet name
```

### Debugging/Testing options

```
  -debug=<category>
       Output debugging information (default: 0).

  -printtoconsole
       Send trace/debug info to console (default: 1 when no -debug is true, 0
       otherwise).
```

### Chain selection options

```
  -devnet=<name>
       Use devnet chain with provided name

  -highsubsidyblocks=<n>
       The number of blocks with a higher than normal subsidy to mine at the
       start of a chain (default: 0, devnet-only)

  -highsubsidyfactor=<n>
       The factor to multiply the normal block subsidy by while in the
       highsubsidyblocks window of a chain (default: 1, devnet-only)

  -llmqchainlocks=<quorum name>
       Override the default LLMQ type used for ChainLocks. Allows using
       ChainLocks with smaller LLMQs. (default: llmq_50_60, devnet-only)

  -llmqdevnetparams=<size>:<threshold>
       Override the default LLMQ size for the LLMQ_DEVNET quorum (default: 3:2,
       devnet-only)

  -llmqinstantsend=<quorum name>
       Override the default LLMQ type used for InstantSend. Allows using
       InstantSend with smaller LLMQs. (default: llmq_50_60,
       devnet-only)

  -llmqinstantsenddip0024=<quorum name>
       Override the default LLMQ type used for InstantSendDIP0024. (default:
       llmq_60_75, devnet-only)

  -llmqplatform=<quorum name>
       Override the default LLMQ type used for Platform. (default: llmq_100_67,
       devnet-only)

  -minimumdifficultyblocks=<n>
       The number of blocks that can be mined with the minimum difficulty at
       the start of a chain (default: 0, devnet-only)

  -powtargetspacing=<n>
       Override the default PowTargetSpacing value in seconds (default: 2.5
       minutes, devnet-only)

  -testnet
       Use the test chain
```

### Commands

```
  create
       Create new wallet file

  info
       Get wallet info

  salvage
       Attempt to recover private keys from a corrupt wallet
```
