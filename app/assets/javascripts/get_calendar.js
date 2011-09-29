$(document).ready(function(){
    $.get("https://www.google.com/calendar/feeds/default/allcalendars/full", 
        {oauth_consumer_key: "www.uptospeed.se",
         alt: "jsonc", 
         oauth_token: "AItOawmW0BiW-RNY_BtT7t4H91mn69N9MvkF6fE"}, function(data){
    console.log(data);
    });
});


// GET&https://www.google.com/calendar/feeds/default/owncalendars/full&oauth_consumer_key=example.com&oauth_nonce=38863f48...28dd9fd2c&oauth_signature_method=RSA-SHA1&oauth_timestamp=1249972977&oauth_token=1%2Fz1...LMzNBrKhElA&oauth_version=1.0

//GET&https://www.google.com/calendar/feeds/default/owncalendars/full&oauth_consumer_key=example.com&oauth_nonce=38863f48...28dd9fd2c&oauth_signature_method=RSA-SHA1&oauth_timestamp=1249972977&oauth_token=1%2Fz1...LMzNBrKhElA&oauth_version=1.0