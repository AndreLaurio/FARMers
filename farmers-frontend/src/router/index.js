import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'

import Admin from '../views/admin/AdminHome'
import AdminApproval from '../views/admin/AdminApproval'
import AdminArticles from '../views/admin/AdminArticles'
import AdminNews from '../views/admin/AdminNews'
import AdminStockMarket from '../views/admin/AdminStockMarket'

import Seller from '../views/seller/SellerHome'
import SellerProducts from '../views/seller/SellerProducts'
import SellerNews from '../views/seller/SellerNews'
import SellerArticles from '../views/seller/SellerArticles'
import SellerStockMarket from '../views/seller/SellerStockMarket'

import Buyer from '../views/buyer/BuyerHome'
import BuyerNews from '../views/buyer/BuyerNews'
import BuyerArticles from '../views/buyer/BuyerArticles'
import BuyerStockMarket from '../views/buyer/BuyerStockMarket'

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
    path: '/seller/products',
    name: 'SellerProducts',
    component: SellerProducts
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
  },
  {
    path:'/admin/manage-stockmarket',
    name: 'AdminStockMarket',
    component: AdminStockMarket
  },
  {
    path: '/buyer/news',
    name: 'BuyerNews',
    component: BuyerNews
  },
  {
    path: '/buyer/articles',
    name: 'BuyerArticles',
    component: BuyerArticles
  },
  {
    path: '/buyer/stock-market',
    name: 'BuyerStockMarket',
    component: BuyerStockMarket
  },
  {
    path: '/seller/news',
    name: 'SellerNews',
    component: SellerNews
  },
  {
    path: '/seller/articles',
    name: 'SellerArticles',
    component: SellerArticles
  },
  {
    path: '/seller/stock-market',
    name: 'SellerStockMarket',
    component: SellerStockMarket
  },
  
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
