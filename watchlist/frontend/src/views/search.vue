<template>
  <div class="search">
    <div class="interactive">
      <h1> Search </h1>
      <select v-model="field">
	<option disable value="">Select a field for query</option>
	<option>title</option>
	<option>year</option>
      </select>

      <input type="text"
	     placeholder="input query string"
	     v-model="string">
      <button class="submit" @click="submit">Submit</button>
    </div>

    <div class="result">
      <ul>
	<template v-for="movie in movies" :key="movie">
	  <li> {{ movie.title }} - {{ movie.year }} </li>
	</template>
      </ul>
    </div>
  </div>
</template>

<script>
 import axios from 'axios'
 const url = 'http://localhost:5000/search'
 export default {
   data() {
     return {
       string: '',
       field: '',
       movies: [],
     }
   },

   methods: {
     submit() {
       let that = this
       axios.post(url, {
	 field: this.field,
	 string: this.string,
       }).then(response => {
	 that.movies = response.data.data
       }).catch(error => {
	 alert(error)
       })
     },
   },
 }
</script>

