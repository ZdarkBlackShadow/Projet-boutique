document.addEventListener('DOMContentLoaded', function() {
    const ctaButton = document.querySelector('.cta-button');
    
    ctaButton.addEventListener('mouseover', function() {
        this.style.transform = 'scale(1.1)';
    });

    ctaButton.addEventListener('mouseout', function() {
        this.style.transform = 'scale(1)';
    });

    const productCards = document.querySelectorAll('.product-card');
    
    productCards.forEach(card => {
        card.addEventListener('click', function() {
            alert('Vous avez cliqué sur ' + this.querySelector('h3').textContent);
        });
    });
});