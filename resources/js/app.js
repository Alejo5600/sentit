require('./bootstrap');
import Vue from 'vue';
import {BootstrapVue,BootstrapVueIcons,BadgePlugin  } from 'bootstrap-vue'
import Toast from "vue-toastification";
import { LMap, LTileLayer, LMarker } from 'vue2-leaflet';
import App from './vue/app';
import router from "./vue/router";
import 'leaflet/dist/leaflet.css';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import "vue-toastification/dist/index.css";


delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png'),
    iconUrl: require('leaflet/dist/images/marker-icon.png'),
    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
});

const toastOptions = {
    // You can set your default options here
};




export const bus = new Vue();


Vue.use(BootstrapVue);
Vue.use(BootstrapVueIcons);
Vue.use(BadgePlugin );
Vue.use(Toast, toastOptions);

Vue.component('l-map', LMap);
Vue.component('l-tile-layer', LTileLayer);
Vue.component('l-marker', LMarker);

const app = new Vue({
    el : '#app',
    router,
    render : h => h(App)
});
