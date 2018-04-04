## Aimed at: 
Anyone interested in learning how to use the FESetup tool to automatically prepare protein and ligand files for simple molecular dynamics simulations or alchemical free energy calculations In particular allowing for alchemical free energy calculation setups. It will also help with how to run actual molecular dynamics simulations from the generated input. 
You can obtain FESetup for yourself [here](http://www.hecbiosim.ac.uk/fesetup).

## Requirements: 
Basic knowledge of how to execute cells in a Jupyter notebook, and how to edit a text file in a terminal. Basic knowledge of being able to execute commands on a terminal. 

## Abstract: 
This workshop is designed to introduce you to how to use FESetup to prepare protein and ligand files to create simulation input for simple molecular dynamics simulations. It will also address how to then use Sire SOMD to run either a standard molecular dynamics simulation or alchemical free energy simulation. The workshop will provide a quick overview of what exactly alchemical free energy calculations are.

## Training Material

The workshop consists of a set of introductory slides covering the basics of alchemical free energy simulations and two Jupyter notebooks. These are available
below, and can be run using the
<a href="https://workshop.biosimspace.org/hub/tmplogin" target="_blank">workshop Jupyter server</a>.

Start the server by <a href="https://workshop.biosimspace.org/hub/tmplogin" target="_blank">clicking here</a>.
This will open a Jupyter notebook interface. Be patient as this may take 30-60 seconds.
Once this has opened, navigate to the `fesetup_workshop` directory and you will find the
notebooks there.

The two workshop notebooks are `01_FESetup_ethane_methanol.ipynb` and `02_Lysozyme_and_Advanced_FESetup.ipynb`. The two notebooks do not depend on each other, but the first one covers the basics of FESetup whereas the second one covers more advanced topics. 

Furthermore you can find model answers to the notebooks in the `answers` directory. The set of presentation slides can be found as a pdf in the `slides` directory. 


## Contents

### [01 FESetup Ethane Methanol notebook](html/01_FESetup_ethane_methanol.html) ([answers](html/answers/01_FESetup_ethane_methanol_answers.html))

This notebooks teaches how to setup an alchemical free energy calculation for computing the relative hydration free energy between ethane and methanol. 

[download](01_FESetup_ethane_methanol.ipynb) | [download answers](answers/01_FESetup_ethane_methanol_answers.ipynb)

### [02 Lysozyme and advanced FESetup topics](html/02_Lysozyme_and_Advanced_FESetup.html) ([answers](html/answers/02_Lysozyme_and_Advanced_FESetup_answers.html))

The second notebook will guide you through using FESetup for preparing protein simulations using different outputs as well as how to setup protein simulations with ligands bound. 

[download](02_lists.ipynb) | [download answers](answers/02_lists.ipynb)


## How to download to run at home

While this workshop is running using cloud servers generously supplied
by [Microsoft Azure](https://azure.microsoft.com/en-us/services/container-service/kubernetes/),
you can also download and run this workshop on your own computer if
you are using docker (and your computer has an X86-64 processor that
supports AVX, e.g. like most Intel processors since 2011). To run on
your own computer type;

```
docker run -it --rm -p 8888:8888 chryswoods/bss-workshop:latest
```

This will download the image (may take a while...) and will run it on
your computer. It will print out the URL of the notebook which you should navigate
to in your browser (it will look something like `http://localhost:8888/?token=7f4b6be12ff1cec13903d0f27bab2ad7ea3eeaa9f0098dee`)

