<template>
    <div>
        <UserStockMarket/>
        <v-main>
            <BuyerDashboard/>
        </v-main>
    </div>
</template>

<script>
import BuyerDashboard from '@/components/buyer/BuyerDashboard.vue'
import UserStockMarket from '@/components/UserStockMarket.vue'

export default {
    components:{
        BuyerDashboard, UserStockMarket
    }
}
</script>