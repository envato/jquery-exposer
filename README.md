jquery-exposer
==============

A jQuery plugin that removes a class from some elements when some exposer is clicked, then destroys the exposer (or, optionally, its parent)

Use it to expose a bunch of hidden elements when a user clicks "show more"

Instantiate the plugin on an element that is a common parent of the exposer & exposee/s

### Usage

`$(element).exposer()`

#### Options

* `exposer` - element to destroy (default `.exposer`)
* `exposeeClass` - class name to remove (default `.hidden`)


```
$(element).exposer({
  exposer: '.item-faq-form__exposer'
  exposeeClass: 'js-hidden'
})
```

### Development

* `npm install`

run `grunt` to compile the CoffeeScript

run `grunt test` to run the specs