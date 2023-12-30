<script setup lang="ts">

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
      <button bg-indigo-400 w-full px-8 py-4>
        <span v-if="userData?.addr">{{ userData?.addr }}</span>
        <span v-else>Login</span>
      </button>
    </div>
  </div>
</template>

<style scoped>

</style>
