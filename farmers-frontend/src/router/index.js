import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'
import Admin from '../views/admin/AdminHome'
import AdminApproval from '../views/admin/AdminApproval'
import AdminArticles from '../views/admin/AdminArticles'
import AdminNews from '../views/admin/AdminNews'

import Seller from '../views/seller/SellerHome'
import Buyer from '../views/buyer/BuyerHome'


Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    name: 'Index',
    component: Index
  },
  {
    path: '/seller',
    name: 'Seller',
    component: Seller
  },
  {
    path: '/buyer',
    name: 'Buyer',
    component: Buyer
  },
  {
    path: '/admin',
    name: 'Admin',
    component: Admin
  },
  {
    path:'/admin/approval',
    name: 'AdminApproval',
    component: AdminApproval
  },
  {
    path:'/admin/manage-articles',
    name: 'AdminArticles',
    component: AdminArticles
  },
  {
    path:'/admin/manage-news',
    name: 'AdminNews',
    component: AdminNews
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
