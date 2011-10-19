$("#circles-edit").live("pageshow", function(){
    $("input[type='checkbox'][checked='checked']").each(function(){
        $(this).checkboxradio('disable');
    });
});