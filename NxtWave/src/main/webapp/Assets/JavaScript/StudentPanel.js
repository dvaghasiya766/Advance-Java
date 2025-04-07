/**
 * 
 */
// You would typically load dashboard data from an API here
document.addEventListener('DOMContentLoaded', function () {
	// Initialize Swiper
	var swiper = new Swiper(".mySwiper", {
		slidesPerView: 'auto',
		grabCursor: "true",
		spaceBetween: 20,
		navigation: {
			nextEl: ".swiper-button-next",
			prevEl: ".swiper-button-prev",
		},
	});
	
    // Function to set active tab based on current page
    function setActiveTab() {
		const allLPTabIDs = [
			"index", "MyCourse", "AllCourses", "Prectice", "Disscussion", 
			"Assignments", "Profile", "Home", "Courses", "DisscussioMob", "ProfileMob"
		];
		const ObjectIDs = {
			"index.jsp" : ["index", "Home"],
			"MyCourse.jsp" : ["MyCourse"],
			"AllCourses.jsp" : ["AllCourses", "Courses"],
			"Prectice.jsp" : ["Prectice"],
			"Disscussion.jsp" : ["Disscussion", "DisscussioMob"],
			"Assignments.jsp" : ["Assignments"],
			"Profile.jsp": ["Profile", "ProfileMob"]
		};
        // Get current page URL (handle query parameters and paths)
        const currentPage = window.location.pathname.split('/').pop().split('?')[0];
        
        // Remove active class from all tabs first
        allLPTabIDs.forEach(tab => {
            tab.classList.remove('activeNavTab');
			console.log(tab);
        });
        
        // Find and activate the matching tab
		
        const activeTab = document.querySelector(`[onclick*="${currentPage}"]`);
        if (activeTab) {
            activeTab.classList.add('activeNavTab');
        }
    }
    
    // Call the function when page loads
    setActiveTab();
});