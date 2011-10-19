$("#circles-edit").live("pageshow", function(){
    console.log("baaa");
    $("input[type='checkbox'][checked='checked']").each(function(){
        console.log($(this));
        console.log("hej");
        $(this).checkboxradio('disable');
    });
});