/*global $*/
    //$(document).ready(function() {
    //$("#number_number").css("background-color", "yellow");
    //$(".form-group").css("color", "blue");
    //$("#number_save").bind('click', function( event ){ 
    
$(document).ready(function() {
    var montaNum = function(){
        var number = $("#number_countrycode").val() +
                     $("#number_cn").val() +
                     $("#number_prefix").val() +
                     $("#number_mcdu").val();
        $("#number_number").val(number);
    };        
    
    $("#number_countrycode").focusout(montaNum);
    $("#number_cn").focusout(montaNum);
    $("#number_prefix").focusout(montaNum);
    $("#number_mcdu").focusout(montaNum);
    $("#number_save").click(montaNum);

});
