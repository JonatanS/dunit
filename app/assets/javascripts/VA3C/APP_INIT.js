/**
 * Created by benjamin howes on 12/30/2014.
 */

//contains the jquery document.ready callback, which starts the application

$(document).ready(function(){

    //set up and initialize dat.gui controls
    VA3C.uiVariables = new VA3C.UiConstructor();
    VA3C.datGui = new dat.GUI();
    VA3C.datGui.width = 300;

    //add a file folder containing the file open button
    var fileFolder = VA3C.datGui.addFolder('File');
    fileFolder.add(VA3C.uiVariables, 'openLocalFile');
    //fileFolder.add(VA3C.uiVariables, 'openUrl'); //not working yet - commenting out for now


    //add scene folder
    var sceneFolder = VA3C.datGui.addFolder('Scene');
    //background color control
    sceneFolder.addColor(VA3C.uiVariables, 'backgroundColor').onChange(function(e){
        //set background color
        VA3C.renderer.setClearColor(e);
    });
    sceneFolder.addColor(VA3C.uiVariables, 'ambientLightColor').onChange(function(e){
        VA3C.lightingRig.setAmbientLightColor(e);
    });
    //scene fog
    //sceneFolder.add(VA3C.uiVariables, 'fog').onChange(function(e){
    //        VA3C.lightingRig.setFog(e);
    //    });


    //add view folder
    var viewFolder = VA3C.datGui.addFolder('View and Selection');
    //zoom extents and selected
    viewFolder.add(VA3C.uiVariables, 'zoomExtents');
    viewFolder.add(VA3C.uiVariables, 'zoomSelected');
    //change color of selected object's material
    viewFolder.addColor(VA3C.uiVariables, 'selectedObjectColor').onChange(function(e){
        VA3C.attributes.setSelectedObjectColor(e);
    });
    viewFolder.add(VA3C.uiVariables, 'showStats').onChange(function(e){
        if(e){
            $('#Stats_output').show();
        }
        else{
            $('#Stats_output').hide();
        }
    });


    //add a lighting folder
    var lightsFolder = VA3C.datGui.addFolder('Lighting');
    //light colors
    lightsFolder.addColor(VA3C.uiVariables, 'pointLightsColor').onChange(function(e){
        VA3C.lightingRig.setPointLightsColor(e);
    });
    lightsFolder.add(VA3C.uiVariables, 'shadows').onChange(function(e){
        VA3C.lightingRig.shadowsOnOff(e);
    });
    /*//solar az and alt
    lightsFolder.add(VA3C.uiVariables, 'solarAzimuth')
        .min(0)
        .max(359)
        .step(1);
    lightsFolder.add(VA3C.uiVariables, 'solarAltitude')
        .min(0)
        .max(90)
        .step(0.1);*/




    //hide the dat.gui close controls button
    //$(".close-button").css('visibility', 'hidden');


    //Jquery UI stuff - make divs draggable, resizable, etc.

    //make the file open divs draggable
    $(".openFile").draggable( {containment: "parent"});

    //make the attributes div draggable and resizeable
    $('.attributeList').draggable( {containment: "parent"});
    //$('.attributeList').resizable();

    //hide the stats div - we'll turn it on / off with the UI
    $('#Stats_output').hide();


    //load our sample JSON file - for development of the colored meshes from GH
    //$.getJSON("./js/rvtenergy.json", function( data ){
        //https://dl.dropboxusercontent.com/s/w4xlwfkl2kdvnu2/va3c.json?dl=0
    $.getJSON("https://dl.dropboxusercontent.com/s/w4xlwfkl2kdvnu2/va3c.json?dl=0", function( data ){
        VA3C.jsonLoader.loadSceneFromJson(data);
    });

});