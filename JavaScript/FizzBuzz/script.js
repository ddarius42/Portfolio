let num = 1
for (var i = 1; i <= 100; i++) {
    if (num % 15 == 0) {
        console.log("FizzBuzz")
    }
    else if (num % 3 == 0) {
        console.log("fizz")
    }
    else if (num % 5 == 0) {
        console.log("buzz")
    }

    else console.log(num)
    num++
}