document.addEventListener('DOMContentLoaded', ()=>{
        const pageVisitedFrom = Date.now();
        const CSRFToken = document.querySelector("meta[name='csrf-token']").getAttribute('content');
        document.addEventListener('visibilitychange', ()=>{
            if(document.visibilityState == 'hidden'){
                const location = navigator.geolocation.getCurrentPosition(success);
                function success(pos){
                    var crd = pos.coords;
                    let metrics = new FormData();
                    metrics.append('pageVisitedFrom', pageVisitedFrom);
                    metrics.append('pageVisitedTo', Date.now());
                    metrics.append('latitude', crd.latitude);
                    metrics.append('longitude', crd.longitude);
                    metrics.append('path', window.location.pathname);
                    metrics.append('authenticity_token', CSRFToken);
                    navigator.sendBeacon('/metrics', metrics)
                }
            }
    })
});

