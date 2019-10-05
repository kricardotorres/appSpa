<template>
  <div id="app" style="background-color: #fff5c8" >
   
    <b-navbar toggleable="lg" type="dark" variant="info2" fixed="top" expand="true">
      <b-navbar-brand class="link-white info2" > <router-link to="/">                                                  
        <img src="/logobleufooter-300-201.png?70bc32&70bc32" width="55" height="35" alt=""></router-link></b-navbar-brand>
        <b-navbar-toggle class='pull-rigth'  target="nav-collapse"></b-navbar-toggle>

        <b-collapse class='align-right'   id="nav-collapse" is-nav>
          <b-navbar-nav class="link-white" >
            <b-nav-item ><router-link to="/reservations">Reservar</router-link></b-nav-item>
            <b-nav-item ><router-link to="/about"> Nosotros</router-link></b-nav-item>
            
          </b-navbar-nav>

          
        </b-collapse>
        <b-navbar-brand >     <a class=" nav-link  " @click="logout"  v-if="isLoggedIn">
         <font-awesome-icon icon="lock"  /></a> 
         
         
       </b-navbar-brand>

       
       

     </b-navbar>
     
     
     <div class=" "   >
      <router-view/>
    </div>
    <footer class="fluid-container">  
      <div class="footer-copyright text-center py-3">© 2018 Copyright:
       
      </div>
    </footer>
    
  </div>
</template>

<style >
    .card-img-top img {

    width: 100%;  
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);

}
</style>
<script>
  export default {
    computed: {
      isLoggedIn: function() {
        return this.$store.getters.isLoggedIn;
      }
    },
    methods: {
      logout: function() {
        this.$store.dispatch("sign_out").then(() => {
        });
        
        this.$router.push("/login");
      }
    }
  };
</script>
 
 