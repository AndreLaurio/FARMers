<template>
    <v-container class="pop mt-5">

        <v-layout row wrap>
           <v-flex md12 xs12 class="text-center">
               <h1>Products</h1>
           </v-flex>

           <v-flex md12 xs12 class="text-right">
                 <v-dialog v-model="dialog" max-width="600">
                    <template v-slot:activator="{ on, attrs }">
                    <v-btn class="primary" v-bind="attrs" v-on="on"> Add Product </v-btn>
                    </template>
                    <v-card class="rounded-xl">
                        <v-card-title class="pt-5">Create Product</v-card-title>
                        <v-card-text>
                                <v-text-field outlined v-model="product.product_name" label="Product Name" class="mt-3"></v-text-field>
                                <v-textarea outlined name="input-7-4" label="Description" v-model="product.description"></v-textarea>
                        </v-card-text>
                        <v-card-actions class="justify-center">
                            <v-btn class="primary mb-5" @click="createProduct">Add Product</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
           </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
import axios from 'axios'
axios.defaults.withCredentials = true
axios.defaults.baseURL = 'http://localhost:8000'

export default {
    data(){
        return{
            products:[],
            product:{
                product_name:'',
                description:''
            },
            user_id:'',
        }
    },
    mounted(){
        this.getUserData()
    },
    methods:{
        getUserData(){
            axios.get('/api/user').then(response =>{
                this.user_id = response.data.user_id
            })
        },
        createProduct(){
            axios.post('/api/product', {
                seller_id: this.user_id,
                product_name: this.product.product_name,
                description: this.product.description
            }).then(response => {
                this.products.push({
                    product_name: this.product.product_name,
                    description: this.product.description
                })
            }).catch(err => {console.log(err)})
        },
    }
}
</script>