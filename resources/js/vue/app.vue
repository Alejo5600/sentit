<template>
    <div>
        <main_nav></main_nav>
        <b-container>
            <!-- Dynamic view based on routing system here -->

            <router-view></router-view>
        </b-container>

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
         if(this.showLogin){
             this.$router.push({name : "login"})
         }
     }

 }
</script>
