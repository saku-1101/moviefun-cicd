# CI/CD achieved Moviefun 🍿🎥🎞️
https://moviefun-cicd-75zzd2vyqa-an.a.run.app/


## CI/CD Pipeline Architecture
#### What is the point?
Continuous Integration and Continuous Delivery, known as CI and CD, introduces projects to an ongoing automation and continuous monitoring of having developers frequently check their code（testing）, build their code(building), and even deploy their code(deploying). Achieving this steps allows developers more focus on coding than being mindful of the infrastructure or the environment as well as  persistent and stable supply of the product, and which ends up with the success of the development team working in an agile way either DevOps or SRE.
### Motivation
Developing alone drives me to relentless boredom. Instead, developing a project alone thinking as if there is someone who's working with me offers more fun. Besides, this agile way of working on the project would allow me to get used to up-coming teamwork as soon as possible.　The pipline also supports the safe and agile product supply to the user, and which means we, the developers, can make the world the way happier ASAP.

### Architecture
  1. GitHub repository for storing our code
  2. Cloud Build for doing some automation
  3. Container Registry to store Docker container image
  4. Cloud Run for hosting our app
As we always do, first, I commit&push the entire project's code to the github repository(here) that includes cloudbuild.yaml file, which is a build configulation schema to enable [Cloud Build](https://cloud.google.com/build) automation work. Then, the [Cloud Build](https://cloud.google.com/build) that is set to trigger the specific branch's push action would be activated, and start doing its job - build the container image, creation of [Container Registry](https://cloud.google.com/container-registry) and push the image to [Container Registry](https://cloud.google.com/container-registry), and finally, activate the [Cloud Run](https://cloud.google.com/run) to deploy the project to the Internet. So, Git repository, Container Registry, and Cloud Run are all under controll of Cloud Build.

  <img width="434" alt="image" src="https://user-images.githubusercontent.com/74392116/212459155-725bd2ea-f85a-4d4d-be84-518265077d55.png">


### Development flow
<img width="685" alt="image" src="https://user-images.githubusercontent.com/74392116/212458666-52758b6b-5818-42b1-ba54-d1ee82bb5974.png">

## Build Setup

```bash
# install dependencies
$ npm install

# serve with hot reload at localhost:3000
$ npm run dev

# build for production and launch server
$ npm run build
$ npm run start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, check out the [documentation](https://nuxtjs.org).

## Special Directories

You can create the following extra directories, some of which have special behaviors. Only `pages` is required; you can delete them if you don't want to use their functionality.

### `assets`

The assets directory contains your uncompiled assets such as Stylus or Sass files, images, or fonts.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/assets).

### `components`

The components directory contains your Vue.js components. Components make up the different parts of your page and can be reused and imported into your pages, layouts and even other components.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/components).

### `layouts`

Layouts are a great help when you want to change the look and feel of your Nuxt app, whether you want to include a sidebar or have distinct layouts for mobile and desktop.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/layouts).


### `pages`

This directory contains your application views and routes. Nuxt will read all the `*.vue` files inside this directory and setup Vue Router automatically.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/get-started/routing).

### `plugins`

The plugins directory contains JavaScript plugins that you want to run before instantiating the root Vue.js Application. This is the place to add Vue plugins and to inject functions or constants. Every time you need to use `Vue.use()`, you should create a file in `plugins/` and add its path to plugins in `nuxt.config.js`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/plugins).

### `static`

This directory contains your static files. Each file inside this directory is mapped to `/`.

Example: `/static/robots.txt` is mapped as `/robots.txt`.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/static).

### `store`

This directory contains your Vuex store files. Creating a file in this directory automatically activates Vuex.

More information about the usage of this directory in [the documentation](https://nuxtjs.org/docs/2.x/directory-structure/store).
