<template>
  <div class="movie-list">
    <ul>
      <template v-for="movie in movies"
		:key="movie">
	<router-link :to="'/movies/' + movie.id">
	  <li> {{ movie.title }} - {{ movie.year }} </li>
	</router-link>
      </template>
    </ul>
  </div>
</template>

<script>
 export default {
   props: {
     movies: {
       type: Array,
       default: () => {
	 []
       }
     },
   },
   
 }
</script>

<style scoped>
 div.movie-list {
   margin: auto;
   max-width: 580px;
   font-size: 14px;
   font-family: Helvetica, Arial, sans-serif;
 }

 ul {
   list-style-type: none;
   padding: 0;
   margin-bottom: 10px;
   box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
 }

 li {
   padding: 12px 24px;
   border-bottom: 1px solid #ddd;
 }

 li:last-child {
   border-bottom: none;
 }

 li:hover {
   background-color: #f8f9fa;
   cursor: pointer;
 }

</style>
