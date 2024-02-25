function GetGeolocation() {
    let position
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    }
    else {
        return null;
    }
    return position
}

function showPosition(position) {
    position.latitude = position.coords.latitude;
    position.longitude = position.coords.longitude;
}