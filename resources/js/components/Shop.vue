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
                            <a class="nav-link" href="#" @click="fetchCars(brand)">{{ brand }}</a>
                        </li>
                    </ul>
                </div>
                <!-- shopping cart gedeelte -->
                <div class="ms-auto">
                    <button class="btn btn-light" @click="toggleCart"> 🛒 <span class="badge bg-danger">{{ cart.length }}</span></button>
                </div>
            </div>
        </nav>
        <!-- bovenstuk met banner -->
        <div class="hero-section" :style="{ backgroundImage: `url(${getBrandImage(selectedBrand)})` }">
            <div class="overlay">
                <h1 class="display-3 fw-bold text-white">{{ selectedBrand }}</h1>
                <!-- <p class="lead text-white">Ontdek de beste modellen en prijzen.</p> -->
            </div>
        </div>
        <!-- auto lijst -->
        <div class="container ">
            <div class="table-container">
                <h2 class="text-center fw-bold">Modellen</h2>
                <p class="text-center text-muted">Bekijk de selectie van {{ selectedBrand }}'s en ontdek de beste modellen en prijzen.</p>
                <div class="table-responsive">
                    <table class="table table-hover table-bordered shadow-sm mt-3" v-if="cars.length">
                        <thead class="table-dark">
                            <tr>
                                <th @click="sortTable('model')" class="sortable">Model</th>
                                <th @click="sortTable('year')" class="sortable">Bouwjaar</th>
                                <th @click="sortTable('color')" class="sortable">Kleur</th>
                                <th @click="sortTable('price')" class="sortable">Prijs</th>
                                <th class="order">Bestellen</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="car in sortedCars" :key="car.id">
                                <td>{{ car.model }}</td>
                                <td>{{ car.year }}</td>
                                <td>{{ car.color }}</td>
                                <td class="text-success fw-bold"> € {{ formatPrice(car.price) }} </td>
                                <td>
                                    <button type="button" class="btn btn-outline-secondary" :disabled="isInCart(car)" @click="addToShoppingCart(car)"> 🛒 </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p v-else class="text-center mt-4">Geen auto's beschikbaar voor het merk {{ selectedBrand }}.</p>
                </div>
            </div>
        </div>
        <!-- winkel wagen modal -->
        <div class="cart-modal" :class="{ 'open': cartOpen }">
            <div class="cart-header">
                <h4>🛒 Winkelwagen</h4>
                <button class="btn-close" @click="toggleCart"></button>
            </div>
            <div class="cart-body">
                <p v-if="cart.length === 0" class="text-center">Je winkelwagen is leeg.</p>
                <ul v-else class="list-group">
                    <li v-for="item in cart" :key="item.id" class="list-group-item d-flex flex-column">
                        <span class="fw-bold">{{ item.brand }}</span> <!-- Merk bovenaan -->
                        <span>{{ item.name }}</span> <!-- Model op tweede regel -->
                        <span class="text-success fw-bold">€ {{ formatPrice(item.price) }}</span> <!-- Prijs onderaan -->
                        <button class="btn btn-sm align-self-end" @click="removeFromCart(item.id)">❌</button>
                    </li>
                </ul>
            </div>
            <div class="cart-footer">
                <h4>Totaal:</h4>
                <button class="btn-close" @click="toggleCart"></button>
            </div>
        </div>
    </div>
</template>
<script>
import axios from "axios";

