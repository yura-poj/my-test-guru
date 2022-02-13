$(document).on('turbolinks:load', function (){
    $('.feedback-link').on('click', FeedbackLinkHandler)

})

function FeedbackLinkHandler(event){
    event.preventDefault()

    let link =  document.querySelector('.feedback-link')
    let $form = $('.feedback')

    $form.toggle()

    if ($form.is(':visible')){
        link.textContent = 'Cancel'
    } else{
        link.textContent = 'Feedback'
    }
}