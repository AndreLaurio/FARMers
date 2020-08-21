<template>
    <v-container class="pop mt-5">
        <h1 class="mb-5">Account Approval</h1>
        <v-expansion-panels accordion>
            <v-expansion-panel class="mt-3" v-for="pAcct in pendingAccounts" v-bind:key="pAcct.user_id">
                <v-expansion-panel-header> 
                    <span class="ml-5">{{pAcct.first_name}} {{pAcct.last_name}}</span>
                    <span class="text-right mr-8">Date: {{pAcct.created_at.slice(0,10)}}</span>          
                </v-expansion-panel-header>
                <v-expansion-panel-content>
                    <v-layout row wrap>
                        <v-flex>
                            <div class="ml-8 mt-4">
                                Email: {{pAcct.email}} <br>
                                Location: {{pAcct.city}}<br>
                                Boundary: {{pAcct.boundary}}
                            </div>
                        </v-flex>
                        <v-flex>
                            <img :src="require(`../../assets/storage/images/valid_ids/${pAcct.valid_id_path}`)" class="previewImage text-right" width="200px" height="100px">
                            <div class="text-right mr-12">
                                <v-btn rounded @click="approveAccount(pAcct.user_id)" class="pl-6 pr-6 mt-5 mr-4 primary green accent-4"> Approve </v-btn>
                            </div>            
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