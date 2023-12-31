<script setup lang="ts">
import { logIn, unauthenticate } from '~/utils/flow/auth'

const router = useRouter()

const PATHS = [
  {
    name: 'Home',
    path: '/',
  },
  {
    name: 'Explore',
    path: '/explore',
  },
  {
    name: 'Tickets',
    path: '/tickets',
  },
  {
    name: 'Create',
    path: '/create',
  },
]

async function handleUserAuth() {
  if (userData.value?.addr)
    unauthenticate()

  else
    logIn()
}

watch(userData, (newValue, oldValue) => {
  if (newValue?.addr && !oldValue?.addr)
    router.push('/explore')
  else
    router.push('/')

  consola.withTag('[WALLET]').info('userData changed from', oldValue, 'to', newValue)
})
</script>

<template>
  <div flex flex-col items-center justify-between bg-zinc-200 gap-4 px-8 py-8 h-full w-full>
    <div>
      <h1 text-4xl font-black font-serif flex items-center gap-4>
        <div i-game-icons-party-flags />
        <span>Detimu</span>
      </h1>
    </div>

    <div flex flex-col gap-4>
      <div v-for="path in PATHS" :key="path.name" text-center text-2xl uppercase flex flex-col gap-4 text-black>
        <NuxtLink :to="path.path" class="w-full px-8 py-1 truncate">
          {{ path.name }}
        </NuxtLink>
      </div>
    </div>

    <div w-full>
      <button
        :class="{
          'bg-indigo-400': userData?.addr,
          'bg-indigo-600': !userData?.addr,
        }"
        w-full px-8 py-1 truncate @click="handleUserAuth"
      >
        <div v-if="userData?.addr" flex items-center gap-1>
          <div text-4xl i-material-symbols-shield-person text-white />
          <span truncate>
            {{ userData?.addr }}
          </span>

          <div i-material-symbols-logout text-3xl text-red-700 />
        </div>
        <div v-else>
          Login
        </div>
      </button>
    </div>
  </div>
</template>

<style scoped>

</style>
