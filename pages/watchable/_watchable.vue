<template>
  <div>

    <v-row justify="center" align="center">
      <div style="width:100%;">
      <h2>{{title}}</h2>
      <br>
      <p>{{detail}}</p>

      </div>
      <v-col cols="12" sm="8" md="6" v-for= "(data, index) in json_data" :key="index">
        <v-card class="logo py-4 d-flex justify-space-between" :color = "data.color" style="height:100%;">
          <div class="d-flex flex-no-wrap justify-space-between" style="width:100%;">
            <v-avatar
                class="ma-3"
                size="125"
                tile
              >
                <v-img :src="data.poster_path"></v-img>
              </v-avatar>
            <div style="width:100%;" >
              <v-card-title style="font-size:1rem;"  class="text-left">
                {{index+1}} : {{data.title}}
              </v-card-title>

              <v-card-subtitle v-text="data.id">

              </v-card-subtitle>
              <div style="display:flex; justify-content:flex-end;">
              <v-card-actions>
                <v-spacer />
                <v-btn
                  color="#F5F5F5"
                  depressed
                  elevation="9"
                  fab
                  large
                  text
                  @click="toURL(data)"
                >
                Visit
                </v-btn>
              </v-card-actions>
              </div>

            </div>

          </div>

            </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
const date = new Date();
let year = date.getUTCFullYear();
let month = date.getUTCMonth() + 1; // 1 ~ 12
let day = date.getUTCDate();
var query_lte = ''
var query_gte = ''


if(day.toString().length == 1){ // 一桁なら
      day = '0' + day
}
if (month.toString().length == 1){ // 一桁なら
  month = '0' + month
  
}
query_lte = year + "-" + month + "-" + day

if (month - 1 < 1){ // 年が変わるなら
  year = year - 1
  month = 12 - (month - 1)
}
query_gte = year + "-" + month + "-" + day


const axios = require('axios')
const home = 'https://api.themoviedb.org/3'
const endpoint = '/discover/movie'
const query_1 = '&primary_release_date.gte=' + query_gte +'&primary_release_date.lte='+ query_lte +'&with_release_type=2%7C3' // １ヶ月前〜今日
const query_2 = '&sort_by=popularity.desc'
const key = '?api_key=874b2c31cd678740afe326baa8408862'
const language = '&region=JP|US&language=ja-JA&page=1'
const url = home + endpoint + key + language + query_1 + query_2

export default {
  data () {
    const date = new Date();
    const year = date.getUTCFullYear();
    const month = date.getUTCMonth() + 1;
    return {
      title : "🎞　絶賛上映中　🎞",
      detail: "(" + year + "/" + month + "現在)(限定公開も含む)",
      row_1: 'Popular',
      json_data: {},
      json_image: {}
    }
  },
  created () {
    axios.get(url).then((res) => {
        console.log(res)
        this.json_data = res.data.results
        console.log(this.json_data[0]);
        for (let i = 0; i < this.json_data.length; i++) {
          this.json_data[i].poster_path = "https://image.tmdb.org/t/p/w500" + this.json_data[i].poster_path
            let a = "https://www.themoviedb.org/movie/" + this.json_data[i].id
          this.$set(this.json_data[i], 'url', a)
           if (i % 2 === 0) {
            this.$set(this.json_data[i], 'color', '#7986CB')
          }else{
            this.$set(this.json_data[i], 'color', '#B0BEC5')
          }
        }
        console.log(this.json_data[0]);
      }).catch((error) => {
        console.log(error)
        this.message = 'Sorry, we could\'t fetch the data.'
        this.json_data = {}
      })
 
  },
  methods: {
     toURL(data){
      window.location.href = data.url;
    },
    findData () {
      axios.get(url).then((res) => {
        console.log(res)
        this.json_data = res.data
      }).catch((error) => {
        console.log(error)
        this.message = 'Sorry, we could\'t fetch the data.'
        this.json_data = {}
      })
    }
  }
}
</script>

<style>
.popular{
  color: white;
}
</style>

