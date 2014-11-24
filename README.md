detect-card-js
==============

Automatically detect payment card types with this JQuery plugin

## Usage
It's fairly simple:

1. Locate your card number input field with JQuery i.e. `$('input#cardNumber')`
2. Call `.detectCard()` on the your input field
3. Listen for the `cardChange` event
### Example

```Javascript
$("input#cardNumber").detectCard().on("cardChange", function(e, card) {

  // Assuming input of card number: 4111 111 1111 1111
  console.log(card.type);  // => "visa"
});
```

### Custom supported card types
You can also choose which card types you would like to support

```JS
$("input#cardNumber").detectCard({ supported: ['visa', 'mastercard', 'maestro']});
$("input#cardNumber").on("cardChange", function(e, card) {

  // Assuming input of card number: 4111 111 1111 1111
  console.log(card.type);      // => "visa"
  console.log(card.supported); // => true
});
```
### Demo
You can check out a live demo here: [Detect card type jquery] [1]

## Card types supported
Here is a list of available card types that will be detected:
```
visa
mastercard
maestro
american-express
discover
jcb
diners-club
```

Enjoy

[Chris Temple](http://christemple.github.io/)

  [1]: http://christemple.github.com/detect-card-js/        "Detect card type jquery"
