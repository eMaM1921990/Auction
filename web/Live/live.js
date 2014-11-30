/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




            $(document).ready(function() {
                $.get('../createauction', null, null);
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


            var automax = setInterval(function()
            {
                $.get('../LastTimer', null, function(responseText) {
                    max = responseText;
                    
                    if (max > 0) {

                        //alert("Greater Thans >0" + max);
                        $.get('../updatetimer');
                        $('#clock').text(max);


                        if (max == 5) {
                            
                            $(document).ready(function() {
                                $("#freeow").freeow("Warning", "Auction will close in 5 sec , this message will disappear 5 sec", {
                                    classes: ["smokey", "Append"],
                                    autoHide: true
                                });
                            });
                        }
                    }else if (max == 0 ) {
                        
                        
                            $("#freeow").freeow("Ending", "Auction Closed ..", {
                                classes: ["smokey", "Append"],
                                autoHide: true
                            });

                            $.get('../winner');
                            location.reload();
                       

                    }
                    /*
                     if (max == -1) {
                     $(document).ready(function() {
                     $.get('winner.jsp');
                     
                     location.reload();
                     });
                     //location.reload();
                     
                     
                     }*/
                });
            }, 1000); // refresh every 5000 milliseconds





            $(document).ready(function() {
                var max;
                $.get('../MaxBid', null, function(responseText) {
                    max = responseText;
                });
                $('#submit').click(function(event) {
                    var username = $('#bidval').val();
                    if (parseInt(username) > parseInt(max)) {
                        $.get('../bid', {bid: username});
                    } else if (parseInt(username) < parseInt(max)) {


                        $("#freeow").freeow("Error", "Your Bid must be Geater than  " + max, {
                            classes: ["smokey", "error"],
                            autoHide: true
                        });
                    }
                    //username = $('#bidval').val();
                });
                
                });
      