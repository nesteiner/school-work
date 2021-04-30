<template>
  <div class="append">
    <h2> Create new Movie</h2>

    <div class="form">
      <label>Title</label>
      <input type="text"
	     placeholder="input title of the movie"
	     v-model="title">

      <label>Year</label>
      <input type="text"
	     placeholder="input year of the movie"
	     v-model="year">

      <button class="submit" @click="submit">Submit</button>
    </div>
  </div>
</template>

<script>
 import axios from 'axios'
 const url = 'http://127.0.0.1:5000/append'
 export default {
   data() {
     return {
       title: '',
       year: '',
     }
   },

   methods: {
     submit() {
       let that = this
       axios.post(url, {
	 title: this.title,
	 year: this.year
       }).then(response => {
	 alert(response.data.status)
	 that.title = ''
	 that.year  = ''
       }).catch(error => {
	 console.log(error)
       })
     },
   },
 }
</script>
