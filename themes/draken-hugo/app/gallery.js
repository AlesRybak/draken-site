import blueimpGallery from 'blueimp-gallery/js/blueimp-gallery.min'

if (!!document.getElementById('links')) {
    document.getElementById('links').onclick = function (event) {
        event = event || window.event;
        var target = event.target || event.srcElement,
            link = target.src ? target.parentNode : target,
            options = {index: link, event: event},
            links = this.getElementsByTagName('a');
        blueimpGallery(links, options);
    };
}