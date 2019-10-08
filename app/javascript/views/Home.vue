<template>
  <div class='back-image' style="background-image: url('https://instagram.fmid1-2.fna.fbcdn.net/vp/0f28401de0233300ee12b062c17d9d70/5E29246D/t51.2885-15/e35/s1080x1080/70025765_2499835643586876_4257669694785917025_n.jpg?_nc_ht=instagram.fmid1-2.fna.fbcdn.net&_nc_cat=100');" >
  <div class="container"   >
      <div class="row" style=" margin-top: 95px;">
        <div class="col-md-12">
          
        <b-carousel
        id="carousel-1"
        v-model="slide"
        :interval="4000"
        controls
        indicators 
        style="text-shadow: 1px 1px 2px #333;"
        @sliding-start="onSlideStart"
        @sliding-end="onSlideEnd"
        > <!-- Slides with img slot -->
        <!-- Note the classes .d-block and .img-fluid to prevent browser default image alignment -->
        <b-carousel-slide   v-for="carrousel in carrousels"  v-bind:key="carrousel.id" v-html="carrousel.description"> 
        </b-carousel-slide> 
      </b-carousel>
        </div> 

    </div>
    </div>
    <div class="container">
       <br/>
    </div> 
  <div class="container" style="background-color: #fff" > 
   <div class="row">
     <div class="col-md-12">
       <br/>
       <h4 class="text-center" >Nuestros Servicios, bienvenido a Spa Genérico, el mejor Spa en Mérida para relajarte de lunes a viernes <b-badge> </b-badge></h4>

       <div class="row">
        <b-col md="4"   v-for="item in items" v-bind:key="item.id"> 
          <b-card class="mb-2" > 

           <b-card-body>
            <b-card-title>{{item.title}}</b-card-title>
            <b-card-text> </b-card-text>
            <!--  <b-btn color="primary">Button</b-btn>  -->
          </b-card-body>
           <div v-html="item.description" class="card-img-top"></div>
        </b-card>
       </b-col>
      </div> 
    </div>
   </div> 
  </div> 

  <div class="container">
     <br/>
  </div> 
    
  <div class="container" style="background-color: #fff" >
    <div class="row">
      <div class="col-md-12">  
        <br>
        <h4  class="text-center" >Haz tu reservación aqui! <b-badge> Nuevo! </b-badge></h4>
        <br>
        <form>
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <br>

      </div>
    </div> 
  </div>
     

    <div class="container">
      <br/>
    </div> 

  </div>
</template>

<script>
  export default {
    computed: {
      isLoggedIn: function() {
        return this.$store.getters.isLoggedIn;
      }
    },
    data() {
      return {
        carrousels: [],
        numberOfcarrousels:0,
        items: [],
        numberOfcards:0,
        slide: 0,
        sliding: null,
        dismissSecs: 10,
        dismissCountDown: 0,
        showDismissibleAlert: false
      }
    },
    methods: {
      getCarrousels(){

        this.$store
        .dispatch("getCarrousels" )
        .then((data) => {  
          this.carrousels = data.carrousels
          this.numberOfcarrousels= data.total_count;
        });

      },
      getCards(){

        this.$store
        .dispatch("getCards" )
        .then((data) => {  
          this.items = data.cards
          this.numberOfcards= data.total_count;
        });

      },
      onSlideStart(slide) {
        this.sliding = true
      },
      onSlideEnd(slide) {
        this.sliding = false
      },
      countDownChanged(dismissCountDown) {
        this.dismissCountDown = dismissCountDown
      },
      showAlert() {
        this.dismissCountDown = this.dismissSecs
      } 
    },

    mounted() {
      this.getCards();
      this.getCarrousels();
    },
  }
</script> 

