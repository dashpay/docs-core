#!/bin/bash

# Replace readme.io's proprietary <<glossary:term>> syntax with markdown links to the terms on the
# glossary page (glossary.md)
find . -iname "*.md" -exec sed -i 's~<<glossary:address>>~[address](../resources/glossary.md#address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:base58>>~[base58](../resources/glossary.md#base58)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:base58check>>~[base58check](../resources/glossary.md#base58check)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:BIP32>>~[BIP32](../resources/glossary.md#bip32)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:BIP70 payment protocol>>~[BIP70 payment protocol](../resources/glossary.md#bip70-payment-protocol)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocks>>~[blocks](../resources/glossary.md#block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocks-first>>~[blocks-first](../resources/glossary.md#blocks-first-sync)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block chain>>~[block chain](../resources/glossary.md#block-chain)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block header>>~[block header](../resources/glossary.md#block-header)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block height>>~[block height](../resources/glossary.md#block-height)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block reward>>~[block reward](../resources/glossary.md#block-reward)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:bloom filter>>~[bloom filter](../resources/glossary.md#bloom-filter)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:masternode>>~[masternode](../resources/glossary.md#masternode)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:wallet>>~[wallet](../resources/glossary.md#wallet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:block size limit>>~[block size limit](../resources/glossary.md#block-size-limit)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocks-first-sync>>~[blocks-first-sync](../resources/glossary.md#blocks-first-sync)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocktransactions>>~[blocktransactions](../resources/glossary.md#blocktransactions)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:blocktransactionsrequest >>~[blocktransactionsrequest ](../resources/glossary.md#blocktransactionsrequest s)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Bloom-filter>>~[bloom-filter](../resources/glossary.md#bloom-filter)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:chain code>>~[chain code](../resources/glossary.md#chain-code)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:ChainLocks>>~[ChainLocks](../resources/glossary.md#ChainLock)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:change>>~[change](../resources/glossary.md#change)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:child key>>~[child key](../resources/glossary.md#child-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:child pays for parent>>~[child pays for parent](../resources/glossary.md#child-pays-for-parent)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:cpfp>>~[cpfp](../resources/glossary.md#cpfp)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:coinbase>>~[coinbase](../resources/glossary.md#coinbase)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:coinbase-block-height>>~[coinbase-block-height](../resources/glossary.md#coinbase-block-height)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:coinbase transaction>>~[coinbase transaction](../resources/glossary.md#coinbase-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:coinjoin>>~[coinjoin](../resources/glossary.md#coinjoin)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:CompactSize unsigned integer>>~[CompactSize unsigned integer](../resources/glossary.md#compactsize)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:compressed public key>>~[compressed public key](../resources/glossary.md#compressed-public-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:confirmation score>>~[confirmation score](../resources/glossary.md#confirmation-score)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:RBF>>~[RBF](../resources/glossary.md#rbf)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:consensus>>~[consensus](../resources/glossary.md#consensus)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:consensus rules>>~[consensus rules](../resources/glossary.md#consensus-rules)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Dark Gravity Wave>>~[Dark Gravity Wave](../resources/glossary.md#dark-gravity-wave)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Dash address encoding>>~[Dash address encoding](../resources/glossary.md#dash-address-encoding)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:consensus-rules>>~[consensus-rules](../resources/glossary.md#consensus-rules)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:dash-address-encoding>>~[dash-address-encoding](../resources/glossary.md#dash-address-encoding)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:data-pushing-opcode>>~[data-pushing-opcode](../resources/glossary.md#data-pushing-opcode)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Decentralized Governance By Blockchain>>~[Decentralized Governance By Blockchain](../resources/glossary.md#decentralized-governance-by-blockchain)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:denominations>>~[denominations](../resources/glossary.md#denominations)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:devnet>>~[devnet](../resources/glossary.md#devnet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:difficulty>>~[difficulty](../resources/glossary.md#difficulty)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:DNS seed>>~[DNS seed](../resources/glossary.md#dns-seed)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:double spend>>~[double spend](../resources/glossary.md#double-spend)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:duffs>>~[duffs](../resources/glossary.md#duffs)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:ecdsa-private-key>>~[ecdsa-private-key](../resources/glossary.md#ecdsa-private-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:escrow contract>>~[escrow contract](../resources/glossary.md#escrow-contract)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Evolution>>~[Evolution](../resources/glossary.md#evolution)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:extended key>>~[extended key](../resources/glossary.md#extended-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:extended-private-key>>~[extended-private-key](../resources/glossary.md#extended-private-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:fork>>~[fork](../resources/glossary.md#fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:genesis block>>~[genesis block](../resources/glossary.md#genesis-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:hard fork>>~[hard fork](../resources/glossary.md#hard-fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:hardened extended key>>~[hardened extended key](../resources/glossary.md#hardened-extended-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:HD wallet>>~[HD wallet](../resources/glossary.md#hd-wallet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:HD protocol>>~[HD protocol](../resources/glossary.md#hd-protocol)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:HD wallet seed>>~[HD wallet seed](../resources/glossary.md#hd-wallet-seed)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:header>>~[header](../resources/glossary.md#header)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:header chain>>~[header chain](../resources/glossary.md#header-chain)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:headerandshortids>>~[headerandshortids](../resources/glossary.md#headerandshortids)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:headers-first>>~[headers-first](../resources/glossary.md#headers-first)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:high-priority transaction>>~[high-priority transaction](../resources/glossary.md#high-priority-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:IBD>>~[IBD](../resources/glossary.md#ibd)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:index>>~[index](../resources/glossary.md#index)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:initial block download>>~[initial block download](../resources/glossary.md#initial-block-download)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:input>>~[input](../resources/glossary.md#input)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:InstantSend>>~[InstantSend](../resources/glossary.md#instantsend)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:internal byte order>>~[internal byte order](../resources/glossary.md#internal-byte-order)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:inventory>>~[inventory](../resources/glossary.md#inventory)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:key-index>>~[key-index](../resources/glossary.md#key-index)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:key-pair>>~[key-pair](../resources/glossary.md#key-pair)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:locktime>>~[locktime](../resources/glossary.md#locktime)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Long-Living Masternode Quorum>>~[Long-Living Masternode Quorum](../resources/glossary.md#long-living-masternode-quorum)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:M-of-N multisig>>~[M-of-N multisig](../resources/glossary.md#m-of-n-multisig)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:mainnet>>~[mainnet](../resources/glossary.md#mainnet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Majority Hash Rate Attack
>>~[Majority Hash Rate Attack](../resources/glossary.md#majority-hash-rate-attack)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:malleability>>~[malleability](../resources/glossary.md#malleability)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:master chain code and private key
>>~[master chain code and private key](../resources/glossary.md#master-chain-code-and-private-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:master-private-key>>~[master-private-key](../resources/glossary.md#master-private-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:merkle block>>~[merkle block](../resources/glossary.md#merkle-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:merkle root>>~[merkle root](../resources/glossary.md#merkle-root)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:merkle tree>>~[merkle tree](../resources/glossary.md#merkle-tree)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:message header>>~[message header](../resources/glossary.md#message-header)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:miner>>~[miner](../resources/glossary.md#miner)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:miner-activated-soft-fork>>~[miner-activated-soft-fork](../resources/glossary.md#miner-activated-soft-fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:miner-fee>>~[miner-fee](../resources/glossary.md#miner-fee)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:miners>>~[miners](../resources/glossary.md#miners)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:minimum relay fee>>~[minimum relay fee](../resources/glossary.md#minimum-relay-fee)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:mining>>~[mining](../resources/glossary.md#mining)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:multi-phased-fork>>~[multi-phased-fork](../resources/glossary.md#multi-phased-fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:multisig>>~[multisig](../resources/glossary.md#multisig)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:nBits>>~[nBits](../resources/glossary.md#nbits)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:network>>~[network](../resources/glossary.md#network)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:network-magic>>~[network-magic](../resources/glossary.md#network-magic)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:nLockTime>>~[nLockTime](../resources/glossary.md#nlocktime)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:node>>~[node](../resources/glossary.md#node)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:null data (OP_RETURN) transaction>>~[null data (OP_RETURN) transaction](../resources/glossary.md#null-data-op_return-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:opcode>>~[opcode](../resources/glossary.md#opcode)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:orphan block>>~[orphan block](../resources/glossary.md#orphan-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:outpoint>>~[outpoint](../resources/glossary.md#outpoint)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:output>>~[output](../resources/glossary.md#output)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:output-index>>~[output-index](../resources/glossary.md#output-index)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:P2PKH address>>~[P2PKH address](../resources/glossary.md#p2pkh-address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:P2SH address>>~[P2SH address](../resources/glossary.md#p2sh-address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:P2SH multisig>>~[P2SH multisig](../resources/glossary.md#p2sh-multisig)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:p2sh-output>>~[p2sh-output](../resources/glossary.md#p2sh-output)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:p2sh-pubkey-script>>~[p2sh-pubkey-script](../resources/glossary.md#p2sh-pubkey-script)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:parent-chain-code>>~[parent-chain-code](../resources/glossary.md#parent-chain-code)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:parent key>>~[parent key](../resources/glossary.md#parent-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:payment-protocol>>~[payment-protocol](../resources/glossary.md#payment-protocol)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:peer>>~[peer](../resources/glossary.md#peer)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:point-function>>~[point-function](../resources/glossary.md#point-function)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:previous-block-header-hash>>~[previous-block-header-hash](../resources/glossary.md#previous-block-header-hash)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:private-key>>~[private-key](../resources/glossary.md#private-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:privatesend>>~[privatesend](../resources/glossary.md#privatesend)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:proof of work>>~[proof of work](../resources/glossary.md#proof-of-work)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:pubkey script>>~[pubkey script](../resources/glossary.md#pubkey-script)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:public-key>>~[public-key](../resources/glossary.md#public-key)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:raw-block>>~[raw-block](../resources/glossary.md#raw-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:raw-format>>~[raw-format](../resources/glossary.md#raw-format)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:raw-transaction>>~[raw-transaction](../resources/glossary.md#raw-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:replace-by-fee>>~[replace-by-fee](../resources/glossary.md#replace-by-fee)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:redeem script>>~[redeem script](../resources/glossary.md#redeem-script)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:regression test mode>>~[regression test mode](../resources/glossary.md#regression-test-mode)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:root-seed>>~[root-seed](../resources/glossary.md#root-seed)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:RPC byte order>>~[RPC byte order](../resources/glossary.md#rpc-byte-order)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:scriptsig>>~[scriptsig](../resources/glossary.md#scriptsig)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:secp256k1-signatures>>~[secp256k1-signatures](../resources/glossary.md#secp256k1-signatures)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:Sentinel>>~[Sentinel](../resources/glossary.md#sentinel)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sequence number>>~[sequence number](../resources/glossary.md#sequence-number)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:serialized block>>~[serialized block](../resources/glossary.md#serialized-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:serialized-transaction>>~[serialized-transaction](../resources/glossary.md#serialized-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sighash-flag>>~[sighash-flag](../resources/glossary.md#sighash-flag)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sighash_all>>~[sighash_all](../resources/glossary.md#sighash_all)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sighash_anyonecanpay>>~[sighash_anyonecanpay](../resources/glossary.md#sighash_anyonecanpay)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sighash_none>>~[sighash_none](../resources/glossary.md#sighash_none)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:sighash_single>>~[sighash_single](../resources/glossary.md#sighash_single)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:signature>>~[signature](../resources/glossary.md#signature)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:signature-hash>>~[signature-hash](../resources/glossary.md#signature-hash)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:signature-script>>~[signature-script](../resources/glossary.md#signature-script)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:simplified-payment-verification>>~[simplified-payment-verification](../resources/glossary.md#simplified-payment-verification)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:soft-fork>>~[soft-fork](../resources/glossary.md#soft-fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:special-transactions>>~[special-transactions](../resources/glossary.md#special-transactions)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:spork>>~[spork](../resources/glossary.md#spork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:stale-block>>~[stale-block](../resources/glossary.md#stale-block)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:standard-block-relay>>~[standard-block-relay](../resources/glossary.md#standard-block-relay)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:standard-transaction>>~[standard-transaction](../resources/glossary.md#standard-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:start-string>>~[start-string](../resources/glossary.md#start-string)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:superblock>>~[superblock](../resources/glossary.md#superblock)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:target>>~[target](../resources/glossary.md#target)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:target threshold>>~[target threshold](../resources/glossary.md#target-threshold)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:testnet>>~[testnet](../resources/glossary.md#testnet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:transaction>>~[transaction](../resources/glossary.md#transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:transaction-fee>>~[transaction-fee](../resources/glossary.md#transaction-fee)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:transaction-identifiers>>~[transaction-identifiers](../resources/glossary.md#transaction-identifiers)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:transaction-version-number>>~[transaction-version-number](../resources/glossary.md#transaction-version-number)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unconfirmed-transaction>>~[unconfirmed-transaction](../resources/glossary.md#unconfirmed-transaction)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unencrypted-wallet>>~[unencrypted-wallet](../resources/glossary.md#unencrypted-wallet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unique-addresses>>~[unique-addresses](../resources/glossary.md#unique-addresses)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unlocked-wallet>>~[unlocked-wallet](../resources/glossary.md#unlocked-wallet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unsolicited-block-push>>~[unsolicited-block-push](../resources/glossary.md#unsolicited-block-push)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:unspent-transaction-output>>~[unspent-transaction-output](../resources/glossary.md#unspent-transaction-output)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:user-activated-soft-fork>>~[user-activated-soft-fork](../resources/glossary.md#user-activated-soft-fork)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:wallet>>~[wallet](../resources/glossary.md#wallet)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:wallet-import-format>>~[wallet-import-format](../resources/glossary.md#wallet-import-format)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:wallet-support>>~[wallet-support](../resources/glossary.md#wallet-support)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:watch-only-address>>~[watch-only-address](../resources/glossary.md#watch-only-address)~g' {} +
find . -iname "*.md" -exec sed -i 's~<<glossary:x11>>~[x11](../resources/glossary.md#x11)~g' {} +