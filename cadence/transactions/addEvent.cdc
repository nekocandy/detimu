import EventsStore from 0xNekoCandy
 
transaction(
    uniqueId: String,
    ownerAddress: Address,
    artistAddress: Address
) {
    prepare(signer: AuthAccount) {
    }

    execute {
        EventStore.addTicket(uniqueId: uniqueId, ownerAddress: ownerAddress, artistAddress: artistAddress)
    }
}