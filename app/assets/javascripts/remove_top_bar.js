// Taken from http://davidwalsh.name/hide-address-bar

//For iPhone and Andriod To remove Address bar when viewing website on Safari Mobile
if((Browser.Platform.ios) || (Browser.Platform.android) && (Browser.safari)) {
    // When ready...
    window.addEventListener("load",function() {
        // Set a timeout...
        setTimeout(function(){
            // Hide the address bar!
            window.scrollTo(0, 1);
        }, 0);
    });
} 