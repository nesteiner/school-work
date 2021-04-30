<template>
  <div class="main">
    <div class="left links">
      <router-link to="/"> home page </router-link>
      <router-link to="/append">create new movie</router-link>
      <router-link to="/all">show all the movies</router-link>
      <router-link to="/search">search movies</router-link>
    </div>

    <div class="right content">
      <!-- this page is at / -->
      <router-view> </router-view>
    </div>
  </div>
</template>

<script>
export default {
   
}
</script>


<style scoped> /* for structure */
 div.left.links {
   display: flex;
   flex-direction: column;
 }

 /* now, left split left and right */
 div.main {
   display: flex;
 }

 div.left {
   width: 20%;
 }

 div.right {
   width: 80%;
 }
 
 div.left, div.right {
   border: 1px solid black;
   height: 1000px;
 }
</style>

