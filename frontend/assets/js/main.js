const checkboxes = document.querySelectorAll('input[type="checkbox"]');
const reset_button = document.querySelector('#reset');
const container_produits = document.querySelector('.container-produits');
const ctaButton = document.querySelector('.cta-button');
const loadingElement = document.querySelector('#loading');
const api_url = 'http://localhost:3000/produits';

const cartButton = document.querySelector('#cart-button');
const cartModal = document.querySelector('#cart-modal');
const closeCartModal = document.querySelector('.close-cart-modal');
const cartItemsContainer = document.querySelector('#cart-items-container');
const addressInput = document.querySelector('#address-input');
const searchAddressButton = document.querySelector('#search-address');
const addressResults = document.querySelector('#address-results');
const checkoutButton = document.querySelector('#checkout-button');
const cartCount = document.querySelector('#cart-count');
const cartTotalAmount = document.querySelector('#cart-total-amount');

const loginButton = document.querySelector('#login');
const loginModal = document.querySelector('#login-modal');
const closeModalButton = loginModal.querySelector('.close-modal');
const loginTab = document.querySelector('#login-tab');
const registerTab = document.querySelector('#register-tab');
const loginForm = document.querySelector('#login-form');
const registerForm = document.querySelector('#register-form');

const filter_function = {
    absolute_filter: {
        rgb: {
            name: 'rgb',
            function: (element) => element.rgb === 1
        },
        intel: {
            name: 'intel',
            function: (element) => element.compatible_intel === 1
        },
        reduction: {
            name: 'reduction',
            function: (element) => element.reduction > 0
        },
        stock: {
            name: 'stock',
            function: (element) => element.quantite > 0
        }
    }
};

const map = {
    "processeur": "cpu",
    "carte mère": "carte_mere",
    "boîtier": "boitier",
    "alimentation": "alimentation",
    "mémoire": "ram",
    "stockage": "stockage",
    "watercooling": "watercooling",
    "clavier": "clavier",
    "souris": "souris",
    "tapis de souris": "tapis",
    "écran": "ecran"
};

let data = [];
let filteredData = [];
let produitsAffiches = 0;
const produitsParPage = 6;
let isLoading = false;
let currentModal = null;

function showToast(message, type = 'info') {
    const toast = document.createElement('div');
    toast.className = `toast ${type}`;
    toast.textContent = message;
    document.body.appendChild(toast);
    
    void toast.offsetWidth;
    
    toast.classList.add('show');
    
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(toast);
        }, 300);
    }, 2000);
}

function checkUserLoggedIn() {
    const userId = localStorage.getItem('user_id');
    const logoutButton = document.querySelector('#logout');
    if (userId) {
        loginButton.style.display = 'none';
        if (logoutButton) {
            logoutButton.style.display = 'inline-block';
        }
        cartButton.style.display = 'block';
        updateCartCount();
    } else {
        loginButton.style.display = 'inline-block';
        if (logoutButton) {
            logoutButton.style.display = 'none';
        }
        cartButton.style.display = 'none';
    }
}

function logoutUser() {
    localStorage.removeItem('user_id');
    checkUserLoggedIn();
    showToast('Vous êtes déconnecté.', 'info');
}

const logoutButton = document.querySelector('#logout');
if (logoutButton) {
    logoutButton.addEventListener('click', logoutUser);
}

function updateCartCount() {
    const favorites = JSON.parse(localStorage.getItem('favorite') || '[]');
    cartCount.textContent = favorites.length;
}

function displayCartItems() {
    const favorites = JSON.parse(localStorage.getItem('favorite') || '[]');
    cartItemsContainer.innerHTML = '';

    if (favorites.length === 0) {
        cartItemsContainer.innerHTML = '<p>Votre panier est vide</p>';
        cartTotalAmount.textContent = '0';
        return;
    }

    let total = 0;

    favorites.forEach((product, index) => {
        const price = product.reduction > 0
            ? Math.round(product.prix * (1 - product.reduction/100))
            : product.prix;

        const quantity = product.quantity || 1;
        total += price * quantity;

        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        cartItem.innerHTML = `
            <div class="cart-item-image">
                <img src="${api_url}/${product.id}/images/1" alt="${product.nom}" onerror="this.src='./assets/image/image.png'">
            </div>
            <div class="cart-item-info">
                <h4>${product.nom}</h4>
                <p>${price}€</p>
                <div class="quantity-controls">
                    <button class="decrease-quantity" data-index="${index}">-</button>
                    <span class="quantity">${quantity}</span>
                    <button class="increase-quantity" data-index="${index}">+</button>
                </div>
                <button class="remove-item" data-index="${index}">Supprimer</button>
            </div>
        `;
        cartItemsContainer.appendChild(cartItem);
    });

    cartTotalAmount.textContent = total;

    document.querySelectorAll('.remove-item').forEach(button => {
        button.addEventListener('click', function() {
            const index = this.getAttribute('data-index');
            removeFromCart(index);
        });
    });

    document.querySelectorAll('.increase-quantity').forEach(button => {
        button.addEventListener('click', function() {
            const index = this.getAttribute('data-index');
            updateQuantity(index, 1);
        });
    });

    document.querySelectorAll('.decrease-quantity').forEach(button => {
        button.addEventListener('click', function() {
            const index = this.getAttribute('data-index');
            updateQuantity(index, -1);
        });
    });
}

