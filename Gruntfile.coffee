module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      build:
        files:
          "jquery.exposer.js": "jquery.exposer.js.coffee"
      buildTest:
        files:
          "jquery.exposer_spec.js": "jquery.exposer_spec.js.coffee"

    jasmine:
      test:
        src: 'jquery.exposer.js',
        options:
          specs: 'jquery.exposer_spec.js'
          vendor:
            "http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"


  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks('grunt-contrib-jasmine')

  grunt.registerTask("default", ["coffee:build"])
  grunt.registerTask("test", ["coffee:buildTest","jasmine"])
