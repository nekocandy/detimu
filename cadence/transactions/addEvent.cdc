import EventsStore from 0xNekoCandy
 
transaction(
    uniqueId: String,
    ownerAddress: Address,
    artistAddress: Address
) {
    let eventsStore: &EventsStore
    prepare(signer: AuthAccount) {
        // let eventsStore = getAccount(0xNekoCandy).getCapability<&EventsStore.Collection{EventsStore.CollectionPublic}>(EventsStore.CollectionPublicPath)!.borrow()
    }

    execute {
        eventsStore.addTicket(uniqueId: uniqueId, ownerAddress: ownerAddress, artistAddress: artistAddress)
    }
}