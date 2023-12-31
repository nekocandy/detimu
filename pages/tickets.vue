<script setup lang="ts">

</script>

<template>
  <div flex flex-col gap-12>
    <div>
      <h1 font-black text-3xl>
        Your Tickets
      </h1>
    </div>

    <div w-full bg-lime bg-opacity-40 py-4 px-12>
      Due to limited information return from FLOW chain, we can just retrieve the IDs of NFT from the TESTNET, so it shows the UniqueID of the issued ticket
    </div>

    <div>
      <div grid grid-cols-2 gap-8>
        <div w-full h-full flex flex-col gap-4 border-2 px-4 py-4>
          <img w-full src="https://cdn.discordapp.com/attachments/1190946747527200849/1190946824983425034/concert_ticket.png" alt="">

          <div flex items-center gap-2>
            <span font-bold>Ticket UniqueID: </span>
            <span>{{ nanoid() }}</span>
          </div>

          <div flex items-center gap-2>
            <span font-bold>Ticket NFT Key: </span>
            <span>{{ nanoid() }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>

</style>
