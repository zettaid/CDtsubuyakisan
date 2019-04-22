$(function(){
    $("#pulldown1").change(function(){
        var value = $("#pulldown1 option:selected").val();
        $.get("pulldown/" + value ,function(data){
            var obj = $.parseJSON(data);
            $("#pulldown2").html("");
            for(var i=0;i<obj.length;i++){
                $("#pulldown2").append("<option value="+obj[i].itemValue+">"+obj[i].itemLabel+"</option>");
            }
        })
    })
})