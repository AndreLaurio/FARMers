<template>
    <v-container grid-list-md class="pop mt-5">
       <v-layout row wrap>
           <v-flex md12 xs12 class="text-center">
               <h1>News</h1>
           </v-flex>
           <v-flex md12 xs12 class="mt-5">
                <v-expansion-panels accordion>
                    <v-expansion-panel v-for="n in news" v-bind:key="n.news_id" class="mt-3">
                        <v-expansion-panel-header>
                            <span class="ml-5">{{n.title}}</span>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            <span class="ml-10"> {{n.body}}</span>
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-expansion-panels>
           </v-flex>
       </v-layout>
     
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
            news:[],
            user_id:'',
        }
    },
    mounted(){
        // this.getUserData()
        this.getNews()
    },
    methods:{
        // getUserData(){
        //     axios.get('/api/user').then(response =>{
        //         this.user_id = response.data.user_id
        //     })
        // },
        getNews(){
            axios.get('/api/news').then(response => {
                this.news = response.data
            })
        }
    }
}
</script>