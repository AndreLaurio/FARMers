<template>
    <v-container grid-list-md class="pop mt-5">
       <v-layout row wrap>
           <v-flex md12 xs12 class="text-center">
               <h1>Articles</h1>
           </v-flex>
           <v-flex md12 xs12 class="text-right">
                 <v-dialog v-model="dialog" max-width="600">
                    <template v-slot:activator="{ on, attrs }">
                    <v-btn class="success" rounded v-bind="attrs" v-on="on"> <v-icon size="17" class="pr-1">mdi-plus-thick</v-icon> Add Article </v-btn>
                    </template>
                    <v-card class="rounded-xl">
                        <v-card-title class="pt-5">Create Article</v-card-title>
                        <v-card-text>
                                <v-text-field outlined v-model="article.title" label="Title" class="mt-3"></v-text-field>
                                <v-textarea outlined name="input-7-4" label="Description" v-model="article.body"></v-textarea>
                        </v-card-text>
                        <v-card-actions class="justify-center">
                            <v-btn class="primary mb-5" @click="createArticle">Submit</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
           </v-flex>
           <v-flex md12 xs12 class="mt-5">
                <v-expansion-panels accordion>
                    <v-expansion-panel v-for="arti in articles" v-bind:key="arti.article_id" class="mt-3">
                        <v-expansion-panel-header>
                            <span class="ml-5">{{arti.title}}</span>
                            <span class="text-right mr-5">
                                <v-icon @click="deleteArticle(arti.article_id)" color="red" class="mr-5">mdi-delete</v-icon>
                                <v-icon color="green accent-4" class="mr-5">mdi-clipboard-edit</v-icon>
                            </span>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                            <span class="ml-10"> {{arti.body}}</span>
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
            articles:[],
            article:{
                title:'',
                body:''
            },
            user_id:'',
            addArticle:false,
        }
    },
    mounted(){
        this.getUserData()
        this.getArticles()
    },
    methods:{
        getUserData(){
            axios.get('/api/user').then(response =>{
                this.user_id = response.data.user_id
            })
        },
        getArticles(){
            axios.get('/api/article').then(response => {
                this.articles = response.data
            })
        },
        createArticle(){
            axios.post('/api/article',{
                user_id: this.user_id,
                title: this.article.title,
                body: this.article.body
            }).then(response => {
                this.articles.push({
                    title: this.article.title,
                    body: this.article.body
                })
            }).catch(err => {console.log(err)})
        },
        deleteArticle(id){
            axios.delete(`/api/article/${id}`).then(response => {
                this.getArticles()
            })
        },
        updateArticle(){

        }
    }
}
</script>