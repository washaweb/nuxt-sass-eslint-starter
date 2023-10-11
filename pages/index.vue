<template>
  <main>
    <h2>Example app</h2>
    <input name="counter" id="counter" v-model="count">
    <div class="display-counter">counter: {{ count }}</div>
    <button @click="add">add (+)</button>
    <button @click="minus">remove (-)</button>
  </main>
</template>

<script>
import { ref } from 'vue'

export default {
  // `setup` is a special hook dedicated for the Composition API.
  setup() {
    const count = ref(0)
    function add() {
      count.value++
    }
    function minus() {
      count.value = count.value > 0 ? count.value - 1 : 0
    }
    // expose the ref to the template
    return {
      count,
      add,
      minus,
    }
  }
}
</script>

<style lang="scss">

  $color: #006aff;


  .display-counter {
    color: $color;
    font-weight: bold;
    font-size: 20px;
    padding: 20px;
  }

  button, input {
    text-align: center;
    border: 1px solid #b1c9db;
    padding: 6px 18px;
    border-radius: 8px;
  }

  button {
    border: none;
    background-color: $color;
    color: #fff;
    display: inline-block;
    margin: 4px;
  }
</style>