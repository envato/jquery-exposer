Exposer = ( element, options ) ->
  @options = $.extend {}, @defaults, options
  @element = element
  @$element = $(element)
  @init()
  this

Exposer::defaults =
  exposer: '.exposer'
  exposeeClass: 'hidden'
  destroyParent: false
  parent: false

Exposer::init = ->
  @$element.on 'click.exposer', @options.exposer, ( event ) =>
    $( event.delegateTarget ).find( '.' + @options.exposeeClass ).removeClass( @options.exposeeClass )

    if @options.destroyParent
      $parentElement = if @options.parent then $( @options.parent ) else $( event.target ).parent()
      $parentElement.remove()
    else
      $( event.target ).remove()

    event.preventDefault()

$.fn.exposer = ( options ) ->
  this.each ->
    $this = $( this )

    if $this.data( 'plugin_exposer' ) is undefined
      plugin = new Exposer( this, options )
      $this.data( 'plugin_exposer', plugin )
