// http://fancyapps.com/fancybox/#examples
$(document).ready(function() {
    $(".fancybox-thumb").fancybox({
        prevEffect	: 'none',
        nextEffect	: 'none',
        helpers	: {
            title	: {
                type: 'outside'
            },
            thumbs	: {
                width	: 100,
                height	: 100
            }
        }
    });
});