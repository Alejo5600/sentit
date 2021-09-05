require('./bootstrap');
import Vue from 'vue';
import {BootstrapVue,BootstrapVueIcons,BadgePlugin  } from 'bootstrap-vue'
import Toast from "vue-toastification";
import App from './vue/app';
import router from "./vue/router";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import "vue-toastification/dist/index.css";
const toastOptions = {
    // You can set your default options here
};




export const bus = new Vue();


Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);
Vue.use(BadgePlugin );
Vue.use(Toast, toastOptions);

const app = new Vue({
    el : '#app',
    router,
    render : h => h(App)
});
