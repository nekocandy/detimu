import * as fcl from '@onflow/fcl'
import script from '../transactions/addEvent.cdc?raw'

export async function addEvent(
  uniqueId: string,
  ownerAddress: string,
  artistAddress: string,
  name: string,
  price: number,
  quantity: number,
  artists: string[],
) {
  const transactionId = await fcl.mutate({
    cadence: script,
    // @ts-expect-error no typings for this yet
    args: (arg, t) => [
      arg(uniqueId, t.String),
      arg(ownerAddress, t.Address),
      arg(artistAddress, t.Address),
      arg(name, t.String),
      arg(price.toFixed(2), t.UFix64),
      arg(quantity, t.UInt32),
      arg(artists, t.Array(t.String)),
    ],
  })

  consola.log('Transaction ID:', transactionId)

  return transactionId
}
