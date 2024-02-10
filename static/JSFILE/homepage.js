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