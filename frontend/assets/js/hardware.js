function showPopup() {
    // Créer les éléments
    const popup = document.createElement('div');
    const message = document.createElement('p');
    const button = document.createElement('button');

    // Configurer le contenu et les styles
    message.textContent = 'Le RGB rajoute des FPS';
    button.textContent = 'OK';
    button.style.backgroundColor = 'green';
    button.style.color = 'white';
    button.style.border = 'none';
    button.style.padding = '10px 20px';
    button.style.cursor = 'pointer';

    // Styles pour la popup
    popup.style.position = 'fixed';
    popup.style.top = '50%';
    popup.style.left = '50%';
    popup.style.transform = 'translate(-50%, -50%)';
    popup.style.backgroundColor = 'white';
    popup.style.padding = '20px';
    popup.style.borderRadius = '5px';
    popup.style.boxShadow = '0 0 10px rgba(0,0,0,0.3)';
    popup.style.zIndex = '1000';

    // Ajouter les éléments à la popup
    popup.appendChild(message);
    popup.appendChild(button);

    // Ajouter la popup au body
    document.body.appendChild(popup);

    // Gérer le clic sur le bouton
    button.onclick = function() {
        document.body.removeChild(popup);
    };
}