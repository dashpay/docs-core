#!/bin/bash

# Core Reference
find . -iname "*.md" -exec sed -i 's~](core-ref-block-chain-block-headers~](\.\./reference/block-chain-block-headers.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-block-chain-serialized-blocks~](\.\./reference/block-chain-serialized-blocks.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-raw-transaction-format~](\.\./reference/transactions-raw-transaction-format.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-special-transactions~](\.\./reference/transactions-special-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-compactsize-unsigned-integers~](\.\./reference/transactions-compactsize-unsigned-integers.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-constants-and-defaults~](\.\./reference/p2p-network-constants-and-defaults.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-protocol-versions~](\.\./reference/p2p-network-protocol-versions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-message-headers)~](\.\./reference/p2p-network-message-headers.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-control-messages~](\.\./reference/p2p-network-control-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-data-messages~](\.\./reference/p2p-network-data-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-governance-messages~](\.\./reference/p2p-network-governance-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-instantsend-messages~](\.\./reference/p2p-network-instantsend-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-masternode-messages~](\.\./reference/p2p-network-masternode-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-privatesend-messages~](\.\./reference/p2p-network-privatesend-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-p2p-network-quorum-messages~](\.\./reference/p2p-network-quorum-messages.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-transactions-opcodes~](\.\./reference/transactions-opcodes.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-ref-wallets~](\.\./reference/wallets.md~g' {} +

# Guide
find . -iname "*.md" -exec sed -i 's~](core-guide-block-chain)~](\.\./guide/block-chain.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features)~](\.\./guide/dash-features.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features#~](\.\./guide/dash-features.md#~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-chainlocks~](\.\./guide/dash-features-chainlocks.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-governance~](\.\./guide/dash-features-governance.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-historical-reference~](\.\./guide/dash-features-historical-reference.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-instantsend~](\.\./guide/dash-features-instantsend.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-payment~](\.\./guide/dash-features-masternode-payment.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-quorums~](\.\./guide/dash-features-masternode-quorums.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-masternode-sync~](\.\./guide/dash-features-masternode-sync.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-privatesend~](\.\./guide/dash-features-privatesend.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-dash-features-proof-of-service~](\.\./guide/dash-features-proof-of-service.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-mining-block-prototypes#~](\.\./guide/mining-block-prototypes.md#~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-transactions)~](\.\./guide/transactions.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-transactions-avoiding-key-reuse)~](\.\./guide/transactions-avoiding-key-reuse.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-transactions-locktime-and-sequence-number~](\.\./guide/transactions-locktime-and-sequence-number.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-transactions-transaction-malleability)~](\.\./guide/transactions-transaction-malleability.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-p2p-network-initial-block-download~](\.\./guide/p2p-network-initial-block-download.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-wallets)~](\.\./guide/wallets.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-guide-wallets-wallet-files~](\.\./guide/wallets-wallet-files.md~g' {} +

# API Reference
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls)~](\.\./api/remote-procedure-calls.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-call-quick-reference~](\.\./api/remote-procedure-call-quick-reference.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-address-index~](\.\./api/remote-procedure-calls-address-index.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-address-index~](\.\./api/remote-procedure-calls-address-index.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-blockchain~](\.\./api/remote-procedure-calls-blockchain.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-blockchain~](\.\./api/remote-procedure-calls-blockchain.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-control~](\.\./api/remote-procedure-calls-control.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-control~](\.\./api/remote-procedure-calls-control.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-dash~](\.\./api/remote-procedure-calls-dash.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-dash~](\.\./api/remote-procedure-calls-dash.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-evo~](\.\./api/remote-procedure-calls-evo.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-evo~](\.\./api/remote-procedure-calls-evo.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-generating~](\.\./api/remote-procedure-calls-generating.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-generating~](\.\./api/remote-procedure-calls-generating.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-mining~](\.\./api/remote-procedure-calls-mining.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-mining~](\.\./api/remote-procedure-calls-mining.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-network~](\.\./api/remote-procedure-calls-network.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-network~](\.\./api/remote-procedure-calls-network.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-raw-transactions~](\.\./api/remote-procedure-calls-raw-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-raw-transactions~](\.\./api/remote-procedure-calls-raw-transactions.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-removed~](\.\./api/remote-procedure-calls-removed.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-removed~](\.\./api/remote-procedure-calls-removed.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-util~](\.\./api/remote-procedure-calls-util.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-util~](\.\./api/remote-procedure-calls-util.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-wallet-deprecated~](\.\./api/remote-procedure-calls-wallet-deprecated.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-wallet-deprecated~](\.\./api/remote-procedure-calls-wallet-deprecated.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-wallet~](\.\./api/remote-procedure-calls-wallet.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-wallet~](\.\./api/remote-procedure-calls-wallet.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-remote-procedure-calls-zmq~](\.\./api/remote-procedure-calls-zmq.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-remote-procedure-calls-zmq~](\.\./api/remote-procedure-calls-zmq.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-api-ref-http-rest-requests~](\.\./api/http-rest-requests.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-http-rest-requests~](\.\./api/http-rest-requests.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-api-ref-zmq~](\.\./api/zmq.md~g' {} +

# Dash Core
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dashd~](\.\./dashcore/wallet-arguments-and-commands-dashd.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dash-cli~](\.\./dashcore/wallet-arguments-and-commands-dash-cli.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dash-tx~](\.\./dashcore/wallet-arguments-and-commands-dash-tx.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dash-qt~](\.\./dashcore/wallet-arguments-and-commands-dash-qt.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](dash-core-wallet-arguments-and-commands-dash-wallet~](\.\./dashcore/wallet-arguments-and-commands-dash-wallet.md~g' {} +


# Examples
find . -iname "*.md" -exec sed -i 's~](core-examples-introduction)~](\.\./examples/introduction.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-configuration-file)~](\.\./examples/configuration-file.md)~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-p2p-network-parsing-a-merkleblock~](\.\./examples/p2p-network-parsing-a-merkleblock.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-p2p-network-creating-a-bloom-filter~](\.\./examples/p2p-network-creating-a-bloom-filter.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-p2p-network-evaluating-a-bloom-filter~](\.\./examples/p2p-network-evaluating-a-bloom-filter.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-transaction-tutorial-simple-spending~](\.\./examples/transaction-tutorial-simple-spending.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-transaction-tutorial#simple-raw-transaction~](\.\./examples/transaction-tutorial-simple-raw-transaction.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-transaction-tutorial-simple-raw-transaction~](\.\./examples/transaction-tutorial-simple-raw-transaction.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](/docs/core-examples-transaction-tutorial-complex-raw-transaction~](\.\./examples/transaction-tutorial-complex-raw-transaction.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-transaction-tutorial-complex-raw-transaction~](\.\./examples/transaction-tutorial-complex-raw-transaction.md~g' {} +
find . -iname "*.md" -exec sed -i 's~](core-examples-transaction-tutorial-offline-signing~](\.\./examples/transaction-tutorial-offline-signing.md~g' {} +
