# Code from shiny verse

FROM docker.io/library/ubuntu:jammy

ENV R_VERSION="4.4.1"
ENV R_HOME="/usr/local/lib/R"
ENV TZ="Etc/UTC"

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_R_source.sh /rocker_scripts/
RUN chmod +x /rocker_scripts/install_R_source.sh

ENV CRAN="https://p3m.dev/cran/__linux__/jammy/latest"
ENV LANG=en_US.UTF-8

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/bin/ /rocker_scripts/bin
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/setup_R.sh /rocker_scripts/setup_R.sh
RUN  chmod +x /rocker_scripts/setup_R.sh

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_tidyverse.sh /rocker_scripts/install_tidyverse.sh
RUN  chmod +x /rocker_scripts/install_tidyverse.sh

# ------------------
# Added from geospatial
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_quarto.sh /rocker_scripts/install_quarto.sh
RUN  chmod +x /rocker_scripts/install_quarto.sh

ENV CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet"
ENV PATH="$PATH:/usr/local/texlive/bin/linux"

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_verse.sh /rocker_scripts/install_verse.sh
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_texlive.sh /rocker_scripts/install_texlive.sh
RUN  chmod +x /rocker_scripts/install_verse.sh

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_geospatial.sh /rocker_scripts/install_geospatial.sh
RUN  chmod +x /rocker_scripts/install_geospatial.sh

# ------------------
#Add my additional packages
ADD https://github.com/frabau1/GeoShinyVerse/blob/main/install_additionalpackages.sh /rocker_scripts/install_additionalpackages.sh
RUN  chmod +x /rocker_scripts/install_additionalpackages.sh

# ------------------
#back to shiny verse code


ENV S6_VERSION="v2.1.0.2"
ENV SHINY_SERVER_VERSION="latest"
ENV PANDOC_VERSION="default"

ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_shiny_server.sh /rocker_scripts/install_shiny_server.sh
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_s6init.sh /rocker_scripts/install_s6init.sh
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_pandoc.sh /rocker_scripts/install_pandoc.sh
ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/init_set_env.sh /rocker_scripts/init_set_env.sh
RUN  chmod +x /rocker_scripts/install_shiny_server.sh

EXPOSE 3838
CMD ["/init"]


ADD https://github.com/rocker-org/rocker-versioned2/blob/master/scripts /rocker_scripts

