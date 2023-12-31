<script setup lang="ts">
import { addEvent } from '@/cadence/actions/addEvent'

const uniqueId = nanoid()
const name = ref('')
const price = ref(1)
const quantity = ref(20)
const artists = ref('')
const transactionId = ref(null)

async function createEvent() {
  if (!name.value || !price.value || !quantity.value || !artists.value) {
    // eslint-disable-next-line no-alert
    alert('Please fill all the fields')
    return
  }

  const artistsArray = artists.value.split(',').map(artist => artist.trim())
  const data = await addEvent(
    uniqueId,
    userData.value?.addr || '',
    userData.value?.addr || '',
    name.value,
    price.value,
    quantity.value,
    artistsArray,
  )

  consola.info('data', data)

  if (data) {
    // eslint-disable-next-line no-alert
    alert('Event created successfully')
  }
}
</script>

<template>
  <div flex flex-col gap-4 text-xl>
    <div pb-12>
      <h1 text-3xl uppercase font-black>
        Create a concert!
      </h1>
    </div>

    <div flex items-center gap-4>
      <div flex items-center gap-4 w-full>
        <label for="name">Name</label>
        <span>:</span>
        <input id="name" v-model="name" bg-zinc-200 px-2 py-2 type="text" placeholder="Enter Concert Name" w-full>
      </div>

      <div flex items-center gap-4 w-full>
        <label for="artists">Artists</label>
        <span>:</span>
        <input id="artists" v-model="artists" bg-zinc-200 px-2 py-2 type="text" placeholder="Enter Artist names separated by commas" w-full>
      </div>
    </div>

    <div flex items-center gap-4>
      <div flex items-center gap-4 w-full>
        <label for="price">Price (in FLOW Tokens)</label>
        <span>:</span>
        <input id="price" v-model="price" flex-1 bg-zinc-200 px-2 py-2 type="number" placeholder="Enter Concert Price" w-full>
      </div>

      <div flex items-center gap-4 w-full>
        <label for="quantity">Quantity</label>
        <span>:</span>
        <input id="quantity" v-model="quantity" bg-zinc-200 px-2 py-2 type="number" placeholder="Enter Concert Quantity" w-full>
      </div>
    </div>

    <button bg-lime py-4 rounded-md @click="createEvent">
      Create Event
    </button>

    <div v-if="transactionId">
      <h1 text-3xl uppercase font-black>
        Transaction ID
      </h1>
      <p>
        {{ transactionId }}
      </p>
    </div>
  </div>
</template>

<style scoped>

</style>
