import * as fcl from '@onflow/fcl'
import script from '../transactions/issueTicket.cdc?raw'

// uniqueId: String,
// image: String,
// name: String,
// description: String,

export async function issueTicket(

  uniqueId: string,
  image: string,
  name: string,
  description: string,

) {
  const transactionId = await fcl.mutate({
    cadence: script,
    // @ts-expect-error no typings for this yet
    args: (arg, t) => [
      arg(uniqueId, t.String),
      arg(image, t.String),
      arg(name, t.String),
      arg(description, t.String),
    ],
  })

  consola.log('Transaction ID:', transactionId)

  return transactionId
}
