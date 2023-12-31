<script setup lang="ts">
import { getEvents } from '@/cadence/actions/getEvents'

const eventsData = ref<TicketEvent[]>([])

onMounted(async () => {
  const promise = push.promise('Getting Events from Flow Blockchain!')
  const data = await getEvents()
  // good UX practice to show the loader for at least 3 seconds
  await new Promise(resolve => setTimeout(resolve, 3000))
  promise.resolve('Events Fetched Successfully!')

  eventsData.value = data
  consola.info('data', data)
})
</script>

<template>
  <div flex flex-col gap-12>
    <div>
      <h1 text-4xl font-black uppercase>
        Events
      </h1>
    </div>

    <div flex flex-col gap-6>
      <Artist v-for="event in eventsData" :key="event.uniqueId" :event="event" />
    </div>
  </div>
</template>

<style scoped>

</style>
