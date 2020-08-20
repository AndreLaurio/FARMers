<template>
    <div>
        <UserHome/>
        <v-main>
            <SellerDashboard/>
        </v-main>
    </div>
</template>

<script>
import SellerDashboard from '@/components/seller/SellerDashboard'
import UserHome from '@/components/UserHome.vue'


export default {
    components:{
        SellerDashboard, UserHome
    }    
}
</script>