$(document).bind("mobileinit", function(){
    $.mobile.loadingMessage = "laddar";
    $.mobile.pageLoadErrorMessage = "Det gick inte att ladda sidan";

    // hacky solution to always set the title to Up to Speed
    $('div[data-role="page"]').live("pageshow",function(){document.title = "Up to Speed";});
});