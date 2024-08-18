
// ----------------------------------------------- vehicle part --------------------------------------------------------------------

var speedbar = new ProgressBar.SemiCircle(speedconta, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 50,
    color: '#f3a84f',
    trailColor: 'rgba(172, 167, 169, 0.3)',
    trailWidth: 4,
    svgStyle: null
});
  

var fuelbar = new ProgressBar.SemiCircle(fuelconta, {
    strokeWidth: 2,
    easing: 'easeInOut',
    duration: 50,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.3)',
    trailWidth: 2,
    svgStyle: null
});
  
// fuelbar.animate(0.5);


// ----------------------------------------------- status part --------------------------------------------------------------------
var runbar = new ProgressBar.Circle(runstatuscontainer, {
  strokeWidth: 4,
  easing: 'linear',
  duration: 50,
  color: 'white',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 3,
  svgStyle: null
});

  // Number from 0.0 to 1.0

var cigerbar = new ProgressBar.Circle(cigerstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // cigerbar.animate(0.5);  // Number from 0.0 to 1.0

  var brainbar = new ProgressBar.Circle(brainstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // brainbar.animate(0.5);  // Number from 0.0 to 1.0


  var healthbar = new ProgressBar.Circle(healthstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // healthbar.animate(0.5);  // Number from 0.0 to 1.0


  var armourbar = new ProgressBar.Circle(armourstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // armourbar.animate(0.5);  // Number from 0.0 to 1.0

  var waterbar = new ProgressBar.Circle(waterstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // waterbar.animate(0.5);  // Number from 0.0 to 1.0


  var foodbar = new ProgressBar.Circle(foodstatuscontainer, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 20,
    color: 'white',
    trailColor: 'rgba(172, 167, 169, 0.6)',
    trailWidth: 3,
    svgStyle: null
  });
  
  // foodbar.animate(0.5);  // Number from 0.0 to 1.0


//   -------------------------------------------------------------------------------- errorprogbar--------------------------------------------------------------------------------------
  // var errorbar = new ProgressBar.Line(errorprogbar, {
  //   strokeWidth: 2,
  //   easing: 'easeInOut',
  //   duration: 1400,
  //   color: '#ff284f',
  //   trailColor: 'rgba(255, 255, 255, 0.1)',
  //   trailWidth: 1,
  //   svgStyle: {width: '100%', height: '100%'}
  // });
  
  // errorbar.animate(1.0);  // Number from 0.0 to 1.0

  // var successbar = new ProgressBar.Line(successprogbar, {
  //   strokeWidth: 2,
  //   easing: 'easeInOut',
  //   duration: 1400,
  //   color: '#39ffa0',
  //   trailColor: 'rgba(255, 255, 255, 0.1)',
  //   trailWidth: 1,
  //   svgStyle: {width: '100%', height: '100%'}
  // });
  
  // successbar.animate(1.0);  // Number from 0.0 to 1.0

  // var infobar = new ProgressBar.Line(infoprogbar, {
  //   strokeWidth: 2,
  //   easing: 'easeInOut',
  //   duration: 1400,
  //   color: '#f3a84f',
  //   trailColor: 'rgba(255, 255, 255, 0.1)',
  //   trailWidth: 1,
  //   svgStyle: {width: '100%', height: '100%'}
  // });
  
  // infobar.animate(1.0);  // Number from 0.0 to 1.0


  


//   -------------------------------------------------------------------------------- loading--------------------------------------------------------------------------------------

// var count = $("#dots span").length;
// var speed = 5000/count;
// $("#dots span").each(function(index){
// 	$(this).delay(speed*index).queue(function(next){
//   	$(this).css('background-color', '#f3a84f');
//     next();
//   });
// });

// ---------------- hud prog 1---------------------------------

var run1color = '#FFFFFF';
var ciger1color = '#FFFFFF';
var brain1color = '#FFFFFF';
var health1color = '#FFFFFF';
var armour1color = '#FFFFFF';
var water1color = '#FFFFFF';
var food1color = '#FFFFFF';



// ---------------- hud prog 2---------------------------------

var run2color = '#f3a84f';
var ciger2color = '#f3a84f';
var brain2color = '#f3a84f';
var health2color = '#f3a84f';
var armour2color = '#f3a84f';
var water2color = '#f3a84f';
var food2color = '#f3a84f';


// ---------- other bar ------------------------------------------------------

// var healthbar2 = new ldBar("#healthstatuscontainer2");
// var armorbar2 = new ldBar("#armourstatuscontainer2");
// var burgerbar2 = new ldBar("#foodstatuscontainer2");
// var waterbar2 = new ldBar("#waterstatuscontainer2");
// var stressbar2 = new ldBar("#brainstatuscontainer2");
// var staminabar2 = new ldBar("#runstatuscontainer2");
// var cigerbar2= new ldBar("#cigerstatuscontainer2");
var healthbar2 = new ProgressBar.Line(healthstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.4)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});


var runbar2 = new ProgressBar.Line(runstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.4)',
  trailWidth: 2,
  svgStyle: {width: '100%', height: '100%'}
});


