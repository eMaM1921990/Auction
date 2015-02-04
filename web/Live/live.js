/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */







$(document).ready(function() {
    $.get('../createauction');



    $('#submit').click(function(event) {
        var max;
        $.get('../MaxBid', null, function(responseText) {
            max = responseText;
            var username = $('#bidval').val();
            if (parseInt(username) >= parseInt(max)) {
                $.get('../bid', {bid: username});
            } else if (parseInt(username) < parseInt(max)) {


                $("#freeow").freeow("Error", "Your Bid must be Geater than or Equal " + max, {
                    classes: ["smokey", "error"],
                    autoHide: true
                });
            }

            $('#bidval').val('');
        });

        //username = $('#bidval').val();
    });

});

var autoscore = setInterval(function()
{
    $('#score').load('../loaddata').fadeIn("slow");
}, 100); // refresh every 5000 milliseconds


var automax = setInterval(function()
{
    $('#maxbid').load('../lastbidd').fadeIn("slow");
}, 100); // refresh every 5000 milliseconds



var xmlHttp1;
function showStateAuction() {
    if (typeof XMLHttpRequest !== "undefined") {
        xmlHttp1 = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp1 = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp1 === null) {
        alert("Browser does not support XMLHTTP Request")
        return;
    }
    var url = "../loadauctionitem";
    //url +="?idclient=" +encodeURI(str)+"&exm="+encodeURI(str1);
    xmlHttp1.onreadystatechange = stateChangeAuction;
    xmlHttp1.open("GET", url, true);
    xmlHttp1.send(null);
}

function stateChangeAuction() {
    if (xmlHttp1.readyState === 4 || xmlHttp1.readyState === "complete") {
        document.getElementById("auctionitem").innerHTML = xmlHttp1.responseText;
    }
}


var automaxtime = setInterval(function()
{

    var maxtime;
    $.get('../LastTimer', null, function(responseText) {
        maxtime = parseInt(responseText);
        $('#clock').text(maxtime);
        $.get('../updatetimer');
        if (maxtime > 0) {

            //alert("Greater Thans >0" + max);



            if (maxtime === 5) {

                $(document).ready(function() {
                    $("#freeow").freeow("Warning", "Auction will close in 5 sec , this message will disappear 5 sec", {
                        classes: ["smokey", "Append"],
                        autoHide: true
                    });
                });
            }

        }

        else if (maxtime === 0) {


            $("#freeow").freeow("Ending", "Auction Closed ..", {
                classes: ["smokey", "Append"],
                autoHide: true
            });
            clearInterval(automaxtime);
            $.get('../winner', null, function(responseText) {

                window.open('index.jsp', '_self');
            }
            );
            // max=-1;
            //location.reload();




        }

    });






}, 1000); // refresh every 5000 milliseconds





  