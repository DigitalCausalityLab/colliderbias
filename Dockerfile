FROM virtualstaticvoid/heroku-docker-r:shiny

# ONBUILD will copy application files into the container
#  and execute init.R (if it exists) and restore packrat packages (if they exist)

## renv.lock file
COPY colliderbias/app/renv.lock ./renv.lock

# install renv & restore packages
RUN Rscript -e 'install.packages("renv")'
RUN Rscript -e 'renv::consent(provided = TRUE)'
RUN Rscript -e 'renv::restore()'

# provide the port for Shiny, so that running/testing outside of Heroku is possible
# Heroku will override the PORT value at runtime
ENV PORT=8080

# override the base image CMD to run Shiny
CMD ["/usr/bin/R", "--no-save", "--gui-none", "-f", "/app/app/run.R"]
