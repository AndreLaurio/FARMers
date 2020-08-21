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

                        <v-container>
                            <v-row align="start">
                                <v-col cols="12" md="6" xs="12">
                                    <v-card-text>
                                        <div class="previewImage">
                                            <img v-if="imageUrl" :src="imageUrl" />
                                        </div>
                                        <br>
                                        <input type="file" @change="previewInsertedImg"/>
                                    </v-card-text>
                                </v-col>

                                <v-col cols="12" md="6" xs="12">
                                    <v-card-text>
                                        <v-text-field outlined v-model="product.product_name" label="Product Name" class="mt-3"></v-text-field>
                                        
                                        <v-textarea outlined name="input-7-4" label="Description" v-model="product.description"></v-textarea>
                                    </v-card-text>
                                </v-col>
                            </v-row>
                        </v-container>

                        <v-card-actions class="justify-center">
                            <v-btn class="primary mb-5" @click="createProduct">Add Product</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
           </v-flex>
        </v-layout>
    </v-container>
</template>

<style scoped>
.previewImage {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 250px;
  height: 250px;
  border: 1px solid grey;
  border-radius: 5px;
  
}

.previewImage img {
  max-width: 100%;
  max-height: 100%;
}
.bordered {
    border: 1px solid black;
}
</style>


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
                description:'',
                product_img:null,
                price: 0
            },
            user_id:'',
            imageUrl:null,
            product_img:null
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

            const config = {
                headers: { 'content-type': 'multipart/form-data' }
            }
            let formData = new FormData()
            formData.append('product_img', this.product_img)
            formData.append('seller_id', this.user_id)
            formData.append('product_name', this.product.product_name)
            formData.append('description', this.product.description)

            console.log(this.product_img);
            axios.post('/api/product', formData, config
            ).then(response => {
                this.products.push({
                    product_name: this.product.product_name,
                    description: this.product.description
                })
            }).catch(err => {console.log(err)})
        },
        previewInsertedImg(e){
            const file = e.target.files[0]
            this.imageUrl = URL.createObjectURL(file)
            this.product_img = e.target.files[0]
        },
    }
}
</script>