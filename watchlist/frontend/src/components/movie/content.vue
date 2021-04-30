<template>
  <div class="movie-content">
    <div class="display">
      <h3> title: {{ movie.title }}</h3>
      <h3> year:  {{ movie.year  }}</h3>
    </div>
    
    <hr>
    
    <div class="operation">
      
    </div>
  </div>
</template>

<script>
 import axios from 'axios'
 const getterURL = 'http://localhost:5000/get'
 
 export default {
   data() {
     return {
       movie: {}
     }
   },
   
   mounted() {
     let id = this.$route.params.id
     let URL = getterURL + '/' + id
     let that = this
     axios.post(URL)
	  .then(response => {
	    that.movie = response.data.data
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
