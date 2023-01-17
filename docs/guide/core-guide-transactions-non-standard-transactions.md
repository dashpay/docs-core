# Non-Standard Transactions

If you use anything besides a standard <<glossary:pubkey script>> in an <<glossary:output>>, <<glossary:peers>> and miners using the default Dash Core settings will neither accept, broadcast, nor mine your <<glossary:transaction>>. When you try to broadcast your transaction to a peer running the default settings, you will receive an error.

If you create a <<glossary:redeem script>>, hash it, and use the hash in a <<glossary:P2SH>> output, the network sees only the hash, so it will accept the output as valid no matter what the redeem script says. This allows payment to non-standard scripts, and as of Bitcoin Core 0.11, almost all valid redeem scripts can be spent. The exception is scripts that use unassigned [NOP opcodes](https://en.bitcoin.it/wiki/Script#Reserved_words); these opcodes are reserved for future soft forks and can only be relayed or mined by nodes that don't follow the standard mempool policy.

> 📘
>
> Note: standard transactions are designed to protect and help the network, not prevent you from making mistakes. It's easy to create standard transactions which make the duffs sent to them unspendable.

Standard transactions must also meet the following conditions:

* The transaction must be finalized: either its locktime must be in the past (or less than or equal to the current block height), or all of its sequence numbers must be 0xffffffff.

* The transaction must be smaller than 100,000 bytes. That's around 200 times larger than a typical single-input, single-output P2PKH transaction.

* Each of the transaction's signature scripts must be smaller than 1,650 bytes. That's large enough to allow 15-of-15 multisig transactions in P2SH using compressed <<glossary:public keys>>.

* Bare (non-P2SH) multisig transactions which require more than 3 public keys are currently non-standard.

* The transaction's <<glossary:signature script>> must only push data to the script evaluation stack. It cannot push new opcodes, with the exception of opcodes which solely push data to the stack.

* The transaction must not include any <<glossary:outputs>> which receive fewer than 1/3 as many <<glossary:duffs>> as it would take to spend it in a typical <<glossary:input>>. That's currently 5460 duffs for a P2PKH or P2SH output on a Dash Core node with the default relay fee. **Exception: standard null data outputs must receive zero duffs.**