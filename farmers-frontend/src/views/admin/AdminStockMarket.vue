<template>
    <div>
        <ManageStockMarket/>
        <v-main>
            <AdminDashboard/>
        </v-main>
    </div>
</template>

<script>
import AdminDashboard from '@/components/admin/AdminDashboard.vue'
import ManageStockMarket from '@/components/admin/ManageStockMarket.vue'

export default {
    data(){
        return{

        }
    },
    components:{
        AdminDashboard , ManageStockMarket
    }    
}
</script>