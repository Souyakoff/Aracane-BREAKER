// Fonction pour changer le thème
function switchTheme(theme) {
    const themeLink = document.getElementById("theme-link");
    if (theme === "dark") {
        themeLink.setAttribute("href", "styles.css");
    } else if (theme === "light") {
        themeLink.setAttribute("href", "light.css");
    }
    // Enregistrer le thème dans le stockage local
    localStorage.setItem("siteTheme", theme);
}

// Charger le thème depuis le stockage local au chargement de la page
document.addEventListener("DOMContentLoaded", function () {
    const savedTheme = localStorage.getItem("siteTheme");
    switchTheme(savedTheme);
});
