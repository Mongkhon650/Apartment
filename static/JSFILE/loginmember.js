function toggleProfileBlock(){
    var profileBlock = document.getElementById('profileBlock');
    
    if (profileBlock.style.display == "none") {
        profileBlock.style.display = "block";
    } else {
        profileBlock.style.display = "none";
    }
}

function updatePrice(value) {
    document.getElementById('priceValue').innerHTML = `ราคาที่เลือก : ${value} บาท`;
}

function updateDistance(value) {
    document.getElementById('distanceValue').innerHTML = `ระยะทางที่เลือก : ${value} เมตร`;
}

$(document).ready(function() {
    $.get("/dorm1", function(data) {
        $(".dorms").html(data);
    });
});

function toggleProfileBlock() {
    var x = document.getElementById("profile-dropdown");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

window.onload = function() {
    if (isLandlord) {
      document.getElementById('postDorm').style.display = 'block';
    }
}