# Workflow: Deploy Shiny via heroku (on Windows)

Based on template: https://github.com/virtualstaticvoid/heroku-docker-r-shiny-app, which uses [heroku-docker-r][2] for Heroku, and https://github.com/STATWORX/blog/blob/master/shinyapp-in-docker.

## Register at heroku.com

* Register at heroku.com, install herko CLI tool 

Providing a credit card increases the free dynos

## Git repo for App and Organization

* Start a public or private GitHub repository, based on this template 

* Store app in directory `/app` including files
    - `global.R`: load packages, data etc.
    - `ui.R`: Define user interface
    - `server.R`: R operations, like generating plots etc.
    - `run.R`: Start shiny app

## Handling R Packages based on `renv`

Install package `renv` via 

```r
install.packages("renv")
```

Capture dependencies via

```r
renvt::init()
```

This generates a `renv.lock` file that we have to copy paste, the `Dockerfile` the following lines


## Create a heroku app

* Go to your GitHub repo, if necessary (re)initialize, i.e. open a command like (I work in an Ubuntu partion for windows)

```bash
# get the sources
git clone https://github.com/DigitalCausalityLab/colliderbias.git
cd colliderbias


# optionally, reinitialize git
rm -rf .git
git init
git add --all
git commit -m "initial"
```

* Create a new heroku app and provide a name (placeholder `appname`)

```bash
# create a new heroku application and deploy
heroku create appname --stack=container --region eu
git push heroku master

# view the application
heroku open
```



_______

## Links

* https://github.com/analythium/heroku-shiny
* https://github.com/virtualstaticvoid/heroku-docker-r-shiny-app
* https://www.statworx.com/en/content-hub/blog/how-to-dockerize-shinyapps/

____

```bash
# get the sources
git clone https://github.com/virtualstaticvoid/heroku-docker-r-shiny-app.git
cd heroku-docker-r-shiny-app


# optionally, reinitialize git
rm -rf .git
git init
git add --all
git commit -m "initial"
```







------

## License

MIT License. Copyright (c) 2020 Chris Stefano. See [MIT_LICENSE](MIT_LICENSE) for details.

[1]: https://shiny.rstudio.com
[2]: https://github.com/virtualstaticvoid/heroku-docker-r
