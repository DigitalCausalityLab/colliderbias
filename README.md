# Workflow: Deploy Shiny via heroku (on Windows)

Based on template: https://github.com/virtualstaticvoid/heroku-docker-r-shiny-app, which uses [heroku-docker-r][2] for Heroku.

## Register at heroku.com

* Register at heroku.com, install herko CLI tool 

Providing a credit card increases the free dynos

## Git repo for App and Organization

* Start a public or private GitHub repository, based on this template 

* Store app in directory `/app` including files
    - ui.R
    - server.R
    - run.R


## Handling R Packages based on `renv`

Install package `renv` via 

```r
install.packages("renv")
```

Capture dependencies via

```r
renvt::init()
```

This generates a `renv.lock` file that we have to copy paste, i.e., we have include in our 
`Dockerfile` the following lines




## 


_______


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

```bash
# create a new heroku application and deploy
heroku create appname --stack=container
git push heroku master

# view the application
heroku open
```







------

## License

MIT License. Copyright (c) 2020 Chris Stefano. See [MIT_LICENSE](MIT_LICENSE) for details.

[1]: https://shiny.rstudio.com
[2]: https://github.com/virtualstaticvoid/heroku-docker-r