function removeFromCart(index) {
    let favorites = JSON.parse(localStorage.getItem('favorite') || '[]');
    favorites.splice(index, 1);
    localStorage.setItem('favorite', JSON.stringify(favorites));
    displayCartItems();
    updateCartCount();
}

function updateQuantity(index, change) {
    let favorites = JSON.parse(localStorage.getItem('favorite') || '[]');
    let quantity = favorites[index].quantity || 1;
    quantity += change;

    if (quantity < 1) {
        quantity = 1;
    }

    favorites[index].quantity = quantity;
    localStorage.setItem('favorite', JSON.stringify(favorites));
    displayCartItems();
}

async function searchAddress() {
    const query = addressInput.value.trim();
    if (query.length < 3) return;

    try {
        const response = await fetch(`https://api-adresse.data.gouv.fr/search/?q=${query}`);
        const data = await response.json();

        addressResults.innerHTML = '';
        data.features.forEach(feature => {
            const address = document.createElement('div');
            address.classList.add('address-result');
            address.innerHTML = `
                <input type="radio" name="selected-address" id="address-${feature.properties.id}" value="${feature.properties.id}">
                <label for="address-${feature.properties.id}">${feature.properties.label}</label>
            `;
            addressResults.appendChild(address);
        });
    } catch (error) {
        console.error('Error searching address:', error);
    }
}

async function checkout() {
    const userId = localStorage.getItem('user_id');
    if (!userId) {
        showToast('Veuillez vous connecter pour passer commande', 'warning');
        return;
    }

    const selectedAddress = document.querySelector('input[name="selected-address"]:checked');
    if (!selectedAddress) {
        showToast('Veuillez sélectionner une adresse de livraison', 'warning');
        return;
    }

    const favorites = JSON.parse(localStorage.getItem('favorite') || '[]');
    if (favorites.length === 0) {
        showToast('Votre panier est vide', 'info');
        return;
    }

    try {
        const order = {
            userId: JSON.parse(userId),
            products: favorites.map(product => ({
                id: product.id,
                quantity: product.quantity || 1
            })),
            address: selectedAddress.value
        };

        const response = await fetch('http://localhost:3000/checkout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(order)
        });

        if (response.ok) {
            showToast('Commande passée avec succès!', 'success');
            localStorage.removeItem('favorite');
            cartModal.classList.remove('active');
            document.body.style.overflow = 'auto';
        } else {
            throw new Error('Erreur lors de la commande');
        }
    } catch (error) {
        console.error('Error:', error);
        showToast('Une erreur est survenue lors de la commande', 'error');
    }
}

const priceSlider = document.querySelector('#price-slider');
const priceInput = document.querySelector('#price-input');

if (priceSlider && priceInput) {
    priceSlider.addEventListener('input', () => {
        priceInput.value = priceSlider.value;
        UpdateData();
    });

    priceInput.addEventListener('input', () => {
        let val = parseInt(priceInput.value);
        if (isNaN(val)) val = 0;
        if (val < parseInt(priceSlider.min)) val = parseInt(priceSlider.min);
        if (val > parseInt(priceSlider.max)) val = parseInt(priceSlider.max);
        priceInput.value = val;
        priceSlider.value = val;
        UpdateData();
    });
}

ctaButton.addEventListener('click', function (event) {
    event.preventDefault();
    container_produits.scrollIntoView({ behavior: 'smooth' });
});

checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', UpdateData);
});

reset_button.addEventListener('click', () => {
    checkboxes.forEach(checkbox => checkbox.checked = false);
    UpdateData();
});

function mapCategorie(apiCategorie) {
    return map[apiCategorie.toLowerCase()] || apiCategorie.toLowerCase();
}

