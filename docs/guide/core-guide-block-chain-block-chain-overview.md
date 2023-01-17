# Blockchain Overview

![Block Chain Overview](https://dash-docs.github.io/img/dev/en-blockchain-overview.svg)

The illustration above shows a simplified version of a <<glossary:block chain>>. A <<glossary:block>> of one or more new transactions is collected into the <<glossary:transaction>> data part of a block. Copies of each transaction are hashed, and the hashes are then paired, hashed, paired again, and hashed again until a single hash remains, the <<glossary:merkle root>> of a <<glossary:merkle tree>>.

The merkle root is stored in the <<glossary:block header>>. Each block also stores the hash of the previous block's header, chaining the blocks together. This ensures a transaction cannot be modified without modifying the block that records it and all following blocks.

Transactions are also chained together. Dash <<glossary:wallet>> software gives the impression that <<glossary:duffs>> are sent from and to wallets, but Dash value really moves from transaction to transaction. Each transaction spends the duffs previously received in one or more earlier transactions, so the input of one transaction is the output of a previous transaction.

![Transaction Propagation](https://dash-docs.github.io/img/dev/en-transaction-propagation.svg)

A single transaction can create multiple <<glossary:outputs>>, as would be the case when sending to multiple <<glossary:addresses>>, but each output of a particular transaction can only be used as an <<glossary:input>> once in the blockchain. Any subsequent reference is a forbidden double spend---an attempt to spend the same duffs twice.

Outputs are tied to <<glossary:transaction identifiers>> ( TXIDs), which are the hashes of signed transactions.

Because each output of a particular transaction can only be spent once, the outputs of a transaction included in the blockchain can be categorized as either an <<glossary:unspent transaction output>> or a spent transaction output. For a payment to be valid, it must only use UTXOs as inputs.

Ignoring coinbase transactions (described later), if the value of a transaction's outputs exceed its inputs, the transaction will be rejected---but if the inputs exceed the value of the outputs, any difference in value may be claimed as a <<glossary:transaction fee>> by the Dash <<glossary:miner>> who creates the block containing that transaction. For example, in the illustration above, each transaction spends 10,000 duffs fewer than it receives from its combined inputs, effectively paying a 10,000 duff transaction fee.