<template>
  <div class="delete">
    <router-link :to="'/movies/' + id"> Cancel </router-link>
    <button class="submit" @click="delete"> Submit </button>
  </div>
</template>

<script>
 const deleteURL = 'http://localhost:5000/delete'
 import axios from 'axios'
 export default {
   props: {
     id: {
       type: Number,
     }
   },

   methods: {
     delete() {
       axios.post(deleteURL, {
	 id: this.id
       }).then(response => {
	 
       }).catch(error   => {
	 alert('error occusins')
	 console.log(error)
       })
     },
   },
 }
</script>

<style scoped>

</style>
