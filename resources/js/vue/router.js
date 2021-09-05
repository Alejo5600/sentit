import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './app'
import Login from './Components/login';
import Shipments from "./Components/shipments";

Vue.use(VueRouter)

const router = new VueRouter({
    mode : 'history',
    routes : [
        {
            path : '/',
            name : 'root',
            component : App
        },
        {
            path : '/shipments',
            name : 'shipments',
            component : Shipments
        },
        {
            path : '/login',
            name : 'login',
            component : Login
        }
    ]
});

export default router;
