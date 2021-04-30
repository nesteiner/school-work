<template>
  <div class="movies">
    <movie-list :movies="movies"> </movie-list>
  </div>
</template>

<script>
 import axios from 'axios'
 import movieList from '@/components/movie/list.vue'
 const queryAllURL = 'http://localhost:5000/all'

 export default {
   components: {
     'movie-list': movieList
   },
   
   data() {
     return {
       movies: [],
     }
   },

   mounted() {
     let that = this
     axios.post(queryAllURL)
	  .then(response => {
	    that.movies = response.data.data
	  })
	  .catch(error => {
	    console.log('error occusins:', error)
	    alert('error occusins')
	  })

   },

 }

</script>

<style scoped>

</style>
