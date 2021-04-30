<template>
  <div class="search">
    <div class="input">
      <input type="text" name="query-title" v-model="title" placeholder="输入电影标题">
      <input type="text" name="query-year" v-model="year" placeholder="输入电影年份">

    </div>

    <div class="query">
      <button class="submit"
	      @click="submit">
	查询
      </button>
      
      <button class="submit all"
	      @click="queryAll">
	查询所有
      </button>

    </div>
  </div>
</template>

<script>
 export default {
   data() {
     return {
       title: '',
       year: '',
     }
   },

   methods: {
     submit() {
       this.$router.push({
	 path: '/movies',
	 query: {
	   year: this.year,
	   title: this.title
	 },
       })
     },

     queryAll() {
       this.$router.push({
	 path: '/movies',
	 query: {
	   year: 'all',
	   title: 'all',
	 }
       })
     },
   },
 }
</script>

<style scoped>

</style>
