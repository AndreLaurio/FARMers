<template>
    <div>
        <Reports/>
        <v-main>
            <AdminDashboard/>
        </v-main>
    </div>
</template>

<script>
import AdminDashboard from '@/components/admin/AdminDashboard.vue'
import Reports from '@/components/admin/Reports.vue'

export default {
    data(){
        return{

        }
    },
    components:{
        AdminDashboard , Reports
    }    
}
</script>