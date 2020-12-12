## Configuration
1. choose the jupyter docker image that you want to use [from here](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html)
2. paste the selected image name into the `build.env` config file
    - e.g. `JUPYTER_IMAGE=jupyter/scipy-notebook`

## Startup
1. review the `Makefile` targets
2. from the root of the project run
    - `make jupyter-start`
3. cmd + click the jupyter URL in the terminal

## Writing `lib` code
- sometimes there is code that makes more sense to write with the support of an IDE
- you can write this code in a `.py` file in `src/lib` and then import it into your notebook
- the docker build process pip installs the `src/lib` folder as an editable package 
  - this makes the `src/lib` folder importable like any other package installed with `pip`
  - for example, if you have a `main.py` in `src/lib` that contains a `helloWorld()` function, you can import it into your notebook like this:
  ```
  from lib.main import helloWorld
  ``` 
- in a default notebook you will need to re-import the package every time you make a change to `src/lib`
  - to automatically import any changes made to your `lib` package, place a cell with these contents at the top of your notebook
  ```
  %load_ext autoreload
  %autoreload 2
  ```

## Managing dependencies
### Installing a dependency
- when the jupyter container is running, run `make shell` to open a shell in the container
- `cd src/lib`
- `pip install --user <package>`
  - `--user` installs the package in the user space, enabling us to easily fetch the list of packages that we have installed on top of the the packages baked into the docker image
- `pip freeze --user > requirements.txt`
  - to list only the additional packages in the requirements.txt

## Contributing
- feel free to just submit a PR!
- otherwise, write up a GitHub Issue if you have a feature/improvement suggestion
- or have a look at the existing issues to see where help is needed



https://godatadriven.com/blog/write-less-terrible-code-with-jupyter-notebook/
https://u.group/thinking/how-to-put-jupyter-notebooks-in-a-dockerfile/
https://jupyter-docker-stacks.readthedocs.io/en/latest/using/running.html
https://github.com/jupyter/docker-stacks/blob/master/docs/using/recipes.md#using-pip-install-or-conda-install-in-a-child-docker-image

Importing stuff generally
https://www.pythonlikeyoumeanit.com/Module5_OddsAndEnds/Modules_and_Packages.html

Auto-import lib before notebook?
https://towardsdatascience.com/how-to-automatically-import-your-favorite-libraries-into-ipython-or-a-jupyter-notebook-9c69d89aa343

Betterunderstand importin from packages:
https://stackoverflow.com/questions/35727134/module-imports-and-init-py-in-python

## Usage
- enter this in the first cell of your notebook to have changes made in lib autoloaded by the notebook
  - without this you will need to restart the kernel for your code changes to be recognized
  ```
  %load_ext autoreload
  %autoreload 2
  ```