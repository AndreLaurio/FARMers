<template>
    <div>
        <UserArticles/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>
import SellerDashboard from '@/components/seller/SellerDashboard.vue'
import UserArticles from '@/components/UserArticles.vue'

export default {
    components:{
        SellerDashboard, UserArticles
    }
}
</script>