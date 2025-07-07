window.addEventListener('DOMContentLoaded', () => {
    const diceModal = document.getElementById('dice-modal');
    const diceGif = document.getElementById('dice-gif');
    const giftModal = document.getElementById('gift-modal');

    // Mostrar el dado al tocar la pantalla principal (solo la primera vez)
    document.body.addEventListener('click', () => {
        diceModal.classList.add('active');
    }, { once: true });

    // Al tocar el dado, ocultar el dado y mostrar el mensaje de regalo
    diceGif.addEventListener('click', (e) => {
        e.stopPropagation();
        diceModal.classList.remove('active');
        setTimeout(() => {
            giftModal.classList.add('active');
            // Redirigir a p2.html tras 10 segundos
            setTimeout(() => {
                window.location.href = 'p2.html';
            }, 10000);
        }, 300);
    });
});