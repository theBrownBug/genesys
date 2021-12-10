export function getClick(category){
    const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
    let tier = new FormData();
      tier.append('authenticity_token', CSRFToken);
      tier.append('session_id', document.cookie);
      tier.append('path', window.location.pathname);
      tier.append('category', category)
      tier.append('value', this.value);
      navigator.sendBeacon('/click', tier)
  }
