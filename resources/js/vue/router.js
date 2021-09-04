import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './app'
import Login from './Components/login';
import Header from './Components/template/header'
Vue.use(VueRouter)

const router = new VueRouter({
    mode : 'history',
    routes : [
        {
            path : '/',
            name : 'home',
            component : App
        },
        {
            path : '/header',
            name : 'header',
            component : Header
        },
        {
            path : '/login',
            name : 'login',
            component : Login
        }
    ]
});

export default router;
