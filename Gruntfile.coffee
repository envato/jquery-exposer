module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      build:
        files:
          "jquery.exposer.js": "jquery.exposer.js.coffee",
          "jquery.exposer_spec.js": "jquery.exposer_spec.js.coffee"

    jasmine:
      test:
        src: 'jquery.exposer.js',
        options:
          specs: 'jquery.exposer_spec.js'
          vendor:
            "node_modules/jquery/dist/jquery.js"

    clean: ["jquery.exposer_spec.js"]

    watch:
      files: ["jquery.exposer.js.coffee", "jquery.exposer_spec.js.coffee"],
      tasks: ["coffee:build","jasmine", "clean"]

  grunt.loadNpmTasks("grunt-contrib-coffee")
  grunt.loadNpmTasks('grunt-contrib-jasmine')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask("default", ["watch"])

