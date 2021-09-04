require('./bootstrap');
import Vue from 'vue';
import BootstrapVue from 'bootstrap-vue'
import App from './vue/app';
import router from "./vue/router";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-vue/dist/bootstrap-vue.css";



Vue.use(BootstrapVue);

const app = new Vue({
    el : '#app',
    router,
    render : h => h(App)
});
