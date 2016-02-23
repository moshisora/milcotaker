## milcotaker

This repository is the development repository of application for note take using Milkcocoa real time data transmission service.

## Using

* [Milkcocoa](https://mlkcca.com)
* AngularJS 1.4.x
* [generator-gulp-angular](https://github.com/Swiip/generator-gulp-angular)

## Setup
gulp is used as build system helper. Install node packages and bower component in root direcory of repo.

```
$ npm install
$ bower install
```

### gulp tasks
* `$ gulp serve` : start local server for development connectable as localhost port 3000.
* `$ gulp clean` : remove temporary files and directories. please exec this task when you create, rename, remove or replace any src files.
* `$gulp build` : make application files for distribution. it include compile CoffeeScript and sass files.

## License
MIT
