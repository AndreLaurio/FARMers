<template>
    <div>
        <UserStockMarket/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>
import SellerDashboard from '@/components/seller/SellerDashboard.vue'
import UserStockMarket from '@/components/UserStockMarket.vue'

export default {
    components:{
        SellerDashboard, UserStockMarket
    }
}
</script>