<template>
    <v-container class="pop">
        <v-layout row wrap mt-12>
            <v-flex md12 xs12 justify-center>
                <h1>Stock Market</h1>
            </v-flex>
            <v-flex md12 x12 justify-center mt-6>
            <v-simple-table>
                <template v-slot:default>
                    <thead>
                        <tr>
                            <th class="text-left">Date</th>
                            <th class="text-left">Season</th>
                            <th class="text-left">Value</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="stock in stocks" :key="stock.stock_id">
                            <td>{{ stock.month }}</td>
                            <td>{{ stock.season }} </td>
                            <td>{{stock.value_with_measurement}}</td>
                        </tr>
                    </tbody>
                    </template>
            </v-simple-table>
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
            stocks:[]
        }
    },
    mounted(){
        this.getStocks()
    },
    methods:{
        getStocks(){
            axios.get('api/stock').then(response =>{
                this.stocks = response.data
            })
        }
    }
}
</script>