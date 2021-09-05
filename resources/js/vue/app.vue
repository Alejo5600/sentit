<template>
    <div>
        <main_nav v-show="showNav" :user="username"></main_nav>
            <!-- Dynamic view based on routing system here -->
            <router-view></router-view>


    </div>

</template>

<script>
import main_nav from './Components/template/main_nav';

 export default {
     data() {
         return {
             showLogin : false
         }
     },
    components : {
        main_nav
    },
     mounted () {
         if(this.$route.name == 'root'){
             this.$router.push({name : "login"})
         }
     },
     computed: {
         showNav() {
             return this.$route.name != 'login';
         },
         username(){
             let usr = localStorage.getItem('user');
             if(!usr){
                 return 'user';
             }
             usr = JSON.parse(usr);
             return usr.name +' '+usr.surname
         }

     }

 }
</script>
