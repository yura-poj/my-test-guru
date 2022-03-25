$(document).on('turbolinks:load', function (){
    let time_left = document.querySelector('.time-left')
    if (time_left) {
        let $time_left = $('.time-left')
        let end = new Date($time_left.data('time'))
        let url = $time_left.data('url')
        SetTimer(end, time_left)
        setInterval(SetTimer, 1000, end, time_left, url)
    }
})
function SetTimer(end, time_left, url) {
    let second_left = (end - new Date()) / 1000
    let seconds, minutes = 0
    if (second_left < 0) {
        seconds = 0
        minutes = 0
        window.location.replace(url)
    } else {
        seconds = Math.floor(second_left % 60)
        minutes = Math.floor(second_left / 60)
    }
    time_left.textContent = 'Time left: ' + minutes + ':' + seconds
}
