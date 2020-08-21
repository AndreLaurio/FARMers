<template>
    <div>
        <UserNews/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>
import SellerDashboard from '@/components/seller/SellerDashboard.vue'
import UserNews from '@/components/UserNews.vue'

export default {
    components:{
        SellerDashboard, UserNews
    }
}
</script>