export default {
    name: "Shop",
    data() {
        return {
            selectedBrand: "Bmw", // standaard geselecteerd bij laden pagina
            cars: [], // array voor de auto's
            brands: [], // array voor de auto merken
            cart: [], // array voor de winkelwagen
            cartOpen: false, // winkelwagen open/dicht
            sortColumn: "model", // standaard sorteerkolom
            sortOrder: "asc", // standaard sorteervolgorde
        };
    },
    computed: {
        // sorteert de lijst met auto's op basis van de geselecteerde kolom en volgorde
        sortedCars() {
            return [...this.cars].sort((a, b) => {
                let modifier = this.sortOrder === "asc" ? 1 : -1;
                if (this.sortColumn === "year" || this.sortColumn === "price") {
                    return (a[this.sortColumn] - b[this.sortColumn]) * modifier;
                } else {
                    return a[this.sortColumn].localeCompare(b[this.sortColumn]) * modifier;
                }
            });
        }
    },
    methods: {
        // haalt auto's op van de server op basis van het geselecteerde merk
        fetchCars(brand) {
            console.log(`Autos ophalen voor merk: ${brand}`);
            this.selectedBrand = brand;
            localStorage.setItem("selectedBrand", brand);
            axios.get(`/cars?brand=${brand}&_=${new Date().getTime()}`)
                .then(response => {
                    console.log("API Response:", response.data);
                    this.cars = response.data;
                })
                .catch(error => {
                    console.error("Fout met het ophalen van de auto's:", error);
                });
        },

        fetchBrands() {
            axios.get("/api/brands")
                .then(response => {
                    console.log("API Response:", response.data);
                    if (Array.isArray(response.data)) {
                        this.brands = response.data; // Correcte lijst opslaan
                    } else {
                        console.error("Ongeldig API-formaat:", response.data);
                    }
                })
                .catch(error => {
                    console.error("Fout met ophalen van merken:", error);
                });
        },

        // sorteert de tabel bij klikken op een kolomnaam
        sortTable(column) {
            if (this.sortColumn === column) {
                this.sortOrder = this.sortOrder === "asc" ? "desc" : "asc";
            } else {
                this.sortColumn = column;
                this.sortOrder = "asc";
            }
        },

        // retourneert de juiste afbeelding op basis van de naam van het merk
        getBrandImage(brand) {
            const imagePath = `/images/${brand.toLowerCase()}.jpg`;
            return this.imageExists(imagePath) ? imagePath : "/images/default.jpg";
        },

        imageExists(imageUrl) {
            const img = new Image();
            img.src = imageUrl;
            return img.complete || img.width > 0;
        },

        // voegt een auto toe aan de winkelwagen als deze nog niet aanwezig is
        addToShoppingCart(car) {
            if (!this.isInCart(car)) {
                this.cart = [...this.cart, {
                    id: car.id,
                    brand: car.brand,
                    name: car.model,
                    price: Number(car.price) || 0,
                }];
                this.saveCart(); // winkelwagen opslaan in localstorage
                this.cartOpen = true; // winkelwagen openen na toevoegen
            }
        },

        // verwijdert een auto uit de winkelwagen
        removeFromCart(carId) {
            this.cart = this.cart.filter(item => item.id !== carId);
            this.saveCart(); // winkelwagen opslaan na verwijderen
        },

        // controleert of een auto al in de winkelwagen zit
        isInCart(car) {
            return this.cart.some(item => item.id === car.id);
        },

        // opent of sluit de winkelwagen
        toggleCart() {
            this.cartOpen = !this.cartOpen;
            if (this.cartOpen) {
                document.body.style.overflow = "hidden"; // pagina scroll blokkeren
            } else {
                document.body.style.overflow = ""; // scroll weer inschakelen
            }
        },

        // slaat de winkelwagen op in localStorage
        saveCart() {
            localStorage.setItem("cart", JSON.stringify(this.cart));
        },

        // formatteert de prijs met duizendtalscheiding en twee decimalen
        formatPrice(price) {
            if (price === null || price === undefined) return "0.00";
            return Number(price).toLocaleString("nl-NL", {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2,
            });
        },
    },

    mounted() {
        // laadt de winkelwagen uit localStorage als deze bestaat
        const savedCart = localStorage.getItem("cart");
        if (savedCart) {
            this.cart = JSON.parse(savedCart);
        }

        // laadt het laatst geselecteerde merk of gebruikt "Tesla" als standaard
        const storedBrand = localStorage.getItem("selectedBrand") || "Tesla";
        this.selectedBrand = storedBrand;
        this.fetchBrands();
        this.fetchCars(this.selectedBrand);
    }
};
</script>

