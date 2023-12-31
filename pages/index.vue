<script setup lang="ts">
const router = useRouter()

onMounted(() => {
  if (userData.value?.addr)
    router.push('/explore')
})
</script>

<template>
  <div>
    Hello, Detimu!

    Please login from the sidebar!
  </div>
</template>

<style scoped>

</style>
