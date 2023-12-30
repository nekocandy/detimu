<script setup lang="ts">

</script>

<template>
  <div h-screen bg-zinc-100 font-mono text-black grid grid-cols-12 gap-4>
    <div col-span-2 w-full>
      <Sidebar />
    </div>

    <div flex-1 h-full w-full col-span-10>
      <slot />
    </div>
  </div>
</template>

<style scoped>

</style>
