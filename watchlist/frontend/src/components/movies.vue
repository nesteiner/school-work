<template>
  <div class="movies">
    <h2>
      <img alt="Avatar" class="avatar" :src="avatar">
      {{ name }}'s Watchlist
    </h2>
    <p> {{ movies == null ? 0:movies.length }} </p>
    <ul class="movie-list">
      <template v-for="movie in movies"
		       :key="movie">
	<li> {{ movie.title }} - {{ movie.year }} </li>
      </template>
    </ul>
    
    <img alt="Walking Totoro"
	 class="totoro"
	 :src="totoro"
	 title="to~to~ro~">    
  </div>

</template>

<script>
 import avatar from '@/assets/images/avatar.png'
 import totoro from '@/assets/images/totoro.gif'
 import axios from 'axios'

 const queryURL = 'http://localhost:5000/query'
 const queryAllURL = 'http://localhost:5000/all'
 export default {
   data() {
     return {
       name: 'Grey Li',
       avatar,
       totoro,
       movies: [],
     }
   },

   mounted() {
     let that = this

     let title = this.$route.query.title
     let year  = this.$route.query.year
     /* STUB here log the arg */
     console.log('title: ', title, 'year: ', year)

     if(title == 'all' && year == 'all') {
       axios.post(queryAllURL)
	    .then(response => {
	      that.movies = response.data.data
	    })
	    .catch(error => {
	      console.log('error occusins', error)
	    })
       
     } else {
       axios.post(queryURL, {
	 title,
	 year,
       }).then(response => {
	 that.movies = response.data.data

	 /* STUB */
	 console.log(response.data)
       }).catch(error => {
	 console.log('error occusins', error)
       })
       
     }

   },

 }

</script>

<style scoped>
 div.movies {
   margin: auto;
   max-width: 580px;
   font-size: 14px;
   font-family: Helvetica, Arial, sans-serif;
 }

 .avatar {
   width: 40px;
 }

 .movie-list {
   list-style-type: none;
   padding: 0;
   margin-bottom: 10px;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
 }

 .movie-list li {
   padding: 12px 24px;
   border-bottom: 1px solid #ddd;
 }

 .movie-list li:last-child {
   border-bottom: none;
 }

 .movie-list li:hover {
   background-color: #f8f9fa;
 }

 .totoro {
   display: block;
   margin: 0 auto;
   height: 100px;
 }

</style>
