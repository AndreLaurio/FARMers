<template>
    <div>
        <SellerHome/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>
import SellerDashboard from '@/components/seller/SellerDashboard'
import SellerHome from '@/components/seller/SellerHome.vue'


export default {
    components:{
        SellerDashboard, SellerHome
    }    
}
</script>