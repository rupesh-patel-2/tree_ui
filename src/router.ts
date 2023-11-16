import { createRouter, createWebHistory } from 'vue-router'

import IndexPage from '@/pages/IndexPage.vue'
import SiteGenerator from '@/pages/SiteGenerator.vue'


const routes = [
  {
    path: '/',
    component: IndexPage,
    meta: {
      title: 'Site Editor site map page',
    },
  },

  {
    path: '',
    component: IndexPage,
    meta: {
      title: 'Site Editor site map page',
    },
  },
  {
    path: '/home',
    component: IndexPage,
    meta: {
      title: 'Site Editor site map page',
    },
  },

  {
    path: '/generator',
    component: SiteGenerator,
    meta: {
      title: 'Site Editor site map page',
    },
  },

]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
