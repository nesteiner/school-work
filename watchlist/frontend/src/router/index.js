import { createRouter, createWebHashHistory, createWebHistory } from 'vue-router'

import Home from '@/views/Home.vue'
import Append from '@/views/append.vue'
import All from '@/views/all.vue'
import Search from '@/views/search.vue'
import Movie from '@/components/movie.vue'
const routes = [
  {
    path: '/',
    component: Home,
  },

  {
    path: '/append',
    component: Append,
  },

  {
    path: '/all',
    component: All,
  },

  {
    path: '/search',
    component: Search,
  },

  {
    path: '/movie',
    component: Movie,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})


export default router
