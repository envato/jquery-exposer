describe 'jQuery.exposer', ->
  fixture = "
      <div class='js-parent container'>
        <b class='visible'>foo</b>
        <b class='visible'>foo</b>

        <b class='hidden'>foo</b>
        <b class='hidden'>foo</b>

        <div class='exposer-parent'>
          <a href='#' class='exposer'>Show more</a>
        </div>
      </div>
    "

  beforeEach ->
    @$fixture = $(fixture).appendTo("body")
    @$container = $( '.container' )
    @$exposer = $('.exposer')
    @$exposees = $('.hidden')

  afterEach -> @$fixture.remove()

  describe 'Initialising the plugin', ->
    it 'should be available on the jQuery object', ->
      expect( $.fn.exposer ).toBeDefined()

    it 'should be chainable', ->
      expect( @$container.exposer() ).toBe @$container

    it 'should have defaults', ->
      @$container.exposer()
      expect( @$container.data( 'plugin_exposer' ).defaults ).toBeDefined()

    it 'should have a default selector for the exposer', ->
      @$container.exposer()
      expect( @$container.data( 'plugin_exposer' ).defaults.exposer ).toBe '.exposer'

    it 'should have a default class for hidden elements to expose', ->
      @$container.exposer()
      expect( @$container.data( 'plugin_exposer' ).defaults.exposeeClass ).toBe 'hidden'

    it 'should not destroy an exposers parent by default', ->
      @$container.exposer()
      expect( @$container.data( 'plugin_exposer' ).defaults.destroyParent ).toBeFalsy()

    it 'should not override the targets parent by default', ->
      @$container.exposer()
      expect( @$container.data( 'plugin_exposer' ).defaults.parent ).toBeFalsy()

    it 'should override the defaults with custom options', ->
      customOptions =
        exposer: '.myExposer'
        exposeeClass: 'myThingThatNeedsExposing'
        destroyParent: true
        parent: '.myParentElement'

      @$container.exposer customOptions
      expect( @$container.data( 'plugin_exposer' ).options ).toEqual customOptions

  describe 'Clicking an exposer with the default options', ->
    beforeEach ->
      @$container.exposer()
      @$exposer.click()

    it 'should expose hidden elements', ->
      expect( @$exposees.hasClass 'hidden' ).toBeFalsy()

    it 'should destroy the exposer', ->
      expect( $( '.exposer' ).length ).toBe 0

    it 'should not destroy the exposers parent', ->
      expect( $( '.exposer-parent' ).length ).toBeTruthy()

  describe 'Clicking an exposer with the destroyParent option', ->
    beforeEach ->
      @$container.exposer( { destroyParent: true} )
      @$exposer.click()

    it 'should expose hidden elements', ->
      expect( @$exposees.hasClass 'hidden' ).toBeFalsy()

    it 'should destroy the exposers parent', ->
      expect( $( '.exposer-parent' ).length ).toBe 0


  describe 'Clicking an exposer with the destroyParent option and a parent option', ->
    beforeEach ->
      @$container.exposer( { destroyParent: true, parent: '.js-parent'} )
      @$exposer.click()

    it 'should expose hidden elements', ->
      expect( @$exposees.hasClass 'hidden' ).toBeFalsy()

    it 'should destroy the exposers parent', ->
      expect( $( '.js-parent' ).length ).toBe 0

  describe 'Clicking an exposer when you have multiple instances on the page', ->
    beforeEach ->
      @$fixture2 = $(fixture).appendTo("body")
      @$containers = $( '.container' )
      @$containers.exposer().first().find( '.exposer' ).click()

    afterEach -> @$fixture2.remove()

    it 'should expose hidden elements in the first container', ->
      expect( @$containers.first().find( '.hidden' ).length ).toBe 0

    it 'should not expose hidden elements in the second container', ->
      expect( @$containers.last().find( '.hidden' ).length ).toBeGreaterThan 0

