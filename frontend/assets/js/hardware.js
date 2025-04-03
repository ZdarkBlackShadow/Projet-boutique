function showPopup() {
    // Créer les éléments
    const popup = document.createElement('div');
    const message = document.createElement('p');
    const button = document.createElement('button');

    // Configurer le contenu et les classes
    popup.className = 'popup';
    message.textContent = 'Le RGB rajoute des FPS';
    button.textContent = 'OK';
    button.className = 'popup-button';

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