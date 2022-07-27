const cards = document.querySelectorAll(".single-card")
cards.forEach((card) => card.addEventListener("click", flipCard));
function flipCard() {
    this.classList.toggle("flipCard")
}

const languagecards = document.querySelectorAll(".language-card")
languagecards.forEach((card) => card.addEventListener("click", flipLanguageCard));
function flipLanguageCard() {
    this.classList.toggle("flipCard")
}



var btn = document.querySelector("#btn")
btn.addEventListener('click', function (e) {
    e.preventDefault()
    var name = document.getElementById('name').value;
    console.log(name)
    var email = document.getElementById('email').value;
    console.log(email)
    var subject = document.getElementById('subject').value;
    console.log(subject)
    var message = document.getElementById('message').value;
    console.log(message)
    var body = 'name:' + name + '<br/> email: ' + email + '<br/> subject' + subject + '<br/> message' + message


    Email.send({
        Host: "smtp.elasticemail.com",
        Username: "dariuszirbo@gmail.com",
        Password: "30A2E1D07F3C913680DCC488D9D1D9B5C690",
        To: 'dariuszirbo@gmail.com',
        From: email,
        Subject: subject,
        Body: body
    }).then(
        message => alert(message)
    );
})

