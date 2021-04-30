<template>
  <div class="movie-panel">
    <div class="movie-info">
      <h2> title: {{ movie.title }} </h2>
      <h2> year:  {{ movie.year }} </h2>
    </div>
    
    <div class="operation">
      <router-link :to="'/movies/' + movie.id + '/delete'"> Delete </router-link>
      <router-link :to="'/movies/' + movie.id + '/modify'"> Modify </router-link>
    </div>

  </div>
</template>

<script>
 import axios from 'axios'
 const getterURL = 'http://localhost:5000/get'
 const modifyURL = 'http://localhost:5000/modify'
 const deleteURL = 'http://localhost:5000/delete'
 export default {
   data() {
     return {
       movie: {},
     }
   },
   
   mounted() {
     let id = this.$route.params.id
     this.assignMovie(id)
   },

   methods: {
     assignMovie(id) {
       let that = this
       axios.post(getterURL + '/' + id)
	    .then(response => {
	      that.movie = response.data.data
	    })
	    .catch(error => {
	      console.log('error occusins:', error)
	      alert('error occusins')
	    })
     },
   }
 }
</script>

<style scoped>

</style>
