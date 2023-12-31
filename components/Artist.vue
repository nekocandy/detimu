<script setup lang="ts">
import { faker } from '@faker-js/faker'
import { issueTicket } from '@/cadence/actions/issueTicket'
import { generateTxnURL } from '~/utils/flow'

const props = defineProps<{
  event: TicketEvent
}>()

const uniqueId = nanoid()
const ticketURL = 'https://cdn.discordapp.com/attachments/1190946747527200849/1190946824983425034/concert_ticket.png'

async function buyClicked() {
  const txnId = await issueTicket(
    uniqueId,
    ticketURL,
    props.event.name,
    `Ticket for: ${props.event.name} | Event ID: ${props.event.uniqueId} | Ticket Unique ID: ${uniqueId}`,
  )

  window.open(generateTxnURL(txnId), '_blank')
}
</script>

<template>
  <div grid grid-cols-12>
    <div flex flex-col col-span-7 border-2 px-4 py-4 justify-between>
      <div flex items-center justify-between>
        <div flex gap-2>
          <span font-bold>Name: </span>
          <span>{{ event.name }}</span>
        </div>

        <div flex gap-2>
          <button px-12 bg-lime py-2 @click="buyClicked">
            Buy!
          </button>
        </div>
      </div>

      <div flex gap-2>
        <span font-bold>Artist: </span>
        <span>{{ event.artists.join(", ") }}</span>
      </div>

      <div flex gap-2>
        <span font-bold>Date: </span>
        <span>{{ dayjs(faker.date.soon()).format("DD/MM/YYYY") }}</span>
      </div>

      <div flex gap-2>
        <span font-bold>Location:</span>
        <span>{{ faker.location.city() }}</span>
      </div>
    </div>
    <div
      col-span-5
      h-48
      bg-cover
      w-full :style="{
        backgroundImage: `url(https://i.imgur.com/CQJtTzj.jpeg)`,
      }"
    />
  </div>
</template>

<style scoped>

</style>
