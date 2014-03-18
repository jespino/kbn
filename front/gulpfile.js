var gulp = require("gulp");
var coffee = require("gulp-coffee");
var concat = require("gulp-concat");
var uglify = require("gulp-uglify");
var connect = require("gulp-connect");
var sass = require("gulp-sass");
var coffeelint = require("gulp-coffeelint");
var recess = require("gulp-recess");
var jshint = require("gulp-jshint");
var karma = require("gulp-karma");
var gutil = require("gulp-util");

var externalCSS = [
    "app/components/foundation/css/normalize.css",
    "app/components/foundation/css/foundation.css"
];

var externalJs = [
    "app/components/modernizr/modernizr.js",
    "app/components/jquery/dist/jquery.js",
    "app/components/lodash/dist/lodash.js",
    "app/components/angular/angular.js",
    "app/components/angular-route/angular-route.js",
    "app/components/angular-sanitize/angular-sanitize.js",
    "app/components/angular-animate/angular-animate.js",
    "app/components/i18next/i18next.js",
    "app/components/foundation/js/foundation.js",
    "app/components/Sortable/Sortable.js"
];

var coffeeSources = [
    "app/coffee/controllers.coffee",
    "app/coffee/directives.coffee",
    "app/coffee/app.coffee"
];

// define tasks here
gulp.task("default", ["dev", "watch", "connect"]);

gulp.task("dev", ["coffee", "sass", "libs"]);

gulp.task("pro", ["sass"], function() {
    gulp.src(coffeeSources)
        .pipe(coffee().on("error", gutil.log))
        .pipe(concat("app.js"))
        .pipe(uglify())
        .pipe(gulp.dest("app/dist/"));
    gulp.src(externalJs)
        .pipe(concat("libs.js"))
        .pipe(uglify())
        .pipe(gulp.dest("app/dist/"));
    gulp.src(externalCSS)
        .pipe(concat("libs.css"))
        .pipe(gulp.dest("app/dist/css/"));
});

gulp.task("coffee", function() {
    gulp.src(coffeeSources)
        .pipe(coffee().on("error", gutil.log))
        .pipe(concat("app.js"))
        .pipe(gulp.dest("app/dist/"));
});

gulp.task("hint", function() {
    gulp.src(coffeeSources)
        .pipe(coffee().on("error", gutil.log))
        .pipe(jshint())
        .pipe(jshint.reporter("default"))
});

gulp.task("sass", function() {
    gulp.src("app/sass/main.scss")
        .pipe(sass().on("error", gutil.log))
        .pipe(concat("app.css"))
        .pipe(gulp.dest("app/dist/css"));
});

gulp.task("libs", function() {
    gulp.src(externalJs)
        .pipe(concat("libs.js"))
        .pipe(gulp.dest("app/dist/"));
    gulp.src(externalCSS)
        .pipe(concat("libs.css"))
        .pipe(gulp.dest("app/dist/css/"));
});

gulp.task("lint", function() {
    gulp.src(coffeeSources)
        .pipe(coffeelint("coffeelint.json"))
        .pipe(coffeelint.reporter())
    gulp.src("app/sass/main.scss")
        .pipe(recess({strictPropertyOrder: false}))
});

gulp.task("build-tests", function() {
    gulp.src(["test/**/*.coffee"])
        .pipe(coffee({"bare": true}).on("error", gutil.log))
        .pipe(concat("tests.js"))
        .pipe(gulp.dest("test"));
});

gulp.task("test", ["coffee", "libs", "build-tests"], function() {
    gulp.src(["app/dist/libs.js", "app/dist/app.js", "test/tests.js"])
        .pipe(karma({configFile: "karma.conf.coffee", action: "run"}));
});

gulp.task("watch", function () {
    gulp.watch(["app/sass/*.scss", "app/sass/**/*.scss"], ["sass"]);
    gulp.watch(externalJs, ["libs"]);
    gulp.watch(["app/coffee/*.coffee", "app/coffee/**/*.coffee"], ["coffee"]);
});

gulp.task("connect", connect.server({
    root: ["app"],
    port: 9001,
    livereload: true,
}));
