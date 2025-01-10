document.addEventListener("DOMContentLoaded", () => {
    const toggleButton = document.getElementById("theme-toggle");
    if (!toggleButton) {
        console.error("Theme toggle button not found!");
        return;
    }

    const body = document.body;

    // Установите тему из localStorage
    const currentTheme = localStorage.getItem("theme") || "light";
    body.classList.add(`${currentTheme}-theme`);

    // Переключение темы
    toggleButton.addEventListener("click", () => {
        const newTheme = body.classList.contains("light-theme") ? "dark" : "light";
        body.classList.remove("light-theme", "dark-theme");
        body.classList.add(`${newTheme}-theme`);
        localStorage.setItem("theme", newTheme);
    });
});
