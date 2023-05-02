```{eval-rst}
.. _core-index:
```

# Core docs

Welcome to the Dash Core developer documentation. You'll find sections for
[reference information](reference/introduction.md), [API
details](api/remote-procedure-call-quick-reference.md),
[guides](guide/introduction.md), [examples](examples/introduction.md) and [Dash
Core wallet information](dashcore/wallet-arguments-and-commands.md) to help you
start working with Dash as quickly as possible. Let's jump right in!

Questions about Dash development are best asked in one of the [Dash development
communities](https://www.dash.org/community/). Errors or suggestions related to
documentation can be submitted as via the "Suggest Edits" button on the top,
right of each page.

```{eval-rst}
.. grid:: 1 3 3 3

    .. grid-item-card:: 🛠 Core Reference
        :margin: 2 2 auto auto
        :link-type: ref
        :link: reference-index
        
        Blockchain and protocol details 
        
        +++
        :ref:`Click to begin <reference-index>`

    .. grid-item-card:: ⚡ API Reference
        :margin: 2 2 auto auto
        :link-type: ref
        :link: api-rpc
        
        RPC, REST, and ZMQ information
        
        +++
        :ref:`Click to begin <api-rpc>`

    .. grid-item-card:: 📑 Core Guides
        :margin: 2 2 auto auto
        :link-type: ref
        :link: guide-index
        
        Dash features and operation
        
        +++
        :ref:`Click to begin <guide-index>`

    .. grid-item-card:: 🚀 Core Examples
        :margin: 2 2 auto auto
        :link-type: ref
        :link: examples-index
        
        Examples for common use-cases
        
        +++
        :ref:`Click to begin <examples-index>`

    .. grid-item-card:: ⚙ Dash Core
        :margin: 2 2 auto auto
        :link-type: ref
        :link: dashcore-arguments-and-commands
        
        Dash Core configuration and usage
        
        +++
        :ref:`Click to begin <dashcore-arguments-and-commands>`

    .. grid-item-card:: 📖 Glossary
        :margin: 2 2 auto auto
        :link-type: ref
        :link: resources-glossary
        
        Important terms with definitions
        
        +++
        :ref:`Click to begin <resources-glossary>`
        
.. raw:: html

    <div style="position: relative; padding-bottom: 56.25%; height: 0; margin-bottom: 1em; overflow: hidden; max-width: 70%; height: auto;">
        <iframe src="//www.youtube.com/embed/EDC1ioQ46m4" frameborder="0" allowfullscreen style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
    </div>
```

```{toctree}
:maxdepth: 2
:caption: Core Reference
:hidden:

reference/introduction
reference/block-chain
reference/transactions
reference/wallets
reference/p2p-network
reference/improvement-proposals
```

```{toctree}
:maxdepth: 2
:titlesonly:
:caption: Core API Reference
:hidden:

api/dash-core-apis-hash-byte-order
api/remote-procedure-calls
api/http-rest
api/zmq
```

```{toctree}
:maxdepth: 2
:caption: Core Guides
:titlesonly:
:hidden:

guide/introduction
guide/dash-features
guide/block-chain
guide/transactions
guide/contracts
guide/wallets
guide/operating-modes
guide/p2p-network
guide/mining
```

```{toctree}
:maxdepth: 2
:caption: Core Examples
:hidden:

examples/introduction
examples/configuration-file
examples/testing-applications
examples/transaction-tutorial
examples/p2p-network
examples/receiving-zmq-notifications
```

```{toctree}
:maxdepth: 2
:titlesonly: 
:caption: Dash Core Wallet
:hidden:

dashcore/wallet-arguments-and-commands
dashcore/wallet-configuration-file
```

```{toctree}
:maxdepth: 2
:titlesonly:
:caption: Additional Resources
:hidden:

resources/glossary
```
