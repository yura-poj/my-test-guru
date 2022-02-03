$(document).on('turbolinks:load', function (){
    let $progressbar = $('.test-passage-progress')
    let $child = $progressbar.children('progress')
    if ($progressbar && $child.length > 0) {
        let progress = $progressbar.data('progress')
        $child.attr('value', progress)
    }

})
