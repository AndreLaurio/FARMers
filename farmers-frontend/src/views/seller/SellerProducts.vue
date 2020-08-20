<template>
    <div>
        <ManageProducts/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>

import SellerDashboard from '@/components/seller/SellerDashboard.vue'
import ManageProducts from '@/components/seller/ManageProducts.vue'

export default {
    components:{
        SellerDashboard, ManageProducts
    }
}
</script>