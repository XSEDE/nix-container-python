FROM xsede/centos-nix-base:latest

################## METADATA ######################

LABEL base_image="xsede/centos-nix-base"
LABEL version="1.0.0"
LABEL software="Python"
LABEL software.version="3.8.8"
LABEL about.summary="Python 3.8.8 installed via Nix on top of CentOS 7"
LABEL about.home="https://github.com/XSEDE/nix-container-python"
LABEL about.documentation="https://github.com/XSEDE/nix-container-python"
LABEL about.license_file="https://github.com/XSEDE/nix-container-python"
LABEL about.license="MIT"
LABEL about.tags="example-container" 
LABEL extra.binaries="python"
LABEL authors="XCRI <help@xsede.org>"

################## ENVIRONMENT ######################

SHELL ["/bin/bash", "-c"]

USER root

ENV NIXENV "/root/.nix-profile/etc/profile.d/nix.sh"

RUN mkdir -p /root/.config/nixpkgs/

COPY config.nix /root/.config/nixpkgs/
COPY dev.nix /root/
COPY prod-env.nix /root/
COPY persist-env.sh /root/

RUN for i in $(ls /root/.nix-profile/bin) ; do ln -s /root/.nix-profile/bin/"$i" /usr/bin ; done

RUN chmod +x /root/.nix-profile/etc/profile.d/nix.sh

# initiate environment
RUN $NIXENV && \
    cd /tmp && \
    bash /root/persist-env.sh /root/prod-env.nix

 Prep dev environment ahead of time
RUN nix-shell /root/dev.nix
