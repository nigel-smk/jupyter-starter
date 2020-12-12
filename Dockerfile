ARG JUPYTER_IMAGE
FROM $JUPYTER_IMAGE

# install external dependencies
RUN mkdir src
COPY --chown=jovyan:users ./src/requirements.txt ./src
# https://github.com/jupyter/docker-stacks/blob/master/docs/using/recipes.md#using-pip-install-or-conda-install-in-a-child-docker-image
RUN pip install --user --requirement ./src/requirements.txt && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# install project lib
COPY --chown=jovyan:users ./src/setup.py ./src
RUN pip install --editable ./src
