const backendUrl = 'http://localhost:3000';
const ApiUrl = 'https://api.geoapify.com/v1/geocode/search';
const ApiKey = 'f3eb0e623a3a45fc800127c295ad751c';

const container = document.querySelector('#container');

let resultAdress = '';
let backendData = '';
let dataToSend = '';

async function getAdressDataFromTexte(text) {
    /**
     * Fonction qui fait une requête à l'API de livraison
     * pour récupperer les résultat de la recherche
     */
    var requestOptions = {
        method: 'GET',
    };
    const response = await fetch(`${ApiUrl}?text=${text}&apiKey=${ApiKey}`, requestOptions);

    fetchError(response);

    resultAdress = await response.json();
}

async function getAllHadware() {
    /**
     * Fonction qui récupere les données de tout les hardawres
     */
    const response = await fetch(`${backendUrl}/hardwares`);

    fetchError(response);

    backendData = await response.json();
}


function fetchError(response) {
    /**
     * Fonction qui va gérer les erreurs lié aux fetch
     */
    if (!response.ok) {
        console.log(response.status)
        throw console.error(`Status : ${response.status}\nText : ${response.statusText}`);
    }
}

function SortByPrice(highToLow) {
    /**
     * Fonction qui va trier les données par trier
     * par prix par ordre croissant ou décroissant
     * highToLow est bool
     * */
}

function SliceByCategorie(categories) {
    /**
     * Fonction qui va trier par catégorie
     * le paramêtre categories est une liste 
     * contenant les catégorie que l'utilisateur veut garder
     */
}

function SortByRGB(RGB) {
    /**
     * Fonction qui va trier par si les 
     * produits ont du RGB ou non
     * le paramêtre RGB est un bool
     */
}

function SliceByCompanie(companies) {
    /**
     * Fonction qui va trier par marque
     * le paramêtre companies est une liste 
     * contenant les marque que l'utilisateur veut garder
     */
}

function SortByIntel(intel) {
    /**
     * Fonction qui sortier les composant
     * compatible avec intel ou amd
     * le paramêtre intel est un bool
     */
}

function fillContainer() {
    /**
     * Fonction qui remplie tout les donnée dans le container
     */
}

function Init() {
    /**
     * Fonction initialise les données
     * puis la page
     */
}