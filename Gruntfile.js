/*global module:false*/
module.exports = function(grunt) {
  grunt.loadNpmTasks('grunt-clean');
  grunt.loadNpmTasks('grunt-coffee');
  grunt.loadNpmTasks('grunt-compass');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-smushit');
  grunt.loadNpmTasks('grunt-yui-compressor');
  // Project configuration.
  grunt.initConfig({
    pkg: '<json:package.json>',
    meta: {
      banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - ' +
        '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
        '<%= pkg.homepage ? "* " + pkg.homepage + "\n" : "" %>' +
        '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
        ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */'
    },
    clean: {
      // Be careful, never use this task alone, always use it after grunt copy!!!
      folder: ['app/assets/images/*', 'app/assets/compressed']
    },
    coffee: {
      modules: {
        src: ['app/assets/**/*.coffee']
      }
    },
    compass: {
      dev: {
        src: 'app/assets/styles/',
        dest: 'app/assets/styles/',
        outputstyle: 'expanded',
        linecomments: true,
        images: 'public/img',
        relativeassets: false,
        forcecompile: true
      }
    },
    cssmin: {
      dist: {
        src: ['app/assets/styles/*.css'],
        dest: 'public/css/style.css'
      }
    },
    lint: {
      files: ['grunt.js', 'app.coffee', 'src/scripts/*.coffee']
    },
    min: {
      dist: {
        src: 'app/assets/scripts/*.js',
        dest: 'public/js/script.js'
      }
    },
    smushit:{
      imgs: {
          src: 'app/assets/images'
      }
    },
    watch: {
      process: {
        files: ['app/assets/styles/**/*.sass', 'app/assets/images/*', 'app/assets/scripts/**/*coffee'],
        tasks: 'compass coffee min cssmin'
      }
    }
  });

  // Default task.
  grunt.registerTask('pub', 'smushit');
};