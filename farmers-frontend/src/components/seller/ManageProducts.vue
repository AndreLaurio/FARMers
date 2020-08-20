<template>
    <v-container class="pop mt-5">

        <v-layout row wrap>
            <v-flex md12 xs12 class="text-center">
               <h1>Products</h1>
            </v-flex>

            <v-flex md12 xs12 class="text-right">
                <v-dialog v-model="addProductDialog" max-width="600">
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
                                        <v-text-field outlined v-model="product.price" label="Price" prefix="₱"></v-text-field>

                                        <v-row>
                                            <v-col>
                                                <v-text-field outlined v-model="product.total_stocks" label="Stocks"></v-text-field>
                                            </v-col>
                                            <v-col>
                                                <v-text-field outlined v-model="product.min_buyable_stocks" label="Min. Buyable Stocks"></v-text-field>
                                            </v-col>
                                        </v-row>

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

            <v-row class="mt-10">
                <v-card v-for="product in products" :key="product.product_id" class="ml-5 mb-5">
                    <div class="cardProductImage">
                         <img :src="require(`../../assets/storage/images/products/${product.product_img_path}`)" class="previewImage">
                    </div>
                    <div class="text-center mt-5 mb-5">
                        {{product.product_name}} <br>
                        ₱ {{product.price}}<br> <br>
                        <v-btn class="primary mr-5">Details</v-btn>
                        <v-btn class="error">Remove</v-btn> <br> <br>
                        <v-btn class="primary">View Offers</v-btn>
                    </div>
                </v-card>
            </v-row>

        </v-layout>
    </v-container>
</template>

<style scoped>
.cardProductImage {
    /* background-color: grey; */
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    width: 250px;
    height: 250px;
}

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
                price:0,
                total_stocks:'',
                min_buyable_stocks:''
            },
            user_id:'',
            imageUrl:null,
            product_img:null,
            addProductDialog:false
        }
    },
    mounted(){
        this.getUserData(),
        this.getProducts()
    },
    methods:{
        getUserData(){
            axios.get('/api/user').then(response =>{
                this.user_id = response.data.user_id
            })
        },
        getProducts(){
            axios.get('/api/products').then(response => {
                this.products = response.data
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
            formData.append('price', this.product.price)
            formData.append('total_stocks', this.product.total_stocks)
            formData.append('min_buyable_stocks', this.product.min_buyable_stocks)

            axios.post('/api/product', formData, config
            ).then(response => {
                this.products.push({
                    product_name: this.product.product_name,
                    description: this.product.description
                })

                this.addProductDialog = false
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