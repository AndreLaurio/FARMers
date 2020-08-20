<template>
    <div>
        <ManageArticles/>
        <v-main>
            <AdminDashboard/>
        </v-main>
    </div>
</template>

<script>
import AdminDashboard from '@/components/admin/AdminDashboard.vue'
import ManageArticales from '@/components/admin/ManageArticles.vue'

export default {
    components:{
        AdminDashboard, AccountApproval
    }
}
</script>