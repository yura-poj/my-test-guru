window.onload=function() {
    document.addEventListener('turbolinks:load', function () {
        let password = document.getElementById('user_password')
        let password_confirm = document.getElementById('user_password_confirmation')

        password_confirm.addEventListener('input', function (){
            if (password_confirm.value) {
                if (password_confirm.value === password.value) {
                    password_confirm.classList.add('border-success')
                    password_confirm.classList.remove('border-danger')
                }
                else {
                    password_confirm.classList.add('border-danger')
                    password_confirm.classList.remove('border-success')
                }
            } else {
                password_confirm.classList.remove('border-danger')
                password_confirm.classList.remove('border-success')
            }
        })
    })
}
