import { createApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "./components/App.vue";
import Home from "./components/Home.vue";
import Shop from "./components/Shop.vue";
import "../css/app.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";


// Define routes
const routes = [
    { path: "/", component: Home },
    { path: "/shop", component: Shop },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

const app = createApp(App);
app.use(router);
app.mount("#app");

console.log("Vue App Mounted.");
