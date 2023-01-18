#!/bin/bash

# Replace readme.io's proprietary <<glossary:term>> syntax with markdown links to the terms on the
# glossary page (glossary.md)
find . -iname "*.md" -exec sed -i 's~<<glossary:address>>~[address](../resources/glossary.md#address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:addresses>>~[addresses](../resources/glossary.md#address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:base58>>~[base58](../resources/glossary.md#base58)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:base58check>>~[base58check](../resources/glossary.md#base58check)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Base58Check>>~[Base58Check](../resources/glossary.md#base58check)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:BIP32>>~[BIP32](../resources/glossary.md#bip32)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:BIP70 payment protocol>>~[BIP70 payment protocol](../resources/glossary.md#bip70-payment-protocol)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block>>~[block](../resources/glossary.md#block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocks>>~[blocks](../resources/glossary.md#block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocks-first>>~[blocks-first](../resources/glossary.md#blocks-first-sync)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block chain>>~[block chain](../resources/glossary.md#block-chain)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block header>>~[block header](../resources/glossary.md#block-header)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Block headers>>~[Block headers](../resources/glossary.md#block-header)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block height>>~[block height](../resources/glossary.md#block-height)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block reward>>~[block reward](../resources/glossary.md#block-reward)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:bloom filter>>~[bloom filter](../resources/glossary.md#bloom-filter)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:masternode>>~[masternode](../resources/glossary.md#masternode)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:wallet>>~[wallet](../resources/glossary.md#wallet)~g' {} +
