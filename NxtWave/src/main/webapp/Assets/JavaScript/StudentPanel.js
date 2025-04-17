// You would typically load dashboard data from an API here
document.addEventListener("DOMContentLoaded", function() {
	// Initialize UI components
	initializePage();
});

function initializePage() {
	initSwipers();
	// Set active tab
	setActiveTab();
}
function initSwipers() {
	// Initialize Swiper
	var swiper = new Swiper(".mySwiper", {
		slidesPerView: "auto",
	    grabCursor: "true",
	    spaceBetween: 20,
	    navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});
	var swiperCourses = new Swiper(".mySwiper1", {
		slidesPerView: "auto",
		grabCursor: "true",
		spaceBetween: 10,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});
}

function setActiveTab() {
    // Tab activation code...
	let totalTab = [
	      "index",
	      "MyCourse",
	      "AllCourses",
	      "Activity",
	      "Disscussion",
	      "Assignments",
	      "Profile",
	];
	let mobTabs = ["index", "AllCourses", "Disscussion", "Profile"];
	let ConvertionObj = {
		index: "Home",
		AllCourses: "Courses",
		Disscussion: "DisscussioMob",
		Profile: "ProfileMob",
	};
	let currentPage = window.location.href.split("/").pop().split("#")[0]; // Get the current page name
	currentPage = currentPage.split(".").slice(0, -1).join("."); // Remove the file extension
	if (!totalTab.includes(currentPage)) {
		currentPage = "index";
	}
	let inactiveTab = document.getElementById(currentPage);
	inactiveTab.classList.add("d-none"); // Hide the inactive tab
	let activeTab = document.getElementById("Active" + currentPage);
	activeTab.classList.remove("d-none");
	if (mobTabs.includes(currentPage)) {
		inactiveTab = document.getElementById(ConvertionObj[currentPage]);
		inactiveTab.classList.add("d-none"); // Hide the inactive tab
		activeTab = document.getElementById("Active" + ConvertionObj[currentPage]);
		activeTab.classList.remove("d-none");
	} else {
		currentPage = "index";
		inactiveTab = document.getElementById(ConvertionObj[currentPage]);
		inactiveTab.classList.add("d-none"); // Hide the inactive tab
		activeTab = document.getElementById("Active" + ConvertionObj[currentPage]);
		activeTab.classList.remove("d-none");
	}
}