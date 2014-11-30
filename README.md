jquery-exposer
==============

A jQuery plugin that removes a class from some elements when some exposer is clicked, then destroys the exposer (or, optionally, its parent)

Use it to expose a bunch of hidden elements when a user clicks "show more"

Instantiate the plugin on an element that is a common parent of the exposer & exposee/s

### Usage

`$(element).exposer()`

#### Options

* `exposer` - element to bind the action to (default `.exposer`)
* `exposeeClass` - class name to remove (default `.hidden`)
* `destroyParent` - flag to destroy the target element's parent (default `false`)
* `parent` - element to remove instead of direct parent when you need more control, requires `destoryParent : true` (default `false`)


```
$(element).exposer({
  exposer: '.item-faq-form__exposer',
  exposeeClass: 'js-hidden'
})
```

### Development

* `npm install`

run `grunt` to watch for file changes and run the CoffeeScript compilation and tests 
