import * as fcl from '@onflow/fcl'
import script from '../transactions/addEvent.cdc?raw'

export async function addEvent(uniqueId: string, ownerAddress: string, artistAddress: string) {
  const transactionId = await fcl.mutate({
    cadence: script,
    args: (arg, t) => [arg(uniqueId, t.String), arg(ownerAddress, t.Address), arg(artistAddress, t.Address)],
  })

  return transactionId
}
