import EventsStore from 0xNekoCandy
 
pub fun main(): [EventsStore.TicketEvent] {
  return EventsStore.getEvents()
}