import { config } from '@onflow/fcl'
import { env } from 'std-env'
import flowJSON from '../../flow.json'

export const network: 'mainnet' | 'testnet' | 'emulator' = (env.PUBLIC_FLOW_NETWORK as
  | 'mainnet'
  | 'testnet'
  | 'emulator') || 'testnet'

const fclConfigInfo = {
  emulator: {
    accessNode: 'http://127.0.0.1:8888',
    discoveryWallet: 'http://localhost:8701/fcl/authn',
    discoveryAuthInclude: [],
  },
  testnet: {
    accessNode: 'https://rest-testnet.onflow.org',
    discoveryWallet: 'https://fcl-discovery.onflow.org/testnet/authn',
    discoveryAuthInclude: [],
  },
  mainnet: {
    accessNode: 'https://rest-mainnet.onflow.org',
    discoveryWallet: 'https://fcl-discovery.onflow.org/authn',
    discoveryAuthInclude: [],
  },
}

config({
  'app.detail.title': 'Detimu',
  'app.detail.icon': 'https://em-content.zobj.net/source/whatsapp/352/ticket_1f3ab.png',
  'flow.network': network,
  'accessNode.api': fclConfigInfo[network].accessNode,
  'discovery.wallet': fclConfigInfo[network].discoveryWallet,
  'discovery.authn.include': fclConfigInfo[network].discoveryAuthInclude,
  '0xNekoCandy': '0x222051dbc0200615',
  '0xNFTAddress': '0x222051dbc0200615',
}).load({ flowJSON })

export const generateTxnURL = (txnId: string) => `https://testnet.flowdiver.io/tx/${txnId}`
