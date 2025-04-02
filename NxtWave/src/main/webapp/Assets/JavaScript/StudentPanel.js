/**
 * 
 */
// Initialize Swiper
var swiper = new Swiper(".mySwiper", {
    slidesPerView: 'auto',
    spaceBetween: 20,
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});

// You would typically load dashboard data from an API here
document.addEventListener('DOMContentLoaded', function () {
    // Example: Fetch dashboard data and populate the UI
    // fetchDashboardData();
});