async function Start() {
    try {
        loadingElement.style.display = 'block';
        const response = await fetch(api_url);
        if (!response.ok) {
            throw new Error("Erreur lors du chargement des données");
        }
        const jsonData = await response.json();
        data = jsonData.hardwares;
        filteredData = data;
        afficherProduitsParBatch(filteredData);
    } catch (error) {
        console.error(error);
        container_produits.innerHTML = '<p class="error">Erreur lors du chargement des produits</p>';
    } finally {
        loadingElement.style.display = 'none';
    }
}

function UpdateData() {
    container_produits.innerHTML = '';
    produitsAffiches = 0;
    isLoading = true;
    loadingElement.style.display = 'block';

    setTimeout(() => {
        let produits_selectionnes = [];
        let selectedAbsoluteFilters = [];
        let selectedCategories = [];
        let selectedBrands = [];

        checkboxes.forEach(checkbox => {
            if (checkbox.checked) {
                const name = checkbox.name;
                if (checkbox.closest('.categorie')) selectedCategories.push(name);
                if (checkbox.closest('.marque')) selectedBrands.push(name);
                if (filter_function.absolute_filter[name]) selectedAbsoluteFilters.push(filter_function.absolute_filter[name].function);
            }
        });

        data.forEach((element) => {
            const passAbsolute = selectedAbsoluteFilters.length === 0 || selectedAbsoluteFilters.every(f => f(element));
            const inCategory = selectedCategories.length === 0 || selectedCategories.includes(mapCategorie(element.categorie));
            const inBrand = selectedBrands.length === 0 || selectedBrands.includes(element.fabricant_nom);

            if (passAbsolute && inCategory && inBrand) {
                produits_selectionnes.push(element);
            }
        });

        if (produits_selectionnes.length === 0) {
            container_produits.innerHTML = '<p class="no-results">Aucun produit ne correspond à votre recherche</p>';
        } else {
            filteredData = produits_selectionnes;
            afficherProduitsParBatch(filteredData);
        }

        isLoading = false;
        loadingElement.style.display = 'none';
    }, 300);
}

function afficherProduitsParBatch(liste) {
    const fin = Math.min(produitsAffiches + produitsParPage, liste.length);
    const batch = liste.slice(produitsAffiches, fin);

    batch.forEach((element) => {
        const produit_div = document.createElement('div');
        produit_div.classList.add('produit');

        const fullDescription = [element.intro, element.description1, element.description2]
            .filter(desc => desc && desc.trim() !== '')
            .join(' ');

        const shouldTruncate = fullDescription.length > 150;
        const truncatedDesc = shouldTruncate 
            ? fullDescription.substring(0, 150) + '...' 
            : fullDescription;

        const prixAffichage = element.reduction > 0 ?
            `<span class="original-price">${element.prix}€</span>
             <span class="reduced-price">${Math.round(element.prix * (1 - element.reduction/100))}€</span>
             <span class="reduction">-${element.reduction}%</span>` : 
            `${element.prix}€`;

        produit_div.innerHTML = `
            <div class="produit-info">
                <img src="${api_url}/${element.id}/images/1" alt="${element.nom}" class="produit-image">
                <h3>${element.nom}</h3>
                <div class="description-container">
                    <p class="description">${truncatedDesc}</p>
                    ${shouldTruncate ? '<button class="read-more">Lire plus</button>' : ''}
                </div>
                <div class="price-container">${prixAffichage}</div>
                ${element.quantite > 0 ? 
                    '<p class="en-stock">En stock</p>' : 
                    '<p class="rupture">Rupture de stock</p>'}
                <button class="detail-button" data-id="${element.id}">Détails</button>
            </div>
        `;
        container_produits.appendChild(produit_div);

        if (shouldTruncate) {
            const readMoreBtn = produit_div.querySelector('.read-more');
            const description = produit_div.querySelector('.description');
            
            readMoreBtn.addEventListener('click', () => {
                if (description.textContent === truncatedDesc) {
                    description.textContent = fullDescription;
                    readMoreBtn.textContent = 'Lire moins';
                } else {
                    description.textContent = truncatedDesc;
                    readMoreBtn.textContent = 'Lire plus';
                }
            });
        }

        const produitImage = produit_div.querySelector('.produit-image');
        const secondImageSrc = `${api_url}/${element.id}/images/2`;

        produit_div.addEventListener('mouseenter', () => {
            produitImage.src = secondImageSrc;
        });

        produit_div.addEventListener('mouseleave', () => {
            produitImage.src = `${api_url}/${element.id}/images/1`;
        });
    });

    document.querySelectorAll('.detail-button').forEach(button => {
        button.addEventListener('click', function() {
            const productId = this.getAttribute('data-id');
            const product = data.find(p => p.id == productId);
            
            if (product) {
                showModal(product);
            }
        });
    });

    produitsAffiches += batch.length;
}

