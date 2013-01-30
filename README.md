# Comum.cc

This project is about an open brand to be used as you want in your project.

## Contribute

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

To run the project in your machine you should just install the dependencies like so:

```
cd comum/
npm install
```

Then you can watch the SASS files with grunt:

```
grunt watch
```

### Contributing example

I'll show you how to add a new brand in the __endorse__ section:

1. Place a JPG image with 200x100px dimensions inside the _public/img/_ folder. Or you can place it inside the _app/assets/images/_ and then run:
```
grunt smushit
```
to optimize the image, then you just move it to the _public/img/_ folder.
2. Open the _app/controllers/application_controller.coffee_ file and add a new object into the _brands_ array.
3. That's it! You can push your contribution and I'll deploy it as soon as I can =)