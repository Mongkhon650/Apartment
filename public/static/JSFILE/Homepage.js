// This function is used to show the login form
function showLoginForm(){
    document.getElementById("loginForm").style.display = "block";
}

// When the user clicks on the button, open the modal
function handleLogin() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (username == "admin" && password == "admin") {
        // alert("Login successfully");
        localStorage.setItem('username', username); // Store the username in the local storage
        window.location.href = "HPLogin.html";
    }
    else if (username == "batman" && password == "batman") {
        localStorage.setItem('username', username); // Store the username in the local storage
        window.location.href = "HPLogin.html";
    }
    else {
        alert("Login failed");
    }
}

// When click on other place not in the form, the form will disappear
document.addEventListener('click', function(event) {
    var isClickInsideFrom = document.getElementById("loginForm").contains(event.target);
    var isClickOnLoginButton = document.querySelector('.login-button').contains(event.target);

    if (!isClickInsideFrom && !isClickOnLoginButton) {
        document.getElementById("loginForm").style.display = "none";
    }
});

// This function is used to show user's profile
window.onload = function() {
    var username = localStorage.getItem('username');
    if (username) {
        document.getElementById('profile').innerHTML = username[0].toUpperCase();
    }
}

function toggleProfileBlock(){
    var profileBlock = document.getElementById('profileBlock');
    
    if (profileBlock.style.display == "none") {
        profileBlock.style.display = "block";
    } else {
        profileBlock.style.display = "none";
    }
}

function showFilterBox() {
    var filterBox = document.getElementById('filterBox');
    if (filterBox.style.display === 'none') {
        filterBox.style.display = 'block';
    } else {
        filterBox.style.display = 'none';
    }
}