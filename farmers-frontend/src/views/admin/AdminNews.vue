<template>
    <div>
        <ManageNews/>
        <v-main>
            <AdminDashboard/>
        </v-main>
    </div>
</template>

<script>
import AdminDashboard from '@/components/admin/AdminDashboard.vue'
import ManageNews from '@/components/admin/ManageNews.vue'

export default {
    components:{
        AdminDashboard, ManageNews
    }
}
</script>