window.onload = function () {
    var myCollapsible = document.getElementById('feature1')
    myCollapsible.addEventListener('show.bs.collapse', function () {
        document.getElementById("featureButton1").innerHTML = "Hide details";
        document.getElementById("featureText1").classList.remove("grad");
        
    })
    myCollapsible.addEventListener('hide.bs.collapse', function () {
        document.getElementById("featureButton1").innerHTML = "Show details";
        document.getElementById("featureText1").classList.add("grad");
    })
    
    var myCollapsible = document.getElementById('feature2')
    myCollapsible.addEventListener('show.bs.collapse', function () {
        document.getElementById("featureButton2").innerHTML = "Hide details";
        document.getElementById("featureText2").classList.remove("grad");
        
    })
    myCollapsible.addEventListener('hide.bs.collapse', function () {
        document.getElementById("featureButton2").innerHTML = "Show details";
        document.getElementById("featureText2").classList.add("grad");
    })

    var myCollapsible = document.getElementById('feature3')
    myCollapsible.addEventListener('show.bs.collapse', function () {
        document.getElementById("featureButton3").innerHTML = "Hide details";
        document.getElementById("featureText3").classList.remove("grad");
        
    })
    myCollapsible.addEventListener('hide.bs.collapse', function () {
        document.getElementById("featureButton3").innerHTML = "Show details";
        document.getElementById("featureText3").classList.add("grad");
    })
}