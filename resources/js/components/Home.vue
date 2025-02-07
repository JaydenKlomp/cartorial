<template>
    <div>
        <!-- nav met de auto merken -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="/">
                    <span>Cartorial</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-3">
                        <li class="nav-item" v-for="brand in brands" :key="brand">
                            <a class="nav-link" href="#" @click="goToShop(brand)">{{ brand }}</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- bovenste banner gedeelte -->
        <div class="hero-section hero-home">
            <div class="overlay">
                <h1 class="display-3 fw-bold text-white">Welkom bij Cartorial</h1>
                <p class="lead text-white">Ontdek onze selectie van premium auto's</p>
                <router-link to="/shop">
                    <button class="btn btn-dark btn-lg mt-3">Bekijk de Collectie</button>
                </router-link>
            </div>
        </div>
        <!-- informatie gedeelte -->
        <div class="container mt-5 text-center">
            <h2 class="fw-bold">Waarom Cartorial?</h2>
            <p class="text-muted"> Bij Cartorial bieden we een uitgebreide collectie van premium voertuigen van bekende merken zoals Tesla, BMW, Mercedes, Toyota en Audi. </p>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="info-box">
                        <h4>✅ Ruime Selectie</h4>
                        <p>Keuze uit de nieuwste modellen en klassiekers.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box">
                        <h4>🔧 Uitstekende Service</h4>
                        <p>Professionele ondersteuning en onderhoudsdiensten.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box">
                        <h4>💰 Beste Prijzen</h4>
                        <p>Altijd uitstekende prijzen en topaanbiedingen.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="emptyspace"></div>
    </div>
</template>
<script>
import axios from "axios";

export default {
    name: "Home",
    data() {
        return {
            brands: [],
        };
    },
    methods: {
        goToShop(brand) {
            // slaat het geselecteerde merk op en navigeert naar de shop
            localStorage.setItem("selectedBrand", brand);
            this.$router.replace({ path: "/shop" });
        },

        fetchBrands() {
            axios.get("/api/brands")
                .then(response => {
                    console.log("API Response:", response.data);
                    if (Array.isArray(response.data)) {
                        this.brands = response.data.sort(); // a > z sorteren
                    } else {
                        console.error("Ongeldige merken data:", response.data);
                    }
                })
                .catch(error => {
                    console.error("Fout met het ophalen van de merken:", error);
                });
        },
    },

    mounted() {
        this.fetchBrands(); // ophalen van de automerken bij het laden van de pagina
    }
};
</script>
