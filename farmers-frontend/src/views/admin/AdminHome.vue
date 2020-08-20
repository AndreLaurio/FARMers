<template>
    <div>
        <UserHome/>
        <v-main>
            <AdminDashboard/>
        </v-main>
    </div>
</template>

<script>
import AdminDashboard from '@/components/admin/AdminDashboard.vue'
import UserHome from '@/components/UserHome.vue'

export default {
    components:{
        AdminDashboard, UserHome
    }
}
</script>