function showModal(product) {
    if (currentModal) {
        document.body.removeChild(currentModal);
        document.body.style.overflow = 'auto';
    }

    const fullDescription = [product.intro, product.description1, product.description2]
        .filter(desc => desc && desc.trim() !== '')
        .join(' ');

    const modalHTML = `
        <div class="modal-overlay active">
            <div class="modal-content">
                <span class="close-modal">&times;</span>
                <div class="modal-carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${api_url}/${product.id}/images/1" alt="${product.nom}" onerror="this.src='./assets/image/image.png'">
                        </div>
                        <div class="carousel-item">
                            <img src="${api_url}/${product.id}/images/2" alt="${product.nom}" onerror="this.src='./assets/image/image.png'">
                        </div>
                        <div class="carousel-item">
                            <img src="${api_url}/${product.id}/images/3" alt="${product.nom}" onerror="this.src='./assets/image/image.png'">
                        </div>
                    </div>
                    <button class="carousel-control prev">&#10094;</button>
                    <button class="carousel-control next">&#10095;</button>
                    <div class="carousel-buttons">
                        <button class="active" data-index="0"></button>
                        <button data-index="1"></button>
                        <button data-index="2"></button>
                    </div>
                </div>
                <div class="modal-info">
                    <h3>${product.nom}</h3>
                    <p class="modal-fabricant"><strong>Fabricant:</strong> ${product.fabricant_nom}</p>
                    <p class="modal-categorie"><strong>Catégorie:</strong> ${product.categorie}</p>
                    <p class="modal-description">${fullDescription}</p>
                    <div class="modal-price-container">
                        ${product.reduction > 0 ?
                            `<p class="modal-price">
                                <span class="original-price">${product.prix}€</span>
                                <span class="reduced-price">${Math.round(product.prix * (1 - product.reduction/100))}€</span>
                                <span class="reduction">-${product.reduction}%</span>
                            </p>` :
                            `<p class="modal-price">${product.prix}€</p>`}
                    </div>
                    ${product.quantite > 0 ?
                        '<p class="en-stock"><strong>Disponibilité:</strong> En stock</p>' :
                        '<p class="rupture"><strong>Disponibilité:</strong> Rupture de stock</p>'}
                    ${product.rgb ? '<p class="modal-feature"><strong>RGB:</strong> Oui</p>' : ''}
                    ${product.compatible_intel ? '<p class="modal-feature"><strong>Compatible Intel:</strong> Oui</p>' : ''}
                </div>
                <div class="modal-favorite">
                    <button type="button" id="favorite">Ajouter aux favoris</button>
                </div>
            </div>
        </div>
    `;

    document.body.insertAdjacentHTML('beforeend', modalHTML);
    document.body.style.overflow = 'hidden';

    currentModal = document.querySelector('.modal-overlay.active');

    initCarousel(currentModal.querySelector('.modal-carousel'));

    const closeModal = () => {
        document.body.removeChild(currentModal);
        document.body.style.overflow = 'auto';
        currentModal = null;
    };

    currentModal.querySelector('.close-modal').addEventListener('click', closeModal);
    currentModal.addEventListener('click', (e) => {
        if (e.target === currentModal) {
            closeModal();
        }
    });

    currentModal.querySelector('.modal-content').addEventListener('click', (e) => {
        e.stopPropagation();
    });

    currentModal.querySelector('#favorite').addEventListener('click', () => {
        const userId = localStorage.getItem('user_id');
        if (!userId) {
            showToast('Veuillez vous connecter pour ajouter des produits au panier.', 'warning');
            return;
        }
        AddToFavorite(product);
        closeModal();
    });
}

function initCarousel(carouselElement) {
    const items = carouselElement.querySelectorAll('.carousel-item');
    const buttons = carouselElement.querySelectorAll('.carousel-buttons button');
    const prevBtn = carouselElement.querySelector('.prev');
    const nextBtn = carouselElement.querySelector('.next');

    let currentIndex = 0;
    const totalItems = items.length;

    items.forEach((item, index) => {
        item.style.display = index === 0 ? 'block' : 'none';
    });

    function updateCarousel() {
        items.forEach(item => item.style.display = 'none');
        
        items[currentIndex].style.display = 'block';
        
        buttons.forEach((button, index) => {
            button.classList.toggle('active', index === currentIndex);
        });
    }

    function goToPrev() {
        currentIndex = (currentIndex - 1 + totalItems) % totalItems;
        updateCarousel();
    }

    function goToNext() {
        currentIndex = (currentIndex + 1) % totalItems;
        updateCarousel();
    }

    function goToIndex(index) {
        currentIndex = index;
        updateCarousel();
    }

    prevBtn.addEventListener('click', goToPrev);
    nextBtn.addEventListener('click', goToNext);

    buttons.forEach((button, index) => {
        button.addEventListener('click', () => goToIndex(index));
    });

    updateCarousel();
}

