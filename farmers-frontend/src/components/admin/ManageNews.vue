<template>
    <v-container grid-list-md class="pop mt-5">
       <v-layout row wrap>
           <v-flex md12 xs12 class="text-center">
               <h1>News</h1>
           </v-flex>
           <v-flex md12 xs12 class="text-right">
                 <v-dialog v-model="dialog" max-width="600">
                    <template v-slot:activator="{ on, attrs }">
                    <v-btn rounded class="success" v-bind="attrs" v-on="on"> <v-icon size="17" class="pr-1">mdi-plus-thick</v-icon>  Add News </v-btn>
                    </template>
                    <v-card class="rounded-xl">
                        <v-card-title class="pt-5">Create News</v-card-title>
                        <v-card-text>
                                <v-text-field outlined v-model="newNews.title" label="Title" class="mt-3"></v-text-field>
                                <v-textarea outlined name="input-7-4" label="Description" v-model="newNews.body"></v-textarea>
                        </v-card-text>
                        <v-card-actions class="justify-center">
                            <v-btn class="primary mb-5" @click="createNews">Submit</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
           </v-flex>
           <v-flex md12 xs12 class="mt-5">
                <v-expansion-panels accordion>
                    <v-expansion-panel v-for="n in news" v-bind:key="n.news_id" class="mt-3">
                        <v-expansion-panel-header>
                            <span class="ml-5">{{n.title}}</span>
                            <span class="text-right mr-5">
                                <v-icon @click="deleteNews(n.news_id)" color="red" class="mr-5">mdi-delete</v-icon>
                                <v-icon color="green accent-4" class="mr-5">mdi-clipboard-edit</v-icon>
                            </span>
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
            newNews:{
                title:'',
                body:''
            },
            user_id:'',
            addNews:false,
        }
    },
    mounted(){
        this.getUserData()
        this.getNews()
    },
    methods:{
        getUserData(){
            axios.get('/api/user').then(response =>{
                this.user_id = response.data.user_id
            })
        },
        getNews(){
            axios.get('/api/news').then(response => {
                this.news = response.data
            })
        },
        createNews(){
            axios.post('/api/news',{
                user_id: this.user_id,
                title: this.newNews.title,
                body: this.newNews.body
            }).then(response => {
                this.news.push({
                    title: this.newNews.title,
                    body: this.newNews.body
                })
            }).catch(err => {console.log(err)})
        },
        deleteNews(id){
            axios.delete(`/api/news/${id}`).then(response => {
                this.getNews()
            })
        },
        updateNews(){

        }
    }
}
</script>