// Inviting new members should disable the current members and/or already invited
$("#circles-edit").live("pageshow", function(){
    $("input[type='checkbox'][checked='checked']").each(function(){
        $(this).checkboxradio('disable');
    });
});

// Creating a new circle should hide self to keep from creating a circle
// where a user can choose to be in it or not
$("#circles-new").live("pageshow", function(){
    $("input[type='checkbox'][checked='checked']").each(function(){
        $(this).checkboxradio('disable');
        $(this).removeAttr("disabled");
    });
});