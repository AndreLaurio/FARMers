<template>
    <v-container class="pop mt-5">
        <h1 class="mb-5">Account Approval</h1>
        <v-expansion-panels accordion>
            <v-expansion-panel class="mt-3" v-for="pAcct in pendingAccounts" v-bind:key="pAcct.user_id">
                <v-expansion-panel-header> 
                    <span class="ml-5">{{pAcct.first_name}} {{pAcct.last_name}}</span>
                    <v-spacer></v-spacer>
                    <div>
                        <span>Date: {{pAcct.created_at}}</span>
                    </div>
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                    <v-layout row wrap>
                        <v-flex>
                        email: {{pAcct.email}}
                        location: {{pAcct.location}}
                        boundary: {{pAcct.boundary}}
                        </v-flex>
                        <v-flex>
                            <h1>{{pAcct.valid_id}}</h1>
                            <v-btn @click="approveAccount(pAcct.user_id)" class="pl-12 pr-12 mt-5 primary green accent-4"> Approve </v-btn>
                        </v-flex>
                    </v-layout>
                </v-expansion-panel-content>
            </v-expansion-panel>
        </v-expansion-panels>
    </v-container>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
.pop{
    font-family: 'Poppins', sans-serif;
}
</style>

<script>
import axios from 'axios'
axios.defaults.withCredentials = true
axios.defaults.baseURL = 'http://localhost:8000'

export default {
    data(){
        return{
            pendingAccounts:[]
        }
    },
    mounted(){
        this.getPendingAccounts()
    },
    methods:{
        getPendingAccounts(){
            axios.get('/api/admin/pending-account').then(response =>{
               this.pendingAccounts = response.data
            })
        },
        approveAccount(user_id){
            axios.put(`/api/admin/approve-account/${user_id}`,{
                is_approved: 1
            }).then(response =>{
                this.getPendingAccounts()
            }).catch(err => {
                console.log('failed')
            })
        }
    }
}
</script>