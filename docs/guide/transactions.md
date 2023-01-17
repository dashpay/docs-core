# Transactions

Transactions let users spend <<glossary:duffs>>. Each <<glossary:transaction>> is constructed out of several parts which enable both simple direct payments and complex transactions. This section will describe each part and demonstrate how to use them together to build complete transactions.

To keep things simple, this section pretends coinbase transactions do not exist. Coinbase transactions can only be created by Dash miners and they're an exception to many of the rules listed below. Instead of pointing out the coinbase exception to each rule, we invite you to read about coinbase transactions in the <<glossary:block chain>> [section](../guide/block-chain) of this guide.

![The Parts Of A Transaction](https://dash-docs.github.io/img/dev/en-tx-overview.svg)

The figure above shows the main parts of a Dash transaction. Each transaction has at least one <<glossary:input>> and one <<glossary:output>>. Each <<glossary:input>> spends the duffs paid to a previous output. Each <<glossary:output>> then waits as an Unspent Transaction Output (UTXO) until a later input spends it. When your Dash wallet tells you that you have a 10,000 duff balance, it really means that you have 10,000 duffs waiting in one or more UTXOs.

Each transaction is prefixed by a four-byte <<glossary:transaction version number>> which tells Dash <<glossary:peers>> and miners which set of rules to use to validate it.  This lets developers create new rules for future transactions without invalidating previous transactions.

![Spending An Output](https://dash-docs.github.io/img/dev/en-tx-overview-spending.svg)

An output has an implied <<glossary:index>> number based on its location in the transaction---the index of the first output is zero. The output also has an amount in duffs which it pays to a conditional <<glossary:pubkey script>>. Anyone who can satisfy the conditions of that pubkey script can spend up to the amount of duffs paid to it.

An input uses a transaction identifier (<<glossary:TXID>>) and an output index number (often called "vout" for output vector) to identify a particular output to be spent. It also has a signature script which allows it to provide data parameters that satisfy the conditionals in the pubkey script. (The sequence number and locktime are related and will be covered together in a later subsection.)

The figures below help illustrate how these features are used by showing the workflow Alice uses to send Bob a transaction and which Bob later uses to spend that transaction. Both Alice and Bob will use the most common form of the standard Pay-To-Public-Key-Hash (P2PKH) transaction type. <<glossary:P2PKH>> lets Alice spend duffs to a typical Dash <<glossary:address>>, and then lets Bob further spend those duffs using a simple cryptographic key pair.

![Creating A P2PKH Public Key Hash To Receive Payment](https://dash-docs.github.io/img/dev/en-creating-p2pkh-output.svg)

Bob must first generate a private/public <<glossary:key pair>> before Alice can create the first transaction. Dash uses the Elliptic Curve Digital Signature Algorithm (ECDSA) with the secp256k1 curve; secp256k1 <<glossary:private keys>> are 256 bits of random data. A copy of that data is deterministically transformed into an secp256k1 <<glossary:public key>>. Because the transformation can be reliably repeated later, the public key does not need to be stored.

The <<glossary:public key>> (pubkey) is then cryptographically hashed. This pubkey hash can also be reliably repeated later, so it also does not need to be stored. The hash shortens and obfuscates the public key, making manual transcription easier and providing security against unanticipated problems which might allow reconstruction of <<glossary:private keys>> from public key data at some later point.

Bob provides the pubkey hash to Alice. Pubkey hashes are almost always sent encoded as a Dash <<glossary:address>>, which is a <<glossary:base58>>-encoded string containing an address version number, the hash, and an error-detection checksum to catch typos. The address can be transmitted through any medium, including one-way mediums which prevent the spender from communicating with the receiver, and it can be further encoded into another format, such as a QR code containing a `dash:` URI.

Once Alice has the address and decodes it back into a standard hash, she can create the first transaction. She creates a standard <<glossary:P2PKH>> transaction output containing instructions which allow anyone to spend that output if they can prove they control the private key corresponding to Bob's hashed public key. These instructions are called the <<glossary:pubkey script>>
or scriptPubKey.

Alice broadcasts the transaction and it is added to the block chain. The <<glossary:network>> categorizes it as an Unspent Transaction Output (UTXO), and Bob's wallet software displays it as a spendable balance.

When, some time later, Bob decides to spend the UTXO, he must create an input which references the transaction Alice created by its hash, called a Transaction Identifier (txid), and the specific output she used by its index number (<<glossary:output index>>). He must then create a <<glossary:signature script>>---a collection of data parameters which satisfy the conditions Alice placed in the previous output's pubkey script.  <<glossary:Signature scripts>> are also called scriptSigs.

Pubkey scripts and signature scripts combine secp256k1 pubkeys and <<glossary:signatures>> with conditional logic, creating a programmable authorization mechanism.

![Unlocking A P2PKH Output For Spending](https://dash-docs.github.io/img/dev/en-unlocking-p2pkh-output.svg)

For a P2PKH-style output, Bob's signature script will contain the following two pieces of data:

1. His full (unhashed) public key, so the pubkey script can check that it hashes to the same value as the pubkey hash provided by Alice.

2. An secp256k1 <<glossary:signature>> made by using the ECDSA cryptographic formula to combine certain transaction data (described below) with Bob's private key. This lets the pubkey script verify that Bob owns the private key which created the public key.

Bob's secp256k1 signature doesn't just prove Bob controls his private key; it also makes the non-signature-script parts of his transaction tamper-proof so Bob can safely broadcast them over the peer-to-peer network.

![Some Things Signed When Spending An Output](https://dash-docs.github.io/img/dev/en-signing-output-to-spend.svg)

As illustrated in the figure above, the data Bob signs includes the txid and output index of the previous transaction, the previous output's pubkey script, the pubkey script Bob creates which will let the next recipient spend this transaction's output, and the amount of duffs to spend to the next recipient. In essence, the entire transaction is signed except for any signature scripts, which hold the full public keys and secp256k1 signatures.

After putting his signature and public key in the signature script, Bob broadcasts the transaction to Dash miners through the peer-to-peer network. Each peer and miner independently validates the transaction before broadcasting it further or attempting to include it in a new block of transactions.

```{toctree}
:maxdepth: 3
:titlesonly:

transactions-p2pkh-script-validation
transactions-p2sh-scripts
transactions-standard-transactions
transactions-non-standard-transactions
transactions-signature-hash-types
transactions-locktime-and-sequence-number
transactions-transaction-fees-and-change
transactions-avoiding-key-reuse
transactions-transaction-malleability
```