function AddToFavorite(product) {
    let favorites = localStorage.getItem('favorite');
    favorites = favorites ? JSON.parse(favorites) : [];

    const alreadyExists = favorites.some(fav => fav.id === product.id);

    if (!alreadyExists) {
        favorites.push(product);
        localStorage.setItem('favorite', JSON.stringify(favorites));
        updateCartCount();
        showToast('Produit ajouté aux favoris!', 'success');
    } else {
        showToast('Ce produit est déjà dans vos favoris!', 'warning');
    }
}

async function loginUser(event) {
    event.preventDefault();
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-password').value;

    try {
        const response = await fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, password })
        });

        if (!response.ok) {
            const errorText = await response.text();
            throw new Error(`Erreur serveur: ${response.status} - ${errorText}`);
        }

        const data = await response.json();
        localStorage.setItem("user_id", JSON.stringify(data.userId.id))
        console.log('Connexion réussie:', data);
        loginModal.classList.remove('active');
        document.body.style.overflow = 'auto';
        checkUserLoggedIn();
    } catch (err) {
        console.error('Erreur de connexion :', err.message);
        showToast('Identifiants incorrects', 'error');
    }
}

async function registerUser(event) {
    event.preventDefault();
    const email = document.querySelector('#register-email').value;
    const firstName = document.querySelector('#register-firstName').value;
    const lastname = document.querySelector('#register-lastname').value;
    const password = document.querySelector('#register-password').value;
    const confirmPassword = document.querySelector('#register-confirm-password').value;

    if (password !== confirmPassword) {
        showToast("Les mots de passe ne correspondent pas.", 'error');
        return;
    }

    try {
        const response = await fetch('http://localhost:3000/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ email, firstName, lastname, password })
        });

        const data = await response.json();
        localStorage.setItem("user_id", JSON.stringify(data.userId.id))
        console.log(data);
        loginModal.classList.remove('active');
        document.body.style.overflow = 'auto';
        checkUserLoggedIn();
    } catch (err) {
        console.error('Erreur d\'inscription :', err);
        showToast('Erreur lors de l\'inscription', 'error');
    }
}

loginButton.addEventListener('click', () => {
    loginModal.classList.add('active');
    document.body.style.overflow = 'hidden';
});

closeModalButton.addEventListener('click', () => {
    loginModal.classList.remove('active');
    document.body.style.overflow = 'auto';
});

loginTab.addEventListener('click', () => {
    loginTab.classList.add('active');
    registerTab.classList.remove('active');
    loginForm.style.display = 'block';
    registerForm.style.display = 'none';
});

registerTab.addEventListener('click', () => {
    registerTab.classList.add('active');
    loginTab.classList.remove('active');
    loginForm.style.display = 'none';
    registerForm.style.display = 'block';
});

loginModal.addEventListener('click', (e) => {
    if (e.target === loginModal) {
        loginModal.classList.remove('active');
        document.body.style.overflow = 'auto';
    }
});

cartButton.addEventListener('click', () => {
    cartModal.classList.add('active');
    displayCartItems();
    document.body.style.overflow = 'hidden';
});

closeCartModal.addEventListener('click', () => {
    cartModal.classList.remove('active');
    document.body.style.overflow = 'auto';
});

searchAddressButton.addEventListener('click', searchAddress);
checkoutButton.addEventListener('click', checkout);

document.getElementById('loginForm').addEventListener('submit', loginUser);
document.getElementById('registerForm').addEventListener('submit', registerUser);

window.addEventListener('scroll', () => {
    if (isLoading) return;

    if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 500) {
        afficherProduitsParBatch(filteredData);
    }
});

const tncModal = document.getElementById('tnc-modal');
const closeTncModalBtn = document.querySelector('.close-tnc-modal');
const acceptTncBtn = document.getElementById('accept-tnc');

function showTncModal() {
    tncModal.classList.add('active');
    document.body.style.overflow = 'hidden';
}

function closeTncModal() {
    tncModal.classList.remove('active');
    document.body.style.overflow = 'auto';
}

window.addEventListener('load', () => {
    showTncModal();
});

closeTncModalBtn.addEventListener('click', () => {
    closeTncModal();
});

acceptTncBtn.addEventListener('click', () => {
    closeTncModal();
});

Start();
checkUserLoggedIn();