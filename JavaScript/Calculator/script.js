var displayDiv = document.querySelector("#display");
var firstNum = ""
var secondNum = ""
var op = ""

function press(number) {
    firstNum += number
    displayDiv.innerHTML = firstNum
}

function setOP(key) {
    op = key
    secondNum = firstNum
    firstNum = ""
}

function clr() {
    firstNum = ""
    secondNum = ""
    displayDiv.innerHTML = "0"
}

function calculate() {
    let a = parseFloat(secondNum)
    let b = parseFloat(firstNum)
    let result = 0
    switch (op) {
        case "+":
            result = a + b
            break
        case "-":
            result = a - b
            break
        case "*":
            result = a * b
            break
        case "/":
            result = a / b
            break
    }
    firstNum = result
    op = ""
    displayDiv.innerHTML = firstNum
}