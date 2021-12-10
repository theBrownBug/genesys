
document.addEventListener('DOMContentLoaded', ()=>{
    var cards = document.getElementsByClassName("question_card");
    for (var i = 0; i < cards.length; i++) {
      cards[i].addEventListener('click', getClick, false);
    }
  });
  
function getClick(){
    const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
    let tier = new FormData();
      tier.append('authenticity_token', CSRFToken);
      tier.append('session_id', document.cookie);
      tier.append('path', window.location.pathname);
      tier.append('category', 'FAQ')
      tier.append('value', this.id);
      navigator.sendBeacon('/click', tier)
  }
