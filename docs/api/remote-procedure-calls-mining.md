```{eval-rst}
.. meta::
  :title: Mining RPCs
  :description: A list of remote procedure calls for mining in Dash.
```

# Mining RPCs

## GetBlockTemplate

The [`getblocktemplate` RPC](../api/remote-procedure-calls-mining.md#getblocktemplate) gets a block template or proposal for use with mining software. For more
information, please see the following resources:

* [Bitcoin Wiki GetBlockTemplate](https://en.bitcoin.it/wiki/Getblocktemplate)
* [BIP22](https://github.com/bitcoin/bips/blob/master/bip-0022.mediawiki)
* [BIP23](https://github.com/bitcoin/bips/blob/master/bip-0023.mediawiki)

*Parameter #1---a JSON request object*

Name | Type | Presence | Description
--- | --- | --- | ---
Request | object | Optional<br>(exactly 1) | A JSON request object
→<br>`mode` | string | Optional<br>(exactly 1) | This must be set to \template\" or omitted"
→<br>`capabilities` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Capability | string | Optional<br>(exactly 1) | Client side supported feature, `longpoll`, `coinbasetxn`, `coinbasevalue`, `proposal`, `serverlist`, `workid`
→<br>`rules` | array (string) | Optional<br>(0 or more) | A list of strings
→ →<br>Rules | string | Optional<br>(exactly 1) | Client side supported softfork deployment, `csv`, `dip0001`, etc.

*Result---block template*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | A object containing a block template
→<br>`capabilities` | array (string) | Required<br>(1 or more) | The client side supported features
→ →<br>Capability | string | Optional<br>(0 or more) | A client side supported feature
→<br>`version` | number (int) | Required<br>(exactly 1) | The block version
→<br>`rules` | array (string) | Required<br>(1 or more) | The specific block rules that are to be enforced
→ →<br>Block Rule | string | Optional<br>(0 or more) | A specific block rule to be enforced
→<br>`vbavailable` | object | Required<br>(exactly 1) | Contains the set of pending, supported versionbit (BIP 9) softfork deployments
→ →<br>Bit Number | number | Required<br>(0 or more) | The bit number the named softfork rule
→<br>`vbrequired` | number | Required<br>(exactly 1) | The bit mask of versionbits the server requires set in submissions
→<br>`previousblockhash` | string (hex) | Required<br>(exactly 1) | The hash of current highest block
→<br>`transactions` | array (objects) | Optional<br>(0 or more) | Non-coinbase transactions to be included in the next block
→ →<br>Transaction | object | Optional<br>(0 or more) | Non-coinbase transaction
→ → →<br>`data` | string (hex) | Optional<br>(0 or more) | Transaction data encoded in hex (byte-for-byte)
→ → →<br>`hash` | string (hex) | Optional<br>(0 or more) | The hash/id encoded in little-endian hex
→ → →<br>`depends` | array (numbers) | Required<br>(0 or more) | An array holding TXIDs of unconfirmed transactions this TX depends upon (parent transactions).
→ → → →<br>Transaction number | number | Optional<br>(1 or more) | Transactions before this one (by 1-based index in `transactions` list) that must be present in the final block if this one is
→ → →<br>`fee` | number | Required<br>(exactly 1) | The difference in value between transaction inputs and outputs (in duffs). For coinbase transactions, this is a negative number of the total collected block fees (ie., not including the block subsidy); if key is not present, fee is unknown and clients MUST NOT assume there isn't one
→ → →<br>`sigops` | number | Required<br>(exactly 1) | Total SigOps. If not present, the count is unknown (clients MUST NOT assume there aren't any)
→<br>`coinbaseaux` | object | Required<br>(exactly 1) | A object containing data that should be included in the coinbase scriptSig content
→ →<br>~~Flags~~ | ~~string~~ | ~~Required<br>(0 or more)~~ | **Removed in Dash Core 18.0.0**
→<br>`coinbasevalue` | number | Required<br>(exactly 1) | The maximum allowable input to coinbase transaction, including the generation award and transaction fees (in duffs)
→<br>`coinbasetxn` | object | Required<br>(exactly 1) | Information for the coinbase transaction)
→<br>`target` | string | Required<br>(exactly 1) | The hash target
→<br>`mintime` | number | Required<br>(exactly 1) | The minimum timestamp appropriate for next block time in seconds since epoch
→<br>`mutable` | array (string) | Required<br>(exactly 1) | The list of ways the block template may be changed
→ →<br>Value | string | Required<br>(0 or more) | A way the block template may be changed, e.g. 'time', 'transactions', 'prevblock'
→<br>`noncerange` | string | Required<br>(exactly 1) | A range of valid nonces
→<br>`sigoplimit` | number | Required<br>(exactly 1) | The limit of sigops in blocks
→<br>`sizelimit` | number | Required<br>(exactly 1) | The limit of block size
→<br>`curtime` | number | Required<br>(exactly 1) | The current timestamp in seconds since epoch
→<br>`bits` | string | Required<br>(exactly 1) | The compressed target of next block
→<br>`previousbits` | string | Required<br>(exactly 1) | The compressed target of  the current highest block
→<br>`height` | number | Required<br>(exactly 1) | The height of the next block
→<br>`masternode` | array (objects) | Required<br>(0 or more) | Required masternode payments that must be included in the next block
→ →<br>Masternode Payee | object | Optional<br>(0 or more) | Object containing a masternode payee's information  
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`masternode_payments_started` | boolean | Required<br>(exactly 1) | True if masternode payments started
→<br>`masternode_payments_enforced` | boolean | Required<br>(exactly 1) | True if masternode payments enforced
→<br>`superblock` | array (objects) | Required<br>(0 or more) | The superblock payees that must be included in the next block
→ →<br>Superblock Payee | object | Optional<br>(0 or more) | Object containing a superblock payee's information
→ → →<br>`payee` | string | Required<br>(exactly 1) | Payee address
→ → →<br>`script` | string | Required<br>(exactly 1) | Payee scriptPubKey
→ → →<br>`amount` | number | Required<br>(exactly 1) | Required amount to pay
→<br>`superblocks_started` | boolean | Required<br>(exactly 1) | True if superblock payments started
→<br>`superblocks_enabled` | boolean | Required<br>(exactly 1) | True if superblock payments enabled
→<br>`coinbase_payload` | string | Required<br>(exactly 1) | *Added in Dash Core 0.13.0*<br><br>Coinbase transaction payload data encoded in hexadecimal

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet getblocktemplate
```

Result:

```json
{
  "capabilities": [
    "proposal"
  ],
  "version": 536870912,
  "rules": [
  ],
  "vbavailable": {
  },
  "vbrequired": 0,
  "previousblockhash": "0000000000000011a89f9ccfcea365a1092433cb6a6239eb61290b00846a46c9",
  "transactions": [
    {
      "data": "03000600000000000000fd5501010001291d00030004276337403e4ad51f2a0f36d4e15fff9be4e96bf4ebd8c5990100000000000000640000000000000000000000000064000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      "hash": "760b8ff8b087a7f72fb18afb1548301a553695e4ae36cacacf822d30b15e1b0d",
      "depends": [
      ],
      "fee": 0,
      "sigops": 0
    },
    {
      "data": "0200000006a0dcfd073981cbf62efaed59fbabf82d12036e001a89e582c3aebb497af38616080000006a47304402205ff9ed9e3cfaaf0f1564e9a8a6e1e4d84bf50ee6057918bb7afbc762b5f33ae002200f1dcd15229d34d4474264ab093495a3bc53a7c0630b9088805a06141f04aeb0812102c8e2bf9e8d3f1ac82868b3cc0299d781055ae1edf1f1eb5cb232c9c0e8496688ffffffff77ac7d452fd623c62ee73a0c1830f3a6d2f70aaacbb03bd6f11bbac28a30431b040000006a473044022011a3df7a3fb604e7c8fde36f9db9e6d8f3280f04a6d8e50a0993d471897d099902201d64ed270f9c3663a60036ec0013a9161766e1bc48c9c56e185bca2e6b12f6448121037a9cb28abe6440e769ce66e99ec47df3fb4021213c4e603bbe15afd42ba99f36ffffffffd2d335f5e97e5dca60e4a6f02acf90db8cd4ebf9a2013fa1468ab60faf3bba8f030000006a473044022023d733e07169ad41864fbbc784b4ffae3fd89efeba4379c94c6603561d981f4a0220123527797f93ba8202220ce85d4f8af08c03277c5f0c71e4d50ec026ab020de08121036a601db35f6db4365fa5b48e6405faa2dfecb9864627dc6e95bfd10ede191423ffffffffee5d35c8d19567ce745bec74ffb8de912357e8f2015f1c4e6923e12a4a536ba3050000006a473044022035ab63a9124ae849142efacfea9a65ff5a20ec61555a296724316cb9caf6227202204a8295dfd59350869a7e400f284aed4b91b828f2914dd08f8cfa7f5ad6db24678121035d727ca79870cd1cb9b1d9200eac817a2e2cae5a5a083970574e6498aaf6a72affffffff45851e15fb32d6b10003f476e67e07f77240da62f30341a32aa55ced006b57cd220000006a4730440220182dc80e9ea8fa444b89414c4dd48f73bf49b0501095505e9dc6c537561dba4702204771a850db69f1eb5734f0b8ca5212a11c52f2b3d81aad609497e245ce21a7468121031b9fe1bde9757c8c10b982561ca217eb508423d1cb79024fc87a3465e85a59d8ffffffff41d69767d4888efc4a67b7785d1fc3f1cca8b10fd8c176481cd5b0a5e7b133ed050000006a47304402205d9b3869944149704685416bbd9096f41b67b657707c826a4f3726e55f9fba11022049ce293218f33ffc539aab83f70ae464a9286c025e83411ebef3aa851379890f812103d6155454d671f8feff0e7a9be0f9c73bb915d225a1e38f5c3e0f9b16b4f9aaeeffffffff064a420f00000000001976a9140822b81f8412ffa12a5eda72f10073cbf9f49a4988ac4a420f00000000001976a9148d590813924fcbfd166c435acbf4436cb70a511688ac4a420f00000000001976a914a68b20f7d4d716df9111160c2163d8902f6173ec88ac4a420f00000000001976a914b7f6ae79408e773aa8f050e7a83d758c5d59c7ff88ac4a420f00000000001976a914bb8a369b77f4cd0b7b8f936bab732504eca1b93d88ac4a420f00000000001976a914eae6d5cbb11097027dfc25d2c01923d472e4a6bd88ac00000000",
      "hash": "76dee2aec42eaef4638acd8b0adf124d59445e40bf76101ff6345e6aa83a6359",
      "depends": [
      ],
      "fee": 0,
      "sigops": 6
    },
    {
      "data": "020000000916bb5cfb59ec5cbfab9e8bbcf0d12ba4d0b16b2247141b4ee98ef9757e3b4809010000006a47304402207716d0e7299ac21caa31e32fed620dd9d54930c3880acca0fbe69d41de0cdc810220074439d3e33f591668ce76c8ce5910ee689ee3cfe3712bc58c2d7d7e5026ff7c8121022ca9a58223472bf4784118cad67678d1004886ea9664425399f141b9c40eef5cffffffffd6187fefca1f381d4c57c3203c241d19cb33aedbca5d70d527bc23304627481f030000006a47304402203f504f514e8bb0dcf9a5de1cd76f140a78ef561407bfc208534d883ce9d38960022054e6d1ea684d0a7fc69e94ed7a4a07dca9820e018a1ee67f734d0d5f75550d68812102629b9099037bfa7a5c883cc2b9f654c3031255b75d019bcf46b5942d841ddc2affffffff9ca7abf0eaefc066e8c1eac3c4b1cf033692982334a01f53e8b7c522d3fd5f32040000006a4730440220260253b0419fd074281a8837895e1e398d791987978a3db17d2382588f24530a02205014ac4e0e4f38dba75784b1445ceb89e14fbe363a67209fc130c885bf5519aa812102ff054fd94fcb8915dc4d08ef28b888f904121e488ba62fbdb49ab3f44f9ad5e9ffffffff26489273a995ed8e1cb7a273c4202a360c7a8e6de954e4bd24ec6beebf080c4d0e0000006a4730440220622e0517c2dbb0ef063b8d7f633d0b9b824193a75ec209cfa73d27b843d0578b0220273c5cdaecf97c328d404228a945b22152fa94caa347aaa8aae60e7e9856443e812102b50ddea29945245260266165e76e21047e461a2209e112331e410637acd06248ffffffffd14b1e18c93b62aa803716228203ab10c71c683161b54424f7f1513e280f7e55060000006a47304402203e25b5747876b4b6f74fc7a988cfc0a34dacfeb11b36add750fd41cf32343b46022056a0fd2d2a6d68282d0507c298b0bb8ff1271aa1bca5dc421991583c7bcb97ae8121027839666e29e706dd65e8ef638582f68d0323a3fb860c4986f4b4b7f06ed5f16fffffffffa378d99a56ac949b109300c13220b1da9f80d73ab319e2d1f0c6dd5d9e029d660d0000006a47304402205d299d556d1a346143ef21217acc936030955359a585fcce72ecf1b753d1205502201b23ec71db97d567a1c9fa044e723fb726a5cc374a977c65dd1204806a437f6081210329cda0db5f4dc87b82741399296b062cefac9536ebef39be06a56b31b7ac1e8affffffff222ef4c86db26408954513cdb1582f9a0cd1395ef97e259bf3ece67fc8c7cc6b090000006a473044022020b4a87de1b2f989ec97355a1926d2af38219a510fcddfbd3c0e4905c3d0ceba02201a0eac1b3f39854981bc161354915a7ce45bbe0efa766ada988ce8f67d41a89481210376b833bbd4039823892dd78c3b3db67fa2512d79a1fee9c035a971d7366466c5ffffffffd2d335f5e97e5dca60e4a6f02acf90db8cd4ebf9a2013fa1468ab60faf3bba8f080000006a47304402200639a12511f4ad14112b9d5d0ddca562069f3da636e13fa1ef28722a4011a32302202d20e72b826165f2ad1e298360c5af3d8d85c25fc6c902909710780e9759088081210375b1a665856d17ec3307cc0db12bde78b6e24b4d351c86a1f0669341283bd8d3ffffffffcb24313565e8f18bada6a0dba54aafbd044662d1937c26796bddea38d9d22092040000006a47304402207b6378834479adeae673a90e7f5c8c40e722e883f965334f2a5cb27ab9d2f4e5022064e9d16b2df2869c4b9eafe3e5d8572936eddf1a1fd615cf5c604ef805ceba4d812102416ce3ebbc80667e788716717093be1ac57680a3dbba903084f6061137fd0843ffffffff094a420f00000000001976a9143638868c56b1a46825fb85b915159fddade7dc4088ac4a420f00000000001976a91437ba35c3e6d27a10ee70efb247e32e72d32d5a9688ac4a420f00000000001976a91455e07221650b105d7d5d210267d50c1ac1ead1f788ac4a420f00000000001976a9147a4f1f43a2ebf679dd8e970450d00315dc420a7088ac4a420f00000000001976a91487f53c05ab8aa565129ff13fae25969d46b91a6b88ac4a420f00000000001976a9148e9aa11172edab79f5d32e325ac4c6f875af3dc388ac4a420f00000000001976a91498bd1f199ffb6789cf86544e5bb4c50d2ad9318b88ac4a420f00000000001976a914d047551bed0b4e35f5f4567da98f935d18b43d9588ac4a420f00000000001976a914e75b0093ebd1b4fe6b3623a541a98e00bcd864d288ac00000000",
      "hash": "b1f52458d03456585a7d14f5b073cf616a7ea74c0cd086c729aa7fd44c8a223b",
      "depends": [
      ],
      "fee": 0,
      "sigops": 9
    },
    {
      "data": "0200000001af004e7986660b5bc0d1bb75e2e33fd87bb4f70ec1a7b7d3907e7cf4e8bcee64010000006a47304402205617399cf0746d03fea0bf370df66734d680d34a14c71d7432cceb1644d5e4ce022034842bf929b5e7b7b734ebb840930fc5353bf1d4a61b13fe3d08596c58de52ee01210362684f04eefb7e7e623f141f736d1b929e611e42d178d011b98d6f1779594149ffffffff0130750000000000001976a914fe5558a8b4a3daf57cec7bfe8ab55596631decac88ac00000000",
      "hash": "c7896c27e3e6daa808080fb65ab011640c27c927b26529b5635ed6eafa2f4281",
      "depends": [
      ],
      "fee": 10000,
      "sigops": 1
    },
    {
      "data": "02000000012a1fe3220f9be53f95fbd849a04e7d0ebaa7383c9db6a566590410574d3585d6000000006a473044022034ff2331da47bff0ab8acb4806ff444899d62607aacbb136f3aefd0a20cdc84c02204d1349d5d7e495e3906afbad81c5a5e29ba07e0f9731a4867be565157705735a0121026d899b2727eda23a022117ed51a7be6fb621907c7a10c570755085800ce638fdffffffff0130750000000000001976a914532c6eb95e4f433d5b43783bc323b9e1057fd96c88ac00000000",
      "hash": "8a65509428e89f200bb0b78dc81272e24b4245fc37f4d15e34be0bb8196ec988",
      "depends": [
      ],
      "fee": 10000,
      "sigops": 1
    },
    {
      "data": "0100000001752c212cfbbe090beb1e713c37c3fa68c13c896df452ef0ba8fa1c7fd71f910d000000006b483045022100e6645f744d8bf739fdb26c0715da531dd81400445bc885714943b790687b33620220203b6d056b4db4a15f373e9b9d5b6b5b57a0015e186b8305065eb1e609ca1a3c012102c5f6049e06acb09c8304d581159c8d29debad7b8d6b0099e221d443f285706cdffffffff02c01549db000000001976a914a924e3205eb71352c5995782778955d1ac452d0388ac0325f1fb000000001976a914721ff9488c13db5d21064fceff3d37fe0357ce6f88ac00000000",
      "hash": "6e1a6a898d9e8e398677c8a662d248796f517149a573d63a1fa03f7cf1b4ada6",
      "depends": [
      ],
      "fee": 2260,
      "sigops": 2
    },
    {
      "data": "030000000172cb6a976b40e842ce7fde67a56ca353c745fef4e59787ef5bff8c37f1c1e04c010000006a47304402202ea2164e60d57ccb75b0f442a8185116c6f0581eccbdd89d7ce4d8bdda4b12ef02201b68056ac0b4ffd110c73073d54a035c2545eccd501c9a9462ed3150e17f5996012103caf1101854534414740cd292aa85cdb81902fce120305a82217b1fa2aa2c8c0bffffffff02b8415604000000001976a9141cfa13bb5f2e334ba352726079b23182fa616a3588aca02e464d000000001976a9148b8303ea993c4a065e183e825aac39bf65648ca688ac00000000",
      "hash": "e4e8393e06545d6173e464f88c9c1b397d75f2e85d6a23cdfc8bb9ea2527f215",
      "depends": [
      ],
      "fee": 600,
      "sigops": 2
    },
    {
      "data": "0300000001971c4f2563c2a555d656d143552c5126dac1e73a3db6ff1227f75b94d2d73803010000006a47304402202f4e3bca5b8d9639d762c394822a569467a796d172eaf0b185676cfdfb4a8744022012aeb58db9acd3afdf538b50cb9ad4f6addcc836b109d84b6fe0e01bb0d3c34a0121025c28378965ebc7fe76628aa052e095c0350c2500e5c55dfd048f264c15e74b23ffffffff02ffa7ec04000000001976a9145940241ad05ba6d2938395cedaff49d017d2e03c88aced470fc2000000001976a914af697a50f667e569089de03a1b3dc407ce99e76088ac00000000",
      "hash": "bfc82821136ed9f18254ffa97aca582467b839aa03d9a56eaab922381d4fc3ef",
      "depends": [
      ],
      "fee": 600,
      "sigops": 2
    },
    {
      "data": "01000000015c9f992da7166e81094a71accba4047e1cc8074cb8a0c43c10eb7d6c881710ae010000006a47304402200ad851377a2997c9f3ea905ffc2e5cda1dbd021e571226dc7456a5cc27ee0d290220103d0ea7634130cbbfd48ee19d277dcde0da5717b03ad06e615e82d512802b8e012102b681df8a892e3137f30752b3a8dda10a32ba9ee23bbd45f90ef26852d45e3e1cffffffff026b3feb04000000001976a914dddbedb289f191c3ae1d5c6365216e2432628f8b88ac13d70b56000000001976a91492cf59cf380cf05c001f2fce72fafd63ba68ccc888ac00000000",
      "hash": "442e24f2292081191ad224bce6fea931995765176dcf98ea6e96f4d0844c5735",
      "depends": [
      ],
      "fee": 227,
      "sigops": 2
    },
    {
      "data": "01000000029d7632e789a718f7b202b90d926536d28f4355ca3191b5eb5c0ecf9f8b08534b010000006b483045022100f2e97d658d5666a0befa063f42b17df2ce1af3c16e99fad672f0b490edad44e802201c766be946b5e9c1500062e42ca8205e0b99389a8b282588c3c67068ae444669012102b5041c0f5b569b4a3c6332a76780dcdd47ed624ad737bd6f1c4026b708360bc4ffffffff74bff4a2e7290f207d51540c7691d0c54a6d649328b8f7397624855dd3054279000000006a4730440220142fae4202693dadad4473ec9756f6b414575163d76a98f6f676bf6fe89bf9cb02201fdd7210a1823b08c86c7b5eff982e66d3023e495ce00710ad710d9c7c1fa74c0121021c936027f393da838bd28507ad99a28919be56e4e859e1bf4b0d217ce70315f8ffffffff02d55d0000000000001976a9143d211b732679f93f9b78208244c3e6151ac6044a88acc05f3b04000000001976a914bdfa9a55d2834e6d00e22772f24e7e7a6376c5c288ac00000000",
      "hash": "b8520345f1d34c27fc7ab3aff1e8fd046d15746e79712273cf306aa825b8ed2d",
      "depends": [
      ],
      "fee": 376,
      "sigops": 2
    },
    {
      "data": "0300000001c1db57dd7e4ce0fc2f569cf321ef908504b1ff9d2d144dc09b636e498f07af3d010000006a4730440220356075453cb51799f18e7f1fdd9525a56ad2629e400e82400f13da715dde85a7022033446d81145029e2327fdd342d906aa9fe7541d5ad7be5b6f578be1bc4a9f8c301210230037c28c1ab5950ddcd25c267eeb44b97617d64f2e5981c3a6aa2d51e75c984ffffffff0211070000000000001976a91401a9de382f888a3e42c0df45b9a598e10fb7cef988ace03b6600000000001976a9143f0281d2f23d61051967c96a7a2414a330132c0b88ac00000000",
      "hash": "370df36197d968ce37d1b76875293401b287987da771e768ceaf368a9ca53067",
      "depends": [
      ],
      "fee": 226,
      "sigops": 2
    },
    {
      "data": "0100000001a91b1353e6feb81c24f87a0a5ff6d080c8cde465ad38cf8b5564854c89d3c66d010000006b483045022100e38ea06b811f2ccea5dff2ed516a041ad1930222efaf7b1d0de4cb3755d5cfbd0220058c4edd2cdcd8f85c2f3d3d35f1af3af584ba6e4a3c947538a54ad14c3f899901210251b58486e6e73809d4d1573d9b0f5a9f761be8c328a683b7c90ac1a71221c16effffffff02dc8cad05000000001976a9144c81fc698c643a16b538ed8c6352f5ae0a4f46b188acc319870b000000001976a91403fdb063a78cc229f62e78aaa9401f6e231e80ac88ac00000000",
      "hash": "24826b19d9ac63651c35eb0a979184d7bda79bfc6e16f74f5bf02e80a2d76853",
      "depends": [
      ],
      "fee": 226,
      "sigops": 2
    },
    {
      "data": "0100000001c2d96880011ab36545d900c8002d241affe932ae79f58ca56b7a8a2b48a1de6e010000006b483045022100c4711e8c92ada1fd445ff7fcef8f4b5a9b2fc206c8d5c212db3453aa9bec5a3d0220381246dbd4c24baeb78316fe30463303a150ef36ae009f647865e433f18b71c70121035753529eebe5bcd9bdd913aff804040a2777c8204b2fd7884103ec01312ecae1ffffffff0269624705000000001976a914dcc118b250156046b40ad33d2b1eefdff0f0002088ac7f5c740a000000001976a9147741896f6df349eb5bd8feea989379461456912b88ac00000000",
      "hash": "47b3e17ddc4fcd71d61381bb416289ba12180f3fda561b943f5e7a0273ab655e",
      "depends": [
      ],
      "fee": 226,
      "sigops": 2
    },
    {
      "data": "010000000199a768637adf72a9e36b52000dcda58b19c06c69e304f55bc2dbe1aee723571d010000006b483045022100b0f64c13f77420a403b1fed55560386767956fdab0fe842d058e83bd16afe9ad022038d7abfff54af633ba7f7229ed52db3ef71c96cfa506f5f2f4080c4d0a37783d012103ea5b8db279b556b64375d0702cf0f8ca5013df5fe16d0926dc1a01984771ad59ffffffff023101680a000000001976a914a88fab972a85a3a880d7fe974ff7ed2e380d517f88acf2b9891c000000001976a914a411f698b040b6664381bd08a268861cfb82324c88ac00000000",
      "hash": "ec51a9afa532fabd37b7e6aef722f0ece06e7cdf791eb13b9290a6b349a074b1",
      "depends": [
      ],
      "fee": 226,
      "sigops": 2
    }
  ],
  "coinbaseaux": {
  },
  "coinbasevalue": 230992199,
  "longpollid": "0000000000000011a89f9ccfcea365a1092433cb6a6239eb61290b00846a46c9281",
  "target": "00000000000000260eba00000000000000000000000000000000000000000000",
  "mintime": 1690485065,
  "mutable": [
    "time",
    "transactions",
    "prevblock"
  ],
  "noncerange": "00000000ffffffff",
  "sigoplimit": 40000,
  "sizelimit": 2000000,
  "curtime": 1690485861,
  "bits": "19260eba",
  "previousbits": "19278cc3",
  "height": 1911041,
  "masternode": [
    {
      "payee": "Xf1yruVSvW6arszkDrbN95c6hSxfhCAwtU",
      "script": "76a9142f7f1bb68cd5428fc585a79f7f2ad29b0de52efd88ac",
      "amount": 133282498
    }
  ],
  "masternode_payments_started": true,
  "masternode_payments_enforced": true,
  "superblock": [
  ],
  "superblocks_started": true,
  "superblocks_enabled": true,
  "coinbase_payload": "020001291d001a38d44b71c3fc1908e5bedfd7ba3a27eeea185ffc80590b3f518c6e654665a8d9cf5349a986f68f23ce3979a4d98ad057b91a7fa82ea429aa3198512a7ce85d"
}
```

*See also*

* [GetMiningInfo](../api/remote-procedure-calls-mining.md#getmininginfo): returns various mining-related information.
* [SubmitBlock](../api/remote-procedure-calls-mining.md#submitblock): accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.
* [PrioritiseTransaction](../api/remote-procedure-calls-mining.md#prioritisetransaction): adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

## GetMiningInfo

The [`getmininginfo` RPC](../api/remote-procedure-calls-mining.md#getmininginfo) returns various mining-related information.

*Parameters: none*

*Result---various mining-related information*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | object | Required<br>(exactly 1) | Various mining-related information
→<br>`blocks` | number (int) | Required<br>(exactly 1) | The height of the highest block on the local best block chain
→<br>`currentblocksize` | number (int) | Optional<br>(0 or 1) | If generation was enabled since the last time this node was restarted, this is the size in bytes of the last block built by this node for header hash checking.
→<br>`currentblocktx` | number (int) | Optional<br>(0 or 1) | If generation was enabled since the last time this node was restarted, this is the number of transactions in the last block built by this node for header hash checking.
→<br>`difficulty` | number (real) | Required<br>(exactly 1) | If generation was enabled since the last time this node was restarted, this is the difficulty of the highest-height block in the local best block chain.  Otherwise, this is the value `0`
→<br>`networkhashps` | number (int) | Required<br>(exactly 1) | An estimate of the number of hashes per second the network is generating to maintain the current difficulty.  See the [`getnetworkhashps` RPC](../api/remote-procedure-calls-mining.md#getnetworkhashps) for configurable access to this data
→<br>`pooledtx` | number (int) | Required<br>(exactly 1) | The number of transactions in the memory pool
→<br>`chain` | string | Required<br>(exactly 1) | Set to `main` for mainnet, `test` for testnet, and `regtest` for regtest
→<br>`warnings` | string | Required<br>(exactly 1) | *Added in Dash Core 0.16.0*<br><br>Any network or blockchain warnings
→<br>`errors` | string | Optional<br>(0 or 1) | **Removed in Dash Core 0.17.0**<br><br>Only shown when dashd is started with `-deprecatedrpc=getmininginfo`

*Example from Dash Core 18.0.0*

```bash
dash-cli getmininginfo
```

Result:

```json
{
  "blocks": 292979,
  "difficulty": 0.0002441371325370145,
  "networkhashps": 3805.856874962192,
  "pooledtx": 0,
  "chain": "test",
  "warnings": "Warning: unknown new rules activated (versionbit 3)"
}
```

*See also*

* [GetMemPoolInfo](../api/remote-procedure-calls-blockchain.md#getmempoolinfo): returns information about the node's current transaction memory pool.
* [GetRawMemPool](../api/remote-procedure-calls-blockchain.md#getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](../api/remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## GetNetworkHashPS

The [`getnetworkhashps` RPC](../api/remote-procedure-calls-mining.md#getnetworkhashps) returns the estimated network hashes per second based on the last n blocks.

*Parameter #1---number of blocks to average*

Name | Type | Presence | Description
--- | --- | --- | ---
`blocks` | number (int) | Optional<br>(0 or 1) | The number of blocks to average together for calculating the estimated hashes per second.  Default is `120`.  Use `-1` to average all blocks produced since the last difficulty change

*Parameter #2---block height*

Name | Type | Presence | Description
--- | --- | --- | ---
`height` | number (int) | Optional<br>(0 or 1) | The height of the last block to use for calculating the average.  Defaults to `-1` for the highest-height block on the local best block chain.  If the specified height is higher than the highest block on the local best block chain, it will be interpreted the same as `-1`

*Result---estimated hashes per second*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | number (int) | Required<br>(exactly 1) | The estimated number of hashes per second based on the parameters provided.  May be 0 (for Height=`0`, the genesis block) or a negative value if the highest-height block averaged has a block header time earlier than the lowest-height block averaged

*Example from Dash Core 0.12.2*

Get the average hashes per second for all the blocks since the last
difficulty change before block 6000.

```bash
dash-cli -testnet getnetworkhashps -1 6000
```

Result:

```text
22214011.90821117
```

*See also*

* [GetDifficulty](../api/remote-procedure-calls-blockchain.md#getdifficulty): returns the proof-of-work difficulty as a multiple of the minimum difficulty.
* [GetBlock](../api/remote-procedure-calls-blockchain.md#getblock): gets a block with a particular header hash from the local block database either as a JSON object or as a serialized block.

## PrioritiseTransaction

The [`prioritisetransaction` RPC](../api/remote-procedure-calls-mining.md#prioritisetransaction) adds virtual priority or fee to a transaction, allowing it to be accepted into blocks mined by this node (or miners which use this node) with a lower priority or fee. (It can also remove virtual priority or fee, requiring the transaction have a higher priority or fee to be accepted into a locally-mined block.)

*Parameter #1---the TXID of the transaction to modify*

Name | Type | Presence | Description
--- | --- | --- | ---
TXID | string | Required<br>(exactly 1) | The TXID of the transaction whose virtual priority or fee you want to modify, encoded as hex in RPC byte order

*Parameter #2---the change to make to the virtual fee*

Name | Type | Presence | Description
--- | --- | --- | ---
Fee | number (int) | Required<br>(exactly 1) | **Warning:** this value is in duffs, not Dash<br><br>If positive, the virtual fee to add to the actual fee paid by the transaction; if negative, the virtual fee to subtract from the actual fee paid by the transaction.  No change is made to the actual fee paid by the transaction

*Result---`true` if the priority is changed*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | bool (true only) | Required<br>(exactly 1) | Always set to `true` if all three parameters are provided.  Will not return an error if the TXID is not in the memory pool.  If fewer or more than three arguments are provided, or if something goes wrong, will be set to `null`

*Example from Dash Core 0.14.0*

```bash
dash-cli -testnet prioritisetransaction \
    f86c74f27fdd9c7e618d69b3606eeae1710b3f02fabede6ae8c88dd7bb756942 \
    456789
```

Result:

```json
true
```

*See also*

* [GetRawMemPool](../api/remote-procedure-calls-blockchain.md#getrawmempool): returns all transaction identifiers (TXIDs) in the memory pool as a JSON array, or detailed information about each transaction in the memory pool as a JSON object.
* [GetBlockTemplate](../api/remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## SubmitBlock

The [`submitblock` RPC](../api/remote-procedure-calls-mining.md#submitblock) accepts a block, verifies it is a valid addition to the block chain, and broadcasts it to the network. Extra parameters are ignored by Dash Core but may be used by mining pools or other programs.

*Parameter #1---the new block in serialized block format as hex*

Name | Type | Presence | Description
--- | --- | --- | ---
Block | string (hex) | Required<br>(exactly 1) | The full block to submit in serialized block format as hex

*Parameter #2---dummy value*

Name | Type | Presence | Description
--- | --- | --- | ---
`dummy` | object | Optional<br>(0 or 1) | A dummy value for compatibility with BIP22. This value is ignored.

*Result---`null` or error string*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | null/string | Required<br>(exactly 1) | If the block submission succeeded, set to JSON `null`.  If submission failed, set to one of the following strings: `duplicate`, `duplicate-invalid`, `inconclusive`, or `rejected`.  The JSON-RPC `error` field will still be set to `null` if submission failed for one of these reasons

*Example from Dash Core 0.15.0*

Submit the following block with the a dummy value, "test".

```bash
dash-cli -testnet submitblock 0100002032e3965d5fdd7a883209d516599337eb4cb82f\
  7aea22ecc114942c1f00000000244388a3bd2c38a85bf337755a1a165d0df2b335e3886058\
  40e08a3cdf1ce1a4297ede598f6a011d027c1c300201000000010000000000000000000000\
  000000000000000000000000000000000000000000ffffffff1202791f0e2f5032506f6f6c\
  2d74444153482fffffffff044d75bb8b010000001976a914d4a5ea2641e9dd37f7a5ad5c92\
  9df4743518769188acac2ea68f010000001976a9148d0934de58f969df3b53a72b4f47211d\
  890ebf5588ac68b9ea03000000004341047559d13c3f81b1fadbd8dd03e4b5a1c73b05e2b9\
  80e00d467aa9440b29c7de23664dde6428d75cafed22ae4f0d302e26c5c5a5dd4d3e1b796d\
  7281bdc9430f35ac00000000000000002a6a28f47e935509fc85533dc78197e93e87d1c793\
  43bda495429d8e3680069f6a22780000000002000000000000000100000001078e0c77e3b0\
  4323d0834841f965543aaae2b275f684f55fbaf22e1c83bff97e010000006a473044022077\
  6e96d202cc4f50f79d269d7cd36712c7486282dda0cb6eae583c916c98b34c022070941efb\
  3201cf500cc6b879d6570fc477d4c3e6a8d91286e84465235f542c42012102dddbfc3fe06b\
  96e3a36f3e815222cd1cb9586b3193c4a0de030477f621956d51feffffff02a00bd1000000\
  00001976a914d7b47d4b40a23c389f5a17754d7f60f511c7d0ec88ac316168821300000019\
  76a914c9190e507834b78a624d7578f1ad3819592ca1aa88ac771f0000 \
  "test"
```

Result (the block above was already on a local block chain):

```text
duplicate
```

*See also*

* [GetBlockTemplate](../api/remote-procedure-calls-mining.md#getblocktemplate): gets a block template or proposal for use with mining software.

## SubmitHeader

The [`submitheader` RPC](../api/remote-procedure-calls-mining.md#submitheader) decodes the given hexdata as a header and submits it as a candidate chain tip if valid.
If invalid, it  throws.

*Parameter #1---hexdata*

Name | Type | Presence | Description
--- | --- | --- | ---
hexdata | string (hex) | Required<br>(exactly 1) | The block header data

*Result---`None`*

Name | Type | Presence | Description
--- | --- | --- | ---
`result` | None | Not Required<br> | N/A

*Example from Dash Core 18.0.0*

```bash
dash-cli -testnet submitheader 0000002037f7981be497c71524bb9f7454d80b1448f46b6f99c3cadfee4367f0c201000007a95ed6e4d19efa99f33c93b45ee2eab5b5a0ef230ac9c03ecc8a3b5ef8938f5b1978614745021ed6cb0000
```

Result:

```text
null
```

*See also: none*
