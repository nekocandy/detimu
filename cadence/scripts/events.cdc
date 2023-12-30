pub contract Events {
    pub let events: [TicketEvent]

    pub struct Ticket {
        pub let uniqueId: String
        pub let ownerAddress: Address
        pub let artistAddress: Address

        init(uniqueId: String, ownerAddress: Address, artistAddress: Address) {
            self.uniqueId = uniqueId
            self.ownerAddress = ownerAddress
            self.artistAddress = artistAddress
        }
    }

    pub struct TicketEvent {
        pub let uniqueId: String
        pub let name: String
        pub let price: UFix64
        pub let quantity: UInt32
        pub let ownerAddress: Address
        pub let artists: [String]
        pub var tickets: [Ticket]

        init(uniqueId: String,name: String, price: UFix64, quantity: UInt32, address: Address, artists: [String]) {
            self.uniqueId = uniqueId
            self.name = name
            self.price = price
            self.quantity = quantity
            self.ownerAddress = address
            self.artists = artists
            self.tickets = []
        }


        pub fun addTicket(uniqueId: String, ownerAddress: Address, artistAddress: Address) {
            let ticket = Ticket(uniqueId: uniqueId, ownerAddress: ownerAddress, artistAddress: artistAddress)
            self.tickets.append(ticket)
        }
    }

    init() {
        self.events = []
    }


    pub fun addEvent(name: String, price: UFix64, quantity: UInt32, address: Address, artists: [String]) {
        let event = TicketEvent(name: name, price: price, quantity: quantity, address: address, artists: artists)
        self.events.append(event)
    }

    pub fun getEvents(): [TicketEvent] {
        return self.events
    }

    pub fun getEvent(index: Int): TicketEvent {
        return self.events[index]
    }

    pub fun getEventCount(): Int {
        return self.events.length
    }

    pub fun getEventByName(name: String): TicketEvent? {
        for event in self.events {
            if event.name == name {
                return event
            }
        }
        return nil
    }

    pub fun getEventByAddress(address: Address): TicketEvent? {
        for event in self.events {
            if event.ownerAddress == address {
                return event
            }
        }
        return nil
    }

    pub fun getEventByArtist(artist: String): TicketEvent? {
        for event in self.events {
            for artistName in event.artists {
                if artistName == artist {
                    return event
                }
            }
        }
        return nil
    }

    pub fun getEventByTicketId(ticketId: String): TicketEvent? {
        for event in self.events {
            for ticket in event.tickets {
                if ticket.uniqueId == ticketId {
                    return event
                }
            }
        }
        return nil
    }

    pub addTicketFromEventId(eventId: String, uniqueId: String, ownerAddress: Address, artistAddress: Address) {
        for event in self.events {
            if event.uniqueId == eventId {
                event.addTicket(uniqueId: uniqueId, ownerAddress: ownerAddress, artistAddress: artistAddress)
            }
        }
    }
}