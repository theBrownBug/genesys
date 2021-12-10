
document.addEventListener('DOMContentLoaded', ()=>{
    document.getElementById("featureButton1").addEventListener('click', function(){ getClick('feature', 'Automated Timetable') });
    document.getElementById("featureButton2").addEventListener('click', function(){ getClick('feature', 'Last Minute Changes')});
    document.getElementById("featureButton3").addEventListener('click', function(){getClick('feature','Track Repeating Tasks')});
    
    var feature1box = document.getElementById("feature1box");
    var feature2box = document.getElementById("feature2box");
    var feature3box = document.getElementById("feature3box");

    feature1box.querySelector('.fa-twitter-square').addEventListener('click', function(){getClick('twitter','Automated Timetable')});
    feature1box.querySelector('.fa-facebook-square').addEventListener('click', function(){getClick('facebook','Automated Timetable')});
    feature1box.querySelector('.fa-envelope').addEventListener('click', function(){getClick('email','Automated Timetable')});

    feature2box.querySelector('.fa-twitter-square').addEventListener('click', function(){getClick('twitter','Last Minute Changes')});
    feature2box.querySelector('.fa-facebook-square').addEventListener('click', function(){getClick('facebook','Last Minute Changes')});
    feature2box.querySelector('.fa-envelope').addEventListener('click', function(){getClick('email','Last Minute Changes')});

    feature3box.querySelector('.fa-twitter-square').addEventListener('click', function(){getClick('twitter','Track Repeating Tasks')});
    feature3box.querySelector('.fa-facebook-square').addEventListener('click', function(){getClick('facebook','Track Repeating Tasks')});
    feature3box.querySelector('.fa-envelope').addEventListener('click', function(){getClick('email','Track Repeating Tasks')});


  });
  
function getClick(category, value){
    const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
    console.log(value);
    let tier = new FormData();
      tier.append('authenticity_token', CSRFToken);
      tier.append('session_id', document.cookie);
      tier.append('path', window.location.pathname);
      tier.append('category', category)
      tier.append('value', value);
      navigator.sendBeacon('/click', tier)
  }
