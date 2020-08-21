<template>
    <div>
         <UserHome/>
        <v-main>
            <BuyerDashboard/>
        </v-main>
    </div>
</template>

<script>
import BuyerDashboard from '@/components/buyer/BuyerDashboard.vue'
import UserHome from '@/components/UserHome.vue'


export default {
    components:{
        BuyerDashboard, UserHome
    }
}
</script>