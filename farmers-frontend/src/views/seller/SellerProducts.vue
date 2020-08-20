<template>
    <div>
        <Products/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>

import SellerDashboard from '@/components/seller/SellerDashboard.vue'
import Products from '@/components/seller/Products.vue'

export default {
    components:{
        SellerDashboard, Products
    }
}
</script>