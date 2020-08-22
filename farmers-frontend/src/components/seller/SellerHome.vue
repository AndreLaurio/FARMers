<template>
     <v-container class="pop mt-5">
        <v-layout row wrap>
            <v-flex md12 xs12 class="text-center">
               <h1>Products</h1>
            </v-flex>
            <v-row class="mt-10">
                <v-card v-for="product in products" :key="product.product_id" class="ml-5 mb-5">
                    <div class="cardProductImage">
                         <img :src="require(`../../assets/storage/images/products/${product.product_img_path}`)" class="previewImage" width="300px" height="250px">
                    </div>
                    <div class="text-center mt-5 mb-5">
                        {{product.product_name}} <br>
                        ₱ {{product.price}}<br> <br>
                        <v-btn rounded class="primary mr-3">Details</v-btn>
                    </div>
                </v-card>
            </v-row>

        </v-layout>
    </v-container>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
.pop{
    font-family: 'Poppins', sans-serif;
}
.cardProductImage {
    /* background-color: grey; */
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center;
    width: 250px;
    height: 250px;
}

.previewImage {
  justify-content: center;
  align-items: center;
  width: 250px;
  height: 250px;
  border: 1px solid grey;
  border-radius: 5px;
  
}
.valsuccess{
    color: green;
}
</style>

<script>
import axios from 'axios'
axios.defaults.withCredentials = true
axios.defaults.baseURL = 'http://localhost:8000'

export default {
    data(){
        return{
            products:[]
        }
    },
    mounted(){
        this.getProducts()
    },
    methods:{
        getProducts(){
            axios.get('/api/products').then(response =>{
                this.products = response.data
            })
        }
    }
}
</script>