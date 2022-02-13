$(document).on('turbolinks:load', function (){
    let $forms =  $('.form-inline-link').on('click', formInlineLinkHandler)

    let errors = document.querySelector('.resource-errors')

    if (errors && $forms.length > 0) {
        let resourceId = errors.dataset.resourceId
        formInlineHandler(resourceId)
    }
})

function formInlineLinkHandler(event){
    event.preventDefault()
    let testId = this.dataset.testId

    formInlineHandler(testId)
}

function formInlineHandler(testId){
    let link = document.querySelector('.form-inline-link[data-test-id="'+ testId + '"]')
    let $testTitle = $('.test-title[data-test-id="'+ testId + '"]')
    let $formInLine = $('.form-inline[data-test-id="'+ testId + '"]')

    $formInLine.toggle()
    $testTitle.toggle()

    if ($formInLine.is(':visible')){
        link.textContent = 'Cancel'
    } else{
        link.textContent = 'Edit'
    }
}
