let pizza1 = {
    crustType: "deep dish",
    sauceType: "traditional ",
    cheeses: "shredded mozzarela ",
    toppings: ["pepperoni ", "sausage "],
    pizzaOven: function () {
        console.log("Crust type will be:  " + this.crustType)
        console.log("Sauce chosen:        " + this.sauceType)
        console.log("Cheeses added:       " + this.cheeses)
        console.log("Additional toppings: " + this.toppings)
    }
}
console.log("First pizza will have: ")
pizza1.pizzaOven()


let pizza2 = {
    crustType: "hand tossed ",
    sauceType: "marinara ",
    cheeses: ["shredded mozzarela ", "feta"],
    toppings: ["mushrooms ", "olives ", "onions"],
    pizzaOven: function () {
        console.log("Crust type will be:  " + this.crustType)
        console.log("Sauce chosen:        " + this.sauceType)
        console.log("Cheeses added:       " + this.cheeses)
        console.log("Additional toppings: " + this.toppings)
    }
}
console.log("Second pizza will have: ")
pizza2.pizzaOven()


let pizzaCustom1 = {
    crustType: "thin",
    sauceType: "pesto",
    cheeses: ["shredded mozzarela ", "fresh mozzarela ", "feta cheese "],
    toppings: ["olives ", "pepperoni ", "bacon ", "tomato ", "sausage ", "ham ", "garlic "],
    pizzaOven: function () {
        console.log("Crust type will be:  " + this.crustType)
        console.log("Sauce chosen:        " + this.sauceType)
        console.log("Cheeses added:       " + this.cheeses)
        console.log("Additional toppings: " + this.toppings)
    }
}
console.log("My first custom pizza will consist of:")
pizzaCustom1.pizzaOven()


let pizzaCustom2 = {
    crustType: "deep dish ",
    sauceType: "marinara ",
    cheeses: ["shredded mozzarela ", "fresh mozzarela "],
    toppings: ["bacon ", "tomato ", "ham ", "garlic "],
    pizzaOven: function () {
        console.log("Crust type will be:  " + this.crustType)
        console.log("Sauce chosen:        " + this.sauceType)
        console.log("Cheeses added:       " + this.cheeses)
        console.log("Additional toppings: " + this.toppings)
    }
}
console.log("My second custom pizza will consist of:")
pizzaCustom2.pizzaOven()