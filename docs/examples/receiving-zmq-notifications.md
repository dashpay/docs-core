# Receiving ZMQ Notifications

## Overview

Receiving notifications from Dash Core is important for a variety of use-cases. Although polling [RPCs](../api/remote-procedure-calls.md) can be useful, in some scenarios it may be more desirable to have publish-subscribe functionality. Dash Core's built-in ZeroMQ (ZMQ) support provides the ability to subscribe to block, transaction, and governance related messages.

Further information regarding ZMQ support may be found in the [ZMQ API Reference](../api/zmq.md).

## Enabling Dash Core ZMQ Notifications

> 📘
>
> This requires a Dash Core full node or masternode

In the [`dash.conf` configuration file](../examples/configuration-file), add the following [ZMQ notifications](../api/zmq.md#available-notifications) and assign the address that Dash Core should listen on. The notifications selected here relate to InstantSend and ChainLocks.

```
# ZMQ
zmqpubhashchainlock=tcp://0.0.0.0:20009
zmqpubhashtx=tcp://0.0.0.0:20009
zmqpubhashtxlock=tcp://0.0.0.0:20009
zmqpubrawchainlock=tcp://0.0.0.0:20009
zmqpubrawtxlock=tcp://0.0.0.0:20009
```

Restart the Dash Core node once the configuration file has been updated.

## JavaScript Example

Requires an installation of [NodeJS](https://nodejs.org/en/download/)

### 1. Install ZeroMq

The JavaScript zeromq package is available from [npmjs.com](https://www.npmjs.com/package/zeromq) and can be installed from the command line by running:

```shell
npm install zeromq@5
```

> 🚧 ZeroMQ Version
>
> Version 5 of the zeromq package should be used for compatibility reasons.

### 2. Subscribe to ZeroMQ Messages

Create a file with the following contents. Then run it by typing `node <your-filename.js>` from the command line:
[block:code]
{
  "codes": [
    {
      "code": "const zmq = require('zeromq');\nconst sock = zmq.socket('sub');\nconst zmqPort = 20009;\n\nsock.connect('tcp://127.0.0.1:' + zmqPort);\n\n// Subscribe to transaction notifications\nsock.subscribe('hashtx'); // Note: this will subscribe to hashtxlock also\n\n// Subscribe to InstantSend/ChainLock notifications\nsock.subscribe('hashchainlock');\nsock.subscribe('hashtxlock');\nsock.subscribe('rawchainlock'); // Note: this will subscribe to rawchainlocksig also\nsock.subscribe('rawtxlock'); // Note: this will subscribe to rawtxlocksig also\n\nconsole.log('Subscriber connected to port %d', zmqPort);\n\nsock.on('message', function(topic, message) {\n  console.log(\n    'Received',\n    topic.toString().toUpperCase(),\n    'containing:\\n',\n    message.toString('hex'),\n    '\\n'\n  );\n});",
      "language": "javascript"
    },
    {
      "code": "import binascii\nimport asyncio\nimport zmq\nimport zmq.asyncio\nimport signal\n\nport = 20009\n\nclass ZMQHandler():\n    def __init__(self):\n        self.loop = asyncio.get_event_loop()\n        self.zmqContext = zmq.asyncio.Context()\n\n        self.zmqSubSocket = self.zmqContext.socket(zmq.SUB)\n        self.zmqSubSocket.connect(\"tcp://127.0.0.1:%i\" % port)\n\n        # Subscribe to transaction notifications\n        self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE, \"hashtx\")\n\n        # Subscribe to InstantSend/ChainLock notifications\n        self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE, \"hashtxlock\")\n        self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE, \"hashchainlock\")\n        self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE, \"rawchainlock\")\n        self.zmqSubSocket.setsockopt_string(zmq.SUBSCRIBE, \"rawtxlock\")\n\n        print('Subscriber connected to port {}'.format(port))\n\n    @asyncio.coroutine\n    def handle(self) :\n        msg = yield from self.zmqSubSocket.recv_multipart()\n        topic = msg[0]\n        body = msg[1]\n        sequence = \"Unknown\"\n\n        print('Received {} containing:\\n{}\\n'.format(\n            topic.decode(\"utf-8\"), \n            binascii.hexlify(body).decode(\"utf-8\")))\n\n        # schedule ourselves to receive the next message\n        asyncio.ensure_future(self.handle())\n\n    def start(self):\n        self.loop.add_signal_handler(signal.SIGINT, self.stop)\n        self.loop.create_task(self.handle())\n        self.loop.run_forever()\n\n    def stop(self):\n        self.loop.stop()\n        self.zmqContext.destroy()\n\ndaemon = ZMQHandler()\ndaemon.start()",
      "language": "python"
    }
  ]
}
[/block]

## Example Response

The following response demonstrates the notification provided by Dash Core when it receives a transaction and then receives the associated InstantSend lock. The four notifications represent:
  1. The TXID of the transaction is received (`HASHTX`) - at this point the transaction is not locked
  2. The TXID of a locked transaction is received (`HASHTXLOCK`). Since this is the same value as the `HASHTX` already received, we know that the transaction has now received an InstantSend lock.
  3. The raw transaction (`RAWTXLOCK`) (this could be decoded using the [`decoderawtransaction` RPC](../api/remote-procedure-calls-raw-transactions.md#decoderawtransaction) for example)
  4. A combination of the raw transaction and the InstantSend [lock signature](../reference/p2p-network-instantsend-messages.md#islock) (`RAWTXLOCKSIG`)

```
Received HASHTX containing:
 b2e128661e3679c3d00cd081e32fdc9a12f44e486e083e6eab998bdfd6f64a9b

Received HASHTXLOCK containing:
 b2e128661e3679c3d00cd081e32fdc9a12f44e486e083e6eab998bdfd6f64a9b

Received RAWTXLOCK containing:
 02000000025a4d18da609107e9ea3dc6 ... 5a32ea917a30147d6c9788ac6ea90400

Received RAWTXLOCKSIG containing:
 02000000025a4d18da609107e9ea3dc6 ... 9e889cee7ba48981ca002e6962a20236
```