<template>
  <div class="movie">
    <div class="info">
      <h2>Title: </h2>
      {{ title }}
      <h2>Year: </h2>
      {{ year }}
    </div>

    <hr>
    
    <div class="buttons" v-show="status == 'normal'">
      <button class="modify" @click="toggleModify">Modify</button>
      <button class="delete" @click="toggleDelete">Delete</button>
    </div>

    <div class="modify" v-show="status == 'modify'">
      <h2>Modify Content</h2>
      <label>Input Title</label>
      <input type="text" placeholder="input title" v-model="newTitle">

      <label>Input Year</label>
      <input type="text" placeholder="input year" v-model="newYear">
      <button class="submit" @click="modify">Submit</button>
      <button class="cancel" @click="cancelModify">Cancel</button>
    </div>

    <div class="delete" v-show="status == 'delete'">
      <h2>Delete Movie</h2>
      <strong>are you sure to delete this movie ?</strong>
      <button class="submit" @click="delete">Delete</button>
      <button class="cancel" @click="cancelDelete">Cancel</button>
    </div>
  </div>
  
</template>

<script>
 import axios from 'axios'
 const modifyUrl = 'http://localhost:5000/modify'
 const deleteURL = 'http://localhost:5000/delete'
 export default {
   data() {
     return {
       id: 0,
       title: '',
       year: '',
       status: 'normal',
       newTitle: '',
       newYear: '',
     }
   },

   methods: {
     toggleModify() {
       this.status = 'modify'
     },
     
     modify() {
       /* after submit, change the status to '' */
       let _title = this.padding(this.newTitle, this.title)
       let _year  = this.padding(this.newYear, this.year)
       
       axios.post(modifyUrl, {
	 id: this.id,
	 title: _title, 
	 year: _year
       }).then(response => {
	 console.log(response.status)
	 /* update data */
	 this.title = _title
	 this.year  = _year

       }).catch(error => {
	 alert(error)
       })

       this.status = 'normal'

     },

     cancelModify() {
       this.status = 'normal'
       this.newTitle = this.newYear = ''
     },

     toggleDelete() {
       this.status = 'delete'
     },

     delete() {
       let that = this
       axios.post(deleteURL, {
	 id: this.id,
       }).then(response => {
	 /* ATTENTION you need to turn back */
	 that.$router.replace({
	   path: '/',
	 })
       }).catch(error => {
	 alert(error)
       })
     },

     cancelDelete() {
       this.status = 'normal'
     },

     padding(string, other) {
       if(string == '') {
	 return other
       } else {
	 return string
       }
     }
   },

   mounted() {
     let query = this.$route.query
     this.id = query.id
     this.title = query.title
     this.year  = query.year
   },
 }
</script>
