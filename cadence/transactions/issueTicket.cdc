import TicketsNFT from 0xNekoCandy

transaction(
    uniqueId: String,
    image: String,
    name: String,
    description: String,
) {

  prepare(acct: AuthAccount) {
    // Gives the signer a Collection if they don't already have it.
    if acct.borrow<&TicketsNFT.Collection>(from: /storage/TicketsNFTCollection) == nil {
      acct.save(<- TicketsNFT.createEmptyCollection(), to: /storage/TicketsNFTCollection)
      acct.link<&TicketsNFT.Collection{TicketsNFT.CollectionPublic}>(/public/TicketsNFTCollection, target: /storage/TicketsNFTCollection)
    }

    let nftCollection = acct.borrow<&TicketsNFT.Collection>(from: /storage/TicketsNFTCollection)!

    nftCollection.deposit(token: <- TicketsNFT.mintNFT(
        uniqueId: uniqueId,
        image: image,
        name: name,
        description: description,
    ))
  }

  execute {
    log("Minted an NFT")
  }
}