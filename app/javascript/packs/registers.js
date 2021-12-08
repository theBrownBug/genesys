
document.addEventListener('DOMContentLoaded', ()=>{
  //getGeolocation();
  var prices = document.getElementsByClassName("tier_price");
  document.getElementById("option1").addEventListener('click', function(){getClick('tier', '1')});
  document.getElementById("option2").addEventListener('click', function(){ getClick('tier', '2')});
});

function getClick(category, value){
  const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
  let tier = new FormData();
    tier.append('authenticity_token', CSRFToken);
    tier.append('session_id', document.cookie);
    tier.append('path', window.location.pathname);
    tier.append('category', category)
    tier.append('value',value);
    navigator.sendBeacon('/click', tier);
}