var cigerbar2 = new ProgressBar.Line(cigerstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});

var brainbar2 = new ProgressBar.Line(brainstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});

var armorbar2 = new ProgressBar.Line(armourstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});

var waterbar2 = new ProgressBar.Line(waterstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});

var burgerbar2 = new ProgressBar.Line(foodstatuscontainer2, {
  strokeWidth: 1,
  easing: 'easeInOut',
  duration: 50,
  color: '#FFEA82',
  trailColor: 'rgba(172, 167, 169, 0.6)',
  trailWidth: 1,
  svgStyle: {width: '100%', height: '100%'}
});







var mapstate = "normal"
var audioPlayer = null;

window.addEventListener('message', function(e) {
    if (e.data.message == "arachud"){

         
        if (e.data.durum == "aktif"){
            
             if (e.data.playerdatabase.vehmenu.position == "right-bottom" ){
                $(".hudvehiclespeedo").css('top', '81%');
                
                $(".hudvehiclespeedo").css('right', '0');
             }else if(e.data.playerdatabase.vehmenu.position == "center-bottom" ){

              $(".hudvehiclespeedo").css('top', '81%');
                
                $(".hudvehiclespeedo").css('right', '40%');
             }
              $('.hudvehiclespeedo').fadeIn(500);

              var speedthis = Number(e.data.arachiz)
              if ( speedthis > 100 ){
                speedbar.animate(1.0, {    easing: 'linear', duration: 50,   from: { color: e.data.playerdatabase.vehmenu.progcolor}, to: { color: e.data.playerdatabase.vehmenu.progcolor } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

           
            
              }else{
                speedbar.animate(speedthis / 100, {    easing: 'linear', duration: 50,   from: { color: e.data.playerdatabase.vehmenu.progcolor}, to: { color: e.data.playerdatabase.vehmenu.progcolor } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 
               
            

              }
              
              fuelbar.animate(Number(e.data.aracbenzin) / 100);
            
              
              // $('#rotationid').fadeIn(400);

              $('#speedotext').html(e.data.arachiz);
              $('.fuelicontext').html(Number(e.data.aracbenzin) + ' %');
              if (e.data.aracfar.farkisa == 0 && e.data.aracfar.faruzunlar == 0)  {
                $("#farfill").css("fill","rgba(172, 167, 169, 0.8)");
                $("#farfilltext").html("F");
              }else if (e.data.aracfar.farkisa == 1 && e.data.aracfar.faruzunlar == 0 || e.data.aracfar.farkisa == 0 && e.data.aracfar.faruzunlar == 1) {
                  $("#farfill").css("fill","white");
                  $("#farfilltext").html("S");
              }else if (e.data.aracfar.farkisa == 1 && e.data.aracfar.faruzunlar == 1){
                  $("#farfill").css("fill",e.data.playerdatabase.vehmenu.iconcolor);
                  $("#farfilltext").html("T");
              }

              if (e.data.aracmotor){
               
               $("#enginefill").css("fill",e.data.playerdatabase.vehmenu.iconcolor);
               $("#enginefill2").css("fill",e.data.playerdatabase.vehmenu.iconcolor);
       
       
               $("#enginefilltext").html("E");
               
       
       
       
             }else{
       
                 $("#enginefill").css("fill","rgba(172, 167, 169, 0.8)");
               $("#enginefill2").css("fill","rgba(172, 167, 169, 0.8)");
       
                 $("#enginefilltext").html("F");
       
             }




             if (e.data.playerdatabase.bankcash.hudstate){
              $('#rotationid').fadeIn(0);
              $('#cashbankid').fadeIn(400);

              $("#cashbankid").css('display', 'flex');
              $("#cashbankid").css('flex-direction', 'column');
              $("#cashbankid").css('top', '79%');
              
              $("#cashbankid").css('left', '16%');
            }else{
              $('#cashbankid').fadeOut(0);
  
            }


            // if (e.data.talkmod){
            //   $('#disable').css('display', 'none');

            //   $('#talkinnw').css('display', 'flex');
            // }else{

            //   $('#talkinnw').css('display', 'none');
            //   $('#disable').css('display', 'flex');

            // }

        }else{
          $('.hudvehiclespeedo').fadeOut(500);
          // $('#cashbankid').fadeOut(400);
          if (e.data.playerdatabase.bankcash.hudstate){
            if (e.data.playerdatabase.bankcash.position == "left-bottom"){
              
              $('#rotationid').fadeOut(0);
              $('#cashbankid').fadeIn(400);
              $("#cashbankid").css('display', 'flex');
              $("#cashbankid").css('flex-direction', 'column');
              $("#cashbankid").css('top', '68%');
              
              $("#cashbankid").css('left', '0.5%');
            }else{
              $('#rotationid').fadeOut(0);
               $('#cashbankid').fadeIn(400);
               $("#cashbankid").css('display', 'flex');
               $("#cashbankid").css('flex-direction', 'row');
              $("#cashbankid").css('top', '10%');
              
              $("#cashbankid").css('left', '85%');
            }
             
          }else{
            $('#cashbankid').fadeOut(0);

          }


          // if (e.data.talkmod){
          //   $('#disable').css('display', 'none');

          //   $('#talkinnw').css('display', 'flex');
          // }else{

          //   $('#talkinnw').css('display', 'none');
          //   $('#disable').css('display', 'flex');

          // }
        };

    };



      


      if (e.data.message == "arackemer"){
        if (e.data.kemerdurum == "aktif") {
  
          $("#beltfill").css("fill",e.data.playerdatabase.vehmenu.iconcolor);
          $("#beltfilltext").html("E");

        }else{
          $("#beltfill").css("fill","rgba(172, 167, 169, 0.8)");
          $("#beltfilltext").html("F");
      

        }
      }

      if (e.data.message == "talkmodon"){
        if (e.data.talkmod){
          $('#disable').css('display', 'none');

          $('#talkinnw').css('display', 'flex');
        }else{

          $('#talkinnw').css('display', 'none');
          $('#disable').css('display', 'flex');

        }
      }
      



      if (e.data.status == "updateStreet") {
           $('#rotation1').html(e.data.street2);
           $('#rotation2').html(e.data.street);

      }


      // ----------------------------------- yemek part ---------------------------------------------------------------------------------------

      if (e.data.message == "oyuncuyemekhud"){
        if (e.data.durm == "on"){
    
           if (e.data.playerdatabase.needhud.style == "normal"){
                $('#playerstatus').fadeIn(500);
                $('#playerstatus2').fadeOut(0);

                if (e.data.playerdatabase.needhud.position == "right-center"){
             
                  $(".hudpstatuspart").css('display', 'flex');
                  $(".hudpstatuspart").css('flex-direction', 'column');

                  $(".hudpstatuspart").css('top', '49%');
          
                  $(".hudpstatuspart").css('left', '96%');
              
  
                }else if (e.data.playerdatabase.needhud.position == "left-bottom"){
            
                  
                  $(".hudpstatuspart").css('display', 'flex');
                  $(".hudpstatuspart").css('flex-direction', 'row');
                
                  $(".hudpstatuspart").css('top', '94.5%');
          
                  $(".hudpstatuspart").css('left', '1%');
              
       
                }

              
                if (Number(e.data.playerstamina) < 100){
                
                  $('#runstatuscontainer').fadeIn(300);
                  $('#runstatuscontainertext').html(Math.trunc(Number(e.data.playerstamina))+'%');
                
                   runbar.animate(e.data.playerstamina / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

                
                  // runbar.animate(e.data.playerstamina / 100 , { from: { color: run1color}, to: { color: run1color} });
                }else if(Number(e.data.playerstamina) == 100) {
                  $('#runstatuscontainer').fadeOut(300);

                }
                
                  
                if (Number(e.data.playeroxy) < 100){
                  $('#cigerstatuscontainer').fadeIn(300);
                  $('#cigerstatuscontainertext').html(Math.trunc(Number(e.data.playeroxy))+'%');
                
                  cigerbar.animate(e.data.playeroxy / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

                }else if(Number(e.data.playeroxy) == 100) {
                  $('#cigerstatuscontainer').fadeOut(300);
                }
                brainbar.animate(Math.trunc(Number(e.data.brain)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

             
                
                $('#brainstatuscontainertext').html(Math.trunc(Number(e.data.brain))+'%');
                healthbar.animate(Math.trunc(Number(e.data.can)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

                $('#healthstatuscontainertext').html(Math.trunc(Number(e.data.can))+'%');
                armourbar.animate(Math.trunc(Number(e.data.yelek)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

            
                $('#armourstatuscontainertext').html(Math.trunc(Number(e.data.yelek))+'%');
                waterbar.animate(Math.trunc(Number(e.data.susuzluk)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

               
                $('#waterstatuscontainertext').html(Math.trunc(Number(e.data.susuzluk))+'%');
                foodbar.animate(Math.trunc(Number(e.data.aclik)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

              
                $('#foodstatuscontainertext').html(Math.trunc(Number(e.data.aclik))+'%');
          }else if (e.data.playerdatabase.needhud.style == "bubble"){

            $('#playerstatus2').fadeIn(500);
            $('#playerstatus').fadeOut(0);


            if (e.data.playerdatabase.needhud.position == "right-center"){
   
              $(".hudpstatuspart2").css('display', 'flex');
              $(".hudpstatuspart2").css('flex-direction', 'column');
          
              $(".hudpstatuspart2").css('top', '49%');
          
              $(".hudpstatuspart2").css('left', '96%');
            }else if (e.data.playerdatabase.needhud.position == "left-bottom"){

              $(".hudpstatuspart2").css('display', 'flex');
              $(".hudpstatuspart2").css('flex-direction', 'row');
             
          
          
              $(".hudpstatuspart2").css('top', '94.5%');
          
              $(".hudpstatuspart2").css('left', '0.7%');
            }

          
            if (Number(e.data.playerstamina) < 100){
            
              $('#runstatuscontainer2').fadeIn(300);
              $('#runstatuscontainertext2').html(Math.trunc(Number(e.data.playerstamina))+'%');
                
                runbar2.animate(e.data.playerstamina / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

            
            }else if(Number(e.data.playerstamina) == 100) {
              $('#runstatuscontainer2').fadeOut(300);

            }
            
              
            if (Number(e.data.playeroxy) < 100){
              $('#cigerstatuscontainer2').fadeIn(300);
              $('#cigerstatuscontainertext2').html(Math.trunc(Number(e.data.playeroxy))+'%');
             
              cigerbar2.animate(e.data.playeroxy / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 


            }else if(Number(e.data.playeroxy) == 100) {
              $('#cigerstatuscontainer2').fadeOut(300);
            }

         

            brainbar2.animate(Math.trunc(Number(e.data.brain)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

         
            
            $('#brainstatuscontainertext2').html(Math.trunc(Number(e.data.brain))+'%');
            // healthbar2.fill = "white"

          
        
            healthbar2.animate(Math.trunc(Number(e.data.can)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 
             
        

            // healthbar.animate(Math.trunc(Number(e.data.can)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

            $('#healthstatuscontainertext2').html(Math.trunc(Number(e.data.can))+'%');
           

            armorbar2.animate(Math.trunc(Number(e.data.yelek)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

            $('#armourstatuscontainertext2').html(Math.trunc(Number(e.data.yelek))+'%');
            waterbar2.animate(Math.trunc(Number(e.data.susuzluk)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

       

           

           
            $('#waterstatuscontainertext2').html(Math.trunc(Number(e.data.susuzluk))+'%');
            // burgerbar2.set(Math.trunc(Number(e.data.aclik)));
            burgerbar2.animate(Math.trunc(Number(e.data.aclik)) / 100, {    easing: 'linear', duration: 50,   from: { color: run1color}, to: { color: run1color } ,step: function(state, circle, attachment) { circle.path.setAttribute('stroke', state.color); } }); 

            
            $('#foodstatuscontainertext2').html(Math.trunc(Number(e.data.aclik))+'%');

          }


          if (e.data.playerdatabase.topmenu.logostate){
            $('.hudtoppartlogo').fadeIn(0);
            
          }else{
            $('.hudtoppartlogo').fadeOut(0);

          }


          if (e.data.playerdatabase.topmenu.onlinestate){
            $('#hudtoppart1id').fadeIn(0);
            
          }else{
            $('#hudtoppart1id').fadeOut(0);

          }

          if (e.data.playerdatabase.topmenu.timestate){
            $('#hudtoppart2id').fadeIn(0);
            
          }else{
            $('#hudtoppart2id').fadeOut(0);

          }


          // if (e.data.playerdatabase.weapon){
          //   $('.hudgunpart').fadeIn(0);
            
          // }else{
          //   $('.hudgunpart').fadeOut(0);

          // }


        
           
            
            
        }else if(e.data.durm == "off"){
            $('#playerstatus').fadeOut(500);
            $('#playerstatus2').fadeOut(500);

        }
     }


    if ( e.data.message == "weaponmod"){
          if (e.data.stateweapon == "on"){
            $('.hudgunpart').fadeIn(300);
          
            var text = e.data.weaponimg
            var buyuktxt = text.toUpperCase();
            $("#gunimgpls").attr("src","https://vespura.com/fivem/weapons/images/"+buyuktxt+'.png');
            $('#gunbulletpart').html(e.data.weaponbullet+' / '+e.data.maxweapon);
       
          }else{
            $('.hudgunpart').fadeOut(0);

          }
    } 



    if ( e.data.test == "bankcash"){
      if (e.data.statebitch == "on"){
        $('#bucash').html('$ '+ formatMoney(e.data.money));
        $('#bubank').html('$ '+ formatMoney(e.data.bank));

          
       
   
      }else{
        // $('.hudgunpart').fadeOut(300);

      }

      
    } 


    if (e.data.status = "updateClock"){
      $('#timeid').html(e.data.time);
      $('#onlineid').html(e.data.onlines);

      
    }




    if (e.data.bune == "cliendata"){
   
      changehudset(e.data.clientplayer.needhud , e.data.clientplayer)
    }


      

    if (e.data.message == "progbaractive"){
      startprogbar(e.data.mtext, e.data.mtime)
    }

    if (e.data.message == "notifyactive"){
      ShowNotif(e.data);
    }
 

   if (e.data.message == "hudmenuon"){
       $('.hudmenupart').fadeIn(300);
       inserthudinfos(e.data.hudinfoss)
     
   }


   if (e.data.type == "safezone"){
        if (e.data.state){
          $('#safezone').fadeIn(0);
        }else{
          $('#safezone').fadeOut(0);

        }
   }


   if (e.data.transactionType == "playSound") {
				
    if (audioPlayer != null) {
      audioPlayer.pause();
    }

    audioPlayer = new Howl({src: ["./sounds/" + e.data.transactionFile + ".ogg"]});
    audioPlayer.volume(e.data.transactionVolume);
    audioPlayer.play();

  }


  if (e.data.budabu == "logoinsert") {
 
       
   $('#impulscolor').html(e.data.logoname);
    

   }




  if (e.data.type == "gangwaron"){
    currentitme = Number(e.data.gangdata.gangtime);
    myInterval = setInterval(demo, 1000);
    $('.hudgangpart').fadeIn(400);
    $('#hudgangtextid1').html(e.data.gangdata.gang1text + "<br /> Street Gang");
    $('#hudgangtextid2').html(e.data.gangdata.gang2text + "<br /> Street Gang");
    $('#hudgangcountid1').html(e.data.gangdata.gang1count);
    $('#hudgangcountid2').html(e.data.gangdata.gang2count);

    $("#teklifill").attr("fill", e.data.gangdata.gang1color);
    $("#teklifill2").attr("fill", e.data.gangdata.gang2color);
    
    // $(".hudgangcircle1").css("border", e.data.gangdata.gang1color+"solid 2px");
    // console.log(e.data.gangdata.gang2color)
    $(".hudgangcircle1").css("border","2px solid " + e.data.gangdata.gang1color );
    $(".hudgangcircle2").css("border","2px solid " + e.data.gangdata.gang2color );

    // $(".hudgangcircle1").css("borderColor", "2px solid" + e.data.gangdata.gang1color);
    // $(".hudgangcircle2").css("borderColor", "2px solid" + e.data.gangdata.gang2color);

 

    
  }

  if (e.data.type == "updategang"){
    $('#hudgangcountid1').html(e.data.gangdata.gang1count);
    $('#hudgangcountid2').html(e.data.gangdata.gang2count);
  }


  if (e.data.type == "stoppls"){
    formatSeconds(0);
    clearInterval(myInterval);
    $('.hudgangtime').html("00:00"); 
    $('.hudgangpart').fadeOut(400);
    $.post('https://bp_hud/finishgang', JSON.stringify({}));
  }


  if (e.data.type == "gangnotify"){
    $('.hudgangannounce').fadeIn(400);
    $('#gangtextwritenotify').html(e.data.notifydata.gangwinner+ " Street Gang");
    $("#gangtextwritenotify").css("color", e.data.notifydata.gangcolor );
    $("#uclufill").attr("fill", e.data.notifydata.gangcolor);
    $("#uclufill2").attr("fill", e.data.notifydata.gangcolor);
    $("#uclufill3").attr("fill", e.data.notifydata.gangcolor);

    setTimeout(() => {
      $('.hudgangannounce').fadeOut(500);
    }, e.data.notifydata.gangtime);
    
  }


  if (e.data.type == "queston"){
    $('.hudleftquest').fadeIn(400);
    $('.hudleftquest_1_textpart').html(e.data.questdata.questmaintext);
    $(".hudleftquest_1_textpart").css("color", e.data.questdata.questcolor );
    $('.hudleftquest_2_textpart').html(e.data.questdata.questdesttext);
    $('.hudleftquest_2_iconpart').html(e.data.questdata.questdesttop);


  }

  if (e.data.type == "questoff"){
    $('.hudleftquest').fadeOut(400);
  }
  
    

})

const demo = () => {
  var seconds = currentitme;
 


  $('.hudgangtime').html(formatSeconds(currentitme)); 
  currentitme--;

  if (currentitme <= 0 ){
    formatSeconds(0);
    clearInterval(myInterval);
    $('.hudgangtime').html("00:00"); 
    $('.hudgangpart').fadeOut(400);
    $.post('https://bp_hud/finishgang', JSON.stringify({}));
  }
}


const formatSeconds = (secs) => {
  const pad = (n) => n < 10 ? `0${n}` : n;

  const h = Math.floor(secs / 3600);
  const m = Math.floor(secs / 60) - (h * 60);
  const s = Math.floor(secs - h * 3600 - m * 60);

  return `${pad(m)}:${pad(s)}`;
}


function inserthudinfos(data){
  // ------- hud menu insert ------------------------------
  $("#thisbitc").val(data.needhud.position);
  $("#thisbitc4").val(data.needhud.style);
  $('#neeedhudcheck1').prop('checked', data.needhud.hudstate);
  $('#neeedhudcheck2').prop('checked', data.needhud.textstate);
  $("#hudcolor1").val(data.needhud.iconcolor);
  $("#hudcolor2").val(data.needhud.progcolor);
  $("#myRange").val(data.needhud.size);
  // ------- hud menu bank insert ------------------------------

   $("#thisbitc2").val(data.bankcash.position);
   $('#bankcashcheck').prop('checked', data.bankcash.hudstate);
   $("#hudcolor3").val(data.bankcash.iconcolor);
   $("#hudcolor4").val(data.bankcash.progcolor);
   $("#myRange2").val(data.bankcash.size);
  // ------- hud menu top insert ------------------------------
  $('#tophudcheck1').prop('checked', data.topmenu.onlinestate);
  $('#tophudcheck2').prop('checked', data.topmenu.logostate);
  $('#tophudcheck4').prop('checked', data.topmenu.timestate);
  $('#tophudcheck3').prop('checked', data.weapon);

  // ------------------------------ map--------------------------------- 
   if (data.mapstyle == "normal"){
    $(".mapitems").removeClass("hover");
    $("#boxmapid").addClass("hover");
     mapstate = "normal"
   }else{
    $(".mapitems").removeClass("hover");
    $("#circlemapid").addClass("hover");
      mapstate = "circle"

   }
   
  // ------- hud vehicle insert ------------------------------
  $("#thisbitc3").val(data.vehmenu.position);
  $("#hudcolor7").val(data.vehmenu.iconcolor);
  $("#hudcolor5").val(data.vehmenu.progcolor);
  $("#myRange3").val(data.vehmenu.size);



}

var notifs = {}

function CreateNotification(data) {
  let $notification = $(document.createElement('div'));

  if (data.ntype == "error"){
     $notification.html('<div class="notify_wrapper_error"> <div class="notify_wrapper_img"> <img src="othericons/error-danger.svg" alt=""> </div> <div class="notify_wrapper_textpart"> <div class="notify_wrapper_textpart_top">ERROR</div> <div class="notify_wrapper_textpart_bottom">'+data.ntext+'</div> </div> <div class = "doktorbune1"> </div></div>')

  }

  if (data.ntype == "info"){
    $notification.html('<div class="notify_wrapper_warning"> <div class="notify_wrapper_img"> <img src="othericons/info.svg" alt=""> </div> <div class="notify_wrapper_textpart"> <div class="notify_wrapper_textpart_top">INFO</div> <div class="notify_wrapper_textpart_bottom">'+data.ntext+'</div> </div><div class = "doktorbune3"> </div>  </div>')
 }

 if (data.ntype == "success"){
  $notification.html('<div class="notify_wrapper_success"> <div class="notify_wrapper_img"> <img src="othericons/success-check.svg" alt=""> </div> <div class="notify_wrapper_textpart"> <div class="notify_wrapper_textpart_top">SUCCESS</div> <div class="notify_wrapper_textpart_bottom">'+data.ntext+'</div> </div> <div class = "doktorbune2"> </div> </div>')
}
  

  $notification.fadeIn();
  if (data.style !== undefined) {
      Object.keys(data.style).forEach(function(css) {
          $notification.css(css, data.style[css])
      });
  }

  return $notification;
}


function ShowNotif(data) {

      if (data.id != null) {
          if (notifs[data.id] === undefined) {
              let $notification = CreateNotification(data);
              $('.hudnotifypart').append($notification);
              notifs[data.id] = {
                  notif: $notification,
                  timer: setTimeout(function() {
                      let $notification = notifs[data.id].notif;
                      $.when($notification.fadeOut()).done(function() {
                          $notification.remove();
                          clearTimeout(notifs[data.id].timer);
                          delete notifs[data.id];
                      });
                  }, data.length != null ? data.length : 2500)
              };
          } else {
              clearTimeout(notifs[data.id].timer);
              // UpdateNotification(data);

              notifs[data.id].timer = setTimeout(function() {
                  let $notification = notifs[data.id].notif;
                  $.when($notification.fadeOut()).done(function() {
                      $notification.remove();
                      clearTimeout(notifs[data.id].timer);
                      delete notifs[data.id];
                  });
              }, data.length != null ? data.length : 2500)
          }
      } else {
          let $notification = CreateNotification(data);
          $('.hudnotifypart').append($notification);
          setTimeout(function() {
              $.when($notification.fadeOut()).done(function() {
                  $notification.remove()
              });
          }, data.length != null ? data.length : 2500);
      }
  
}

function startprogbar(text,time){
  $('.hudloadingpart').fadeIn(300);
  $('.hudloadingtext1').html(text);
  // $('.hudloadingtext2').html(text);

  

  var saylen = 0 
  var count = $("#dots span").length;
  var speed = 5000/count;
  $("#dots span").each(function(index){
    
    $(this).delay(speed*index).queue(function(next){
      
      saylen = saylen + 1
      if (saylen == 36){
          finishthis();
      }
   
      $(this).css('background-color', '#f3a84f');
      next();
    });
  });
}

function finishthis(){
  $('.hudloadingpart').fadeOut(300);

  var count = $("#dots span").length;
  var speed = 1/count;
  $("#dots span").each(function(index){
    
    $(this).delay(speed*index).queue(function(next){
      
  
    
      $(this).css('background-color', 'rgba(255, 255, 255, 0.14)');
      next();
    });
  });
  $.post('https://bp_hud/finishprogbar', JSON.stringify({}));


}

function changehudset(hud, all){

  // ---------------- hud icon 1---------------------------------
 
  $('#tten').attr('fill', hud.iconcolor)
  $('#tten2').attr('fill', hud.iconcolor)
  $('#tten3').attr('fill', hud.iconcolor)
  $('#tten4').attr('fill', hud.iconcolor)
  $('#tten5').attr('fill', hud.iconcolor)
  $('#tten6').attr('fill', hud.iconcolor)
  $('#tten6').attr('fill', hud.iconcolor)
  $('#tten7').attr('fill', hud.iconcolor)
  $('#tten8').attr('fill', hud.iconcolor)
  $('#tten9').attr('fill', hud.iconcolor)
  $('#tten10').attr('fill', hud.iconcolor)
  $('#tten11').attr('fill', hud.iconcolor)

   // ---------------- hud prog 1---------------------------------

   run1color = hud.progcolor;
   ciger1color = hud.progcolor;
   brain1color = hud.progcolor;
   health1color = hud.progcolor;
   armour1color = hud.progcolor;
   water1color = hud.progcolor;
   food1color = hud.progcolor;


   
   // ---------------- hud prog 2---------------------------------

   run2color = hud.progcolor;
   ciger2color = hud.progcolor;
   brain2color = hud.progcolor;
   health2color = hud.progcolor;
   armour2color = hud.progcolor;
   water2color = hud.progcolor;
   food2color = hud.progcolor;
 


  // ---------------- hud icon 2---------------------------------

  $('#tten12').attr('fill', hud.iconcolor)
  $('#tten13').attr('fill', hud.iconcolor)
  $('#tten14').attr('fill', hud.iconcolor)
  $('#tten15').attr('fill', hud.iconcolor)
  $('#tten16').attr('fill', hud.iconcolor)
  $('#tten17').attr('fill', hud.iconcolor)
  $('#tten18').attr('fill', hud.iconcolor)
  $('#tten19').attr('fill', hud.iconcolor)
  $('#tten20').attr('fill', hud.iconcolor)
  $('#tten21').attr('fill', hud.iconcolor)
  $('#tten22').attr('fill', hud.iconcolor)
  $('#tten23').attr('fill', hud.iconcolor)
  $('#tten24').attr('fill', hud.iconcolor)


  // ---------------------------------- bank hud ---------------------------------------
  $('#cashiconid1').attr('fill', all.bankcash.iconcolor)
  $('#cashiconid2').attr('fill', all.bankcash.iconcolor)
  $('#cashiconid3').attr('fill', all.bankcash.iconcolor)

  $('#topiconcolorchange1').attr('fill', all.bankcash.iconcolor)
  $('#topiconcolorchange2').attr('fill', all.bankcash.iconcolor)
  $('#topiconcolorchange3').attr('fill', all.bankcash.iconcolor)


  $('#bucash').css('color', all.bankcash.progcolor)
  $('#rotation1').css('color', all.bankcash.progcolor)
  $('#onlineid').css('color', all.bankcash.progcolor)
  $('#impulscolor').css('color', all.bankcash.progcolor)

  
  $(".hudmapmoneypart").animate({ 'zoom': all.bankcash.size }, 200);


  



   // ---------------- hud settings---------------------------------

   if (hud.textstate){
    if (hud.style == "normal"){
      if (hud.position == "right-center"){
        $('.statustext').fadeIn(200);
      }else{
        $('.statustext').fadeOut(200);
      }
      
    }else{
      $('.statustext2').fadeIn(200);

    }
   
    

   }else{
    if (hud.style == "normal"){
      $('.statustext').fadeOut(200);
    }else{
      $('.statustext2').fadeOut(200);

    }
   

   }


  // ---------------- hud  size---------------------------------
  if (hud.style == "normal"){
    
     $(".hudpstatuspart").animate({ 'zoom': hud.size }, 200);
  }else{
    $(".hudpstatuspart2").animate({ 'zoom': hud.size }, 200);


  }

  // ------ veh hud position and others-------------------------------
  $(".hudvehiclespeedo").animate({ 'zoom': all.vehmenu.size }, 200);


  // -------------------------- veh color ------------------------------------------
  //  console.log(hud.progcolor)

  // armorbar2 = new ldBar("#armourstatuscontainer2");
  //  burgerbar2 = new ldBar("#foodstatuscontainer2");
  //  waterbar2 = new ldBar("#waterstatuscontainer2");
  //  stressbar2 = new ldBar("#brainstatuscontainer2");
  //  staminabar2 = new ldBar("#runstatuscontainer2");
  //  cigerbar2= new ldBar("#cigerstatuscontainer2");
  


  
   

  
}


function formatMoney (raw) {

  return Number(raw).formatMoney(2, ',', '.');
  
}





Number.prototype.formatMoney = function (fractionDigits, decimal, separator) {
  fractionDigits = isNaN(fractionDigits = Math.abs(fractionDigits)) ? 2 : fractionDigits;
  
  decimal = typeof (decimal) === "undefined" ? "." : decimal;
  
  separator = typeof (separator) === "undefined" ? "," : separator;
  
  var number = this;
  
  var neg = number < 0 ? "-" : "";
  
  var wholePart = parseInt(number = Math.abs(+number || 0).toFixed(fractionDigits)) + "";
  
  var separtorIndex = (separtorIndex = wholePart.length) > 3 ? separtorIndex % 3 : 0;
  
  return neg +
  
  (separtorIndex ? wholePart.substr(0, separtorIndex) + separator : "") +
  
  wholePart.substr(separtorIndex).replace(/(\d{3})(?=\d)/g, "$1" + separator) +
  
  (fractionDigits ? decimal + Math.abs(number - wholePart).toFixed(fractionDigits).slice(2) : "");
  
};

$(document).ready(function(){
  $( ".hudmenu_main_button" ).click(function() {
       var needhudposition = $('#thisbitc').val();
       var needhudstyle = $('#thisbitc4').val();
       var needhudcheck1 = $('#neeedhudcheck1').prop('checked') 
       var needhudcheck2 = $('#neeedhudcheck2').prop('checked') 
       var needhudcolor1 = $('#hudcolor1').val();
       var needhudcolor2 = $('#hudcolor2').val();
       var needhudslider1 = $('#myRange').val();

     //  --------------------------------------

       var bankcashposition = $('#thisbitc2').val();
       var bankcashcheck1 = $('#bankcashcheck').prop('checked') 
       var bankcashcolor1 = $('#hudcolor3').val();
       var bankcashcolor2 = $('#hudcolor4').val();
       var bankslider1 = $('#myRange2').val();

    //  --------------------------------------
      var tophudcheck1 = $('#tophudcheck1').prop('checked') 
      var tophudcheck2 = $('#tophudcheck2').prop('checked') 
      var tophudcheck3 = $('#tophudcheck3').prop('checked') 
      var tophudcheck4 = $('#tophudcheck4').prop('checked') 

    //  --------------------------------------
      var mapselect = mapstate;

     //  --------------------------------------

       
       var vehiclehudposition = $('#thisbitc3').val();
       var vehhudcolor1 = $('#hudcolor7').val();
       var vehhudcolor2 = $('#hudcolor5').val();
       var vehhudslider1 = $('#myRange3').val();

       $.post('https://bp_hud/confirchange', JSON.stringify({
          needhud:{
            iconcolor : needhudcolor1,
            progcolor : needhudcolor2,
            hudstate : needhudcheck1,
            textstate : needhudcheck2,
            size : needhudslider1,
            position : needhudposition,
            style : needhudstyle
          },
          bankcash : {
            iconcolor : bankcashcolor1,
            progcolor : bankcashcolor2,
            position : bankcashposition,
            hudstate : bankcashcheck1,
            size : bankslider1

            
          },
          topmenu: {
            onlinestate: tophudcheck1,
            logostate : tophudcheck2,
            timestate : tophudcheck4
          },
          weapon: tophudcheck4,
          mapstyle : mapselect,
          vehmenu : {
            iconcolor: vehhudcolor1,
            progcolor: vehhudcolor2,
            position: vehiclehudposition,
            size: vehhudslider1
          }



       }));
  });


  $( "#circlemapid" ).click(function() {
    $(".mapitems").removeClass("hover");
    $("#circlemapid").addClass("hover");
    mapstate = "circle"
  });

  $( "#boxmapid" ).click(function() {
    $(".mapitems").removeClass("hover");
    $("#boxmapid").addClass("hover");
    mapstate = "normal"

  });


  $( ".hudmenu_main_updatebutton" ).click(function() {
    $.post('https://bp_hud/resethud', JSON.stringify({}));
    $('.hudmenupart').fadeOut(300);
    
  });
  


});



document.onkeyup = function(data) {
    
  if ( data.which == 27) {     

      $('.hudmenupart').fadeOut(500);
      $.post('https://bp_hud/exit', JSON.stringify({}));
  
  }
}