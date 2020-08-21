<template>
    <v-container class="pop">
        <v-layout row wrap mt-12>
            <v-flex md12 xs12 justify-center>
                <h1>Stock Market</h1>
            </v-flex>

            <v-flex md12 xs12 class="text-right">
                <v-dialog v-model="addStockDialog" max-width="800">
                    <template v-slot:activator="{ on, attrs }">
                    <v-btn rounded class="success"  v-bind="attrs" v-on="on"> <v-icon size="17" class="pr-1">mdi-plus-thick</v-icon> Add Stock </v-btn>
                    </template>
                    <v-card class="rounded-xl">
                        
                        <v-card-title class="pt-5">Create Stock</v-card-title>

                        <v-container>
                            <v-row align="start">
                                
                                <v-card-text>
                                    <v-text-field outlined v-model="stock.product_name" label="Product Name" class="mt-3"></v-text-field>

                                    <v-row> 
                                        <v-col>
                                            <v-select label="Measurement" dense outlined :items="measurements" item-text="measurement" item-value="measurement_id" v-model="stock.measurement_id"></v-select>
                                        </v-col>
                                        <v-col>
                                            <v-select label="Season" dense outlined :items="seasons" item-text="season" item-value="season_id" v-model="stock.season_id"></v-select>
                                        </v-col>
                                    </v-row>

                                    <v-row>
                                        <v-col>
                                            <label for="">Year Start</label>
                                            <br/>
                                            <input type="date" v-model="stock.date_start" class="border form-control"/>
                                        </v-col>
                                        <v-col>
                                            <label for="">Year End</label>
                                            <br/>
                                            <input type="date" v-model="stock.date_end" class="border"/>
                                        </v-col>
                                    </v-row>
                                    <v-row>
                                        <v-col>
                                            <v-text-field outlined v-model="stock.value_start" label="From Value"></v-text-field>
                                        </v-col>
                                        <v-col>
                                            <v-text-field outlined v-model="stock.value_end" label="To Value" ></v-text-field>
                                        </v-col>
                                    </v-row>
                                    
                                </v-card-text>
                            </v-row>
                        </v-container>

                        <v-card-actions class="justify-center">
                            <v-btn class="primary mb-5" @click="createStock">Add Stock</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
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
.border {
  border: 1px solid grey;
  border-radius: 5px;
  padding: 10px;
}
</style>

<script>
import axios from 'axios'

axios.defaults.withCredentials = true
axios.defaults.baseURL = 'http://localhost:8000'

export default {
    data(){
        return{
            stocks:[],
            stock:{
                product_name:'',
                date_start:'',
                date_end:'',
                value_start:'',
                value_end:'',
                measurement_id:'',
                season_id:'',
                inserted_by:0
            },
            measurements:[],
            seasons:[],
            addStockDialog:false,
            user_id:0
        }
    },
    mounted(){
        this.getStocks(),
        this.getMeasurements(),
        this.getSeasons(),
        this.getUserData()
    },
    methods:{
        getUserData(){
            axios.get('/api/user').then(response => {
                this.user_id = response.data.user_id
            })
        },
        getStocks(){
            axios.get('api/stock').then(response =>{
                this.stocks = response.data
            })
        },
        getMeasurements(){
            axios.get('api/stock/measurements').then(response =>{
                this.measurements = response.data
            })
        },
        getSeasons(){
            axios.get('api/stock/seasons').then(response =>{
                this.seasons = response.data
            })
        },
        createStock(){
            axios.post('/api/stock', {

                product_name: this.stock.product_name,
                measurement_id: this.stock.measurement_id,
                season_id: this.stock.season_id,
                date_start: this.stock.date_start,
                date_end: this.stock.date_end,
                value_start: this.stock.value_start,
                value_end: this.stock.value_end,
                inserted_by: this.user_id
            }).then(response => {
                this.successAlert = 'Added Successfully'
                window.location.reload()
                // this.addProductDialog = false
            }).catch(err => {console.log(err)})
        },
    }
}
</script>