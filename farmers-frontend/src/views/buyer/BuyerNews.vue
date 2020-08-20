<template>
    <div>
        <UserNews/>
        <v-main>
            <BuyerDashboard/>
        </v-main>
    </div>
</template>

<script>
import BuyerDashboard from '@/components/buyer/BuyerDashboard.vue'
import UserNews from '@/components/UserNews.vue'

export default {
    components:{
        BuyerDashboard, UserNews
    }
}
</script>