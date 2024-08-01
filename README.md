# GeoShinyVerse
***Work in progress - currently troubleshooting errors***

Custom docker image that combines the shinyverse &amp; geospatial docker images from the Rocker Project and adds a few additional R packages.

Dockerfile is annotated showing the source of each code chunk. The bulk of the funcitons are pulled directly from the Rocker project.  Additional packages are added in the install_additionalpackages.sh chunk pulled from this repository. 

Configuration file (custom-shiny-server.conf) is set up to prohibit directory access.
