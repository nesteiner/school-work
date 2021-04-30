<template>
  <div class="index-body">
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
 const url = 'http://localhost:5000/get/movies'
 export default {
   data() {
     return {
       name: 'hello',
       movies: null,/* this.takeMovies(), */
       /* movies: [
	  {'title': 'My Neighbor Totoro', 'year': '1988'},
	  {'title': 'Dead Poets Society', 'year': '1989'},
	  {'title': 'A Perfect World', 'year': '1993'},
	  {'title': 'Leon', 'year': '1994'},
	  {'title': 'Mahjong', 'year': '1996'},
	  {'title': 'Swallowtail Butterfly', 'year': '1996'},
	  {'title': 'King of Comedy', 'year': '1999'},
	  {'title': 'Devils on the Doorstep', 'year': '1999'},
	  {'title': 'WALL-E', 'year': '2008'},
	  {'title': 'The Pork of Music', 'year': '2012'},
	* ], */

       avatar,
       totoro,
     }
   },

   methods: {
     takeMovies() {
       let that = this
       axios.get(url)
	    .then(response => {
	      that.movies = response.data
	    })
	    .catch(error => {
	      console.log('error occusin', error)
	    })
     },
   },
   
 }
</script>

<style scoped>
 div.index-body {
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
