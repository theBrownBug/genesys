document.addEventListener('DOMContentLoaded', ()=>{
  getGeolocation();
  var prices = document.getElementsByClassName("tier_price");
  document.getElementById("register_option_1").addEventListener('click', getClick);
  document.getElementById("register_option_2").addEventListener('click', getClick);
});

function getClick(){
  const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
  let tier = new FormData();
    tier.append('authenticity_token', CSRFToken);
    tier.append('session_id', document.cookie);
    tier.append('path', window.location.pathname);
    tier.append('category', 'tier')
    tier.append('value', this.value);
    navigator.sendBeacon('/click', tier)
}

function getGeolocation(){navigator.geolocation.getCurrentPosition(GeoL)};
function GeoL(position){
  console.log(position)
  document.getElementById('register_lat').value = position.coords.latitude;
  document.getElementById('register_long').value = position.coords.longitude;
}
