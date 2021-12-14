document.addEventListener('turbolinks:load', function (){
    var control = document.querySelector('.sort-by-title')

    control.addEventListener('click', function (){
        alert('Click')
    })
})
console.log('hey')