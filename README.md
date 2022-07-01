# Workflow: Deploy Shiny via heroku (on Windows)

Based on template: https://github.com/virtualstaticvoid/heroku-docker-r-shiny-app, which uses [heroku-docker-r][2] for Heroku.


* Register at heroku.com, install herko CLI tool 

* Start a public or private GitHub repository, based on the template 

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

* Modify organization of repo, store app in directory `/app` including files
    - ui.R
    - server.R
    - run.R


```bash
# create a new heroku application and deploy
heroku create --stack=container
git push heroku master

# view the application
heroku open
```







------

## License

MIT License. Copyright (c) 2020 Chris Stefano. See [MIT_LICENSE](MIT_LICENSE) for details.

[1]: https://shiny.rstudio.com
[2]: https://github.com/virtualstaticvoid/heroku-docker-r
