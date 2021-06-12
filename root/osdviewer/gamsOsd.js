/** how to embed a gams osd instance into your o:* html representation:
 *
 * include openseadragon.min.js into the head of your page,
 * create a div that holds the id "vwr-content" at the position you
 * want the vwr to appear and assign a fixed width and height to it,
 * include the gamsOsd.js after #vwr-content,
 * and voilà, you did it!
 *
 *
 *
 * the pid of your o:* will be picked out of the url of the object,
 * and all the images referenced in your object will be displayed in
 * the vwr.
 *
 * now you can start to style your very own osd  vwr...
 *
 *
 **/
 
 /**
 *
 * options added for gams customization
 * 
 * @propert {String} pid
 * 
 * @property {Boolean} [showIiifLabels=false]
 *  Set true to show prospective Iiif-labels of the images
 * 
 **/

//TODO paket soll enthalten openseadragon min + gamsOsd und gamsosd min

function getParams(query) {
    var params = {
    };
    query.replace(/([^=&]+)=([^&]*)/g, function (string, key, value) {
        params[key] = value;
    });
    return params;
};

/*function getPid(path) {
var pid = path.match(/o:.[^\/]+/)[0];
return pid;
}; */

function loadIiifpTileSources () {
    // TODO
};

function loadExternalTileSources (url, options) {
    
    // TODO using promises for that maybe?
    
    jQuery.ajax({
        url: url,
        dataType: 'json',
        async: true,
        success: function (json) {
            options.tileSources = json.images;
           
            initOsd(options);
        },
        
        error: function () {
            console.log("Failed loading " + url);
        }
    })
};



function getTileSourcesUrl (options) {
    
    // TODO error handling if no pid is
    // TODO you can hand over a pid or an url to the iiifp interface
    
    var manifestUri;

    if (options.pid) {
        console.log('test');
        if (options.pid.match(/http:/)) {
        
                manifestUri = options.pid.replace(/http:/, 'https:') + "/sdef:IIIF/getTileSources";
	}
        else {
        manifestUri = options.pid + "/sdef:IIIF/getTileSources";
        }
    } else {
        var query = window.location.search.substring(1);
        
        manifestUri = getParams(query).manifest
    }
    
    return manifestUri;
};

function gamsOsd(options) {
    
    // TODO what if user wants to explicitly specify tileSources
    
    if (options.tileSources) {
        initOsd(options);
    } else {
        var url = getTileSourcesUrl(options);
        loadExternalTileSources(url, options);
    }
};



/*

at first get an array of all ids of all pics that are in the site!
collect the ids from the json that should eventually lead to an iiifp,
at the moment i see the possibility for `{"id":"this-id", "service": "service-uri", "label": "this-label"} `

+ frag jo weg. personalisierter xml2json

var ids_of_pics_to_be_considered = [];

then look if scroll id is in the pic list as a href is in the nav list,
and if! fire


 */
 
 
function initOsd(options) {

    
    console.log(options);
    
    // we create the global object viewer to which we attach the osd,
    // 
    
    var viewer = {};
    

    // make an edition property Edition.viewer - which is a widget. in our case it's osd
    viewer.osd = OpenSeadragon (options);
    viewer.iiifManifestUri = options.pid + "/sdef:IIIF/getManifest";
    
    
    if (options.source) {
        viewer.datastream = options.source;
    };
    
    
    // TODO make a separate function for that, don't forget
    // function scope
    
    if (options.showIiifLabels == true) {
        
       var request = jQuery.ajax({
        url: viewer.iiifManifestUri,
        dataType: 'json',
        async: true
       });
    
        // jquery deferred object
        request.done(function(iiifManifest)
        {
          var manifest = iiifManifest;
          var canvases = manifest.sequences[0].canvases;
          var initialPage = viewer.osd.initialPage;
          var firstLabel = canvases[initialPage].label;
          
          var jLabelDiv = jQuery('<div id="osd-label">'
               + '</div>');
          var labelDiv = document.createElement('div');
          labelDiv.id = 'osd-label';
          var p = document.createElement('p');
          p.innerHTML = firstLabel;
          labelDiv.appendChild(p);   
          
          var controlOptions = {'anchor': 'ABSOLUTE', 'attachToViewer': true, 'autoFade': true}
          
          viewer.osd.addControl(labelDiv, controlOptions);
          
          jQuery('#osd-label').css('background-color', '#474747')
                   .css('color', 'white')
                   .css('position', 'absolute')
                   .css('top', '50px');
          
          
          // does this has to be in the deferred obj?
          
          viewer.osd.addHandler('page', function (event) {
            
            var currentPage = event.page;
            var label = canvases[currentPage].label;
            
            jQuery('#osd-label > p').html(label);
        });
          
            
        })
        
        
        
        
    }
    
    console.log(OpenSeadragon.Viewer);
    

    
    
    
    
};












