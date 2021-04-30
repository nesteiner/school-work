<template>
  <div class="all">
    <ul>
      <template v-for="movie in movies" :key="movie">
	<li @click="jump(movie)"> {{ movie.title }} - {{ movie.year }}</li>
      </template>
    </ul>
  </div>
</template>

<script>
 import axios from 'axios'
 import movie from '@/components/movie.vue'
 const url = 'http://localhost:5000/all'
 
 export default {
   components: {
     movie
   },
   
   data() {
     return {
       movies: []
     }
   },

   methods: {
     getAllMovies() {
       let that = this
       axios.post(url)
	    .then(response => {
	      that.movies = response.data.data
	    }).catch(error => {
	      alert(error)
	    })

     },

     jump(movie) {
       this.$router.replace({
	 path: '/movie',
	 query: {
	   id: movie.id,
	   title: movie.title,
	   year: movie.year
	 },
       })
     },
   },

   mounted() {
     this.getAllMovies()
   },
 }
</script>

<style scoped>
 ul li:hover {
   cursor: pointer;
 }
</style>

