module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      build:
        files:
          "jquery.exposer.js": "jquery.exposer.js.coffee"

  grunt.loadNpmTasks("grunt-contrib-coffee")

  grunt.registerTask("default", ["coffee:build"])
