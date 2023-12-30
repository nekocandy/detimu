<script setup lang="ts">
import { logIn, unauthenticate } from '~/utils/flow/auth'

const router = useRouter()

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
      <h1>This Thing</h1>
    </div>

    <div>
      hi
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
