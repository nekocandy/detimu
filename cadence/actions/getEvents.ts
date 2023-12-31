import * as fcl from '@onflow/fcl'
import script from '../scripts/getEvents.cdc?raw'

export async function getEvents() {
  const events = await fcl.query({
    cadence: script,
  })

  return events
}
