require('./bootstrap');
import Vue from 'vue';
import {BootstrapVue,BootstrapVueIcons,BadgePlugin  } from 'bootstrap-vue'
import App from './vue/app';
import router from "./vue/router";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-vue/dist/bootstrap-vue.css";



Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);
Vue.use(BadgePlugin );

const app = new Vue({
    el : '#app',
    router,
    render : h => h(App)
});
