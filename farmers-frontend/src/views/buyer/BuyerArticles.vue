<template>
    <div>
        <UserArticles/>
        <v-main>
            <BuyerDashboard/>
        </v-main>
    </div>
</template>

<script>
import BuyerDashboard from '@/components/buyer/BuyerDashboard.vue'
import UserArticles from '@/components/UserArticles.vue'

export default {
    components:{
        BuyerDashboard, UserArticles
    }
}
</script>