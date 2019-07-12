# FESetup1.2 Workshop

# Start with the base container for the JupyterHub image
FROM jupyter/base-notebook

LABEL maintainer="Sarah Fegan <sarah.fegan@stfc.ac.uk>"

# Root to install things
USER root

# Update and install software dependencies needing root
RUN apt-get update && apt-get -yq dist-upgrade \
 && apt-get install -yq --no-install-recommends \
    bc \
    bison \
    cmake \
    csh \
    sed \
    flex \
    gcc \
    gfortran \
    git \
    g++ \
    libbz2-dev \
    make \
    nano \
    openbabel \
    openssh-client \
    patch \
    python \
    python-pip \
    python-setuptools \
    python-dev \
    rsync \
    vim \
    wget \
    zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Update pip
RUN python -m pip install --upgrade pip

# Install FESetup
COPY FESetup1.2.1_Linux.sh /opt
RUN cd /opt && \
    echo '\n \n \n \n /usr/bin/python' | ./FESetup1.2.1_Linux.sh && \
    chown -R $NB_USER:$NB_GID /opt/FESetup1.2.1

# Export important paths
ENV PATH=/home/jovyan/.local/bin:$PATH
ENV PATH=/opt/FESetup1.2.1/FESetup64/bin:$PATH

# Back to jovyan user
USER $NB_USER
WORKDIR $HOME

# Remove work directory
RUN rm -r $HOME/work

# Python Dependencies for the workshop
RUN pip install --user numpy
RUN pip install --user mdtraj
RUN pip install --user pandas

# Install Jupyterhub plugins
RUN pip install jupyterhub-tmpauthenticator
RUN pip install --user ipywidgets
RUN pip install --user nglview

# Initialise NGLView
RUN jupyter-nbextension install nglview --py --sys-prefix && \
    jupyter-nbextension enable nglview --py --sys-prefix && \
    pip install fileupload && \
    jupyter-nbextension install fileupload --py --sys-prefix && \
    jupyter-nbextension enable fileupload --py --sys-prefix

# Add all of the workshop files to the home directory
RUN git clone https://github.com/CCPBioSim/fesetup_workshop.git
RUN mv fesetup-workshop/* . && \
    rm -r Dockerfile README.md _config.yml FESetup1.2.1_Linux.sh fesetup-workshop

# UNCOMMENT THIS LINE FOR REMOTE DEPLOYMENT
#COPY jupyter_notebook_config.py /etc/jupyter/

# Always finish with non-root user as a precaution.
USER $NB_USER
