import EventsStore from 0xNekoCandy
 

transaction(
    uniqueId: String,
    ownerAddress: Address,
    artistAddress: Address,
    name: String,
    price: UFix64,
    quantity: UInt32,
    artists: [String]
) {
    prepare(signer: AuthAccount) {
    }

    execute {
        EventsStore.addEvent(
            uniqueId: uniqueId,
            name: name,
            price: price,
            quantity: quantity,
            address: ownerAddress,
            artists: artists
        )
    }
}