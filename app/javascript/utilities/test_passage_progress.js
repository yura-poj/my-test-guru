$(document).on('turbolinks:load', function (){
    // let $progressbar = $('.test-passage-progress')
    // let size_question = $progressbar.data('size')
    // let $child = $progressbar.children('progress')
    // console.log( Number( $child.attr('value') ) + (100 / size_question ) )
    // $child.attr('value', Number( $child.attr('value') )+ (100 / size_question ) )
    // let $next_but = $('.next-answer').on('click', edit)

    let $progressbar = $('.test-passage-progress')
    let $child = $progressbar.children('progress')
    if ($child.length > 0) {
        let progress = $progressbar.data('progress')
        $child.attr('value', progress)
        console.log(progress)
    }

})
//
// function edit(){
//     let $progressbar = $('.test-passage-progress')
//     let size_question = $progressbar.data('size')
//     let progress = Number( $progressbar.data('progress')  )+ (100 / size_question )
//     $progressbar.data( 'progress' , progress )
//     alert(progress)
// }