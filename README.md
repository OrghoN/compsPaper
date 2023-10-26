# compsPaper
hosts the source files for the paper required for the comprehensive exams for PhD.## Paper output

The online version of the paper can be viewed [here.](https://orghon.github.io/compsPaper/)

## Prerequisites

- web browser
- pdf viewer
- latex
- git

### Web Browser/Pdf Viewer

A web browser is needed to view the output html and a pdfviewer for the pdf output.
Thankfully firefox combines both functionality into one piece of software.
Firefox can be obtained from [here.](https://www.mozilla.org/en-US/firefox/all/#product-desktop-release)

### Latex

In order to buildthese files, latex is required.
Latex can be installed by following the instructions provided [here.](https://www.latex-project.org/get/)

### Git

Git is helpful for building this paper.
Although, in principle, you could download a .zip from github directly and unpack it. in which case, ignore the line that says to git clone.
It usually comes preinstalled with most linux systems.
It is also preinstalled on OSX.
A quick way to check if you have it is to
```bash
git --version
```

if git is installed, it should return a version number.

If git is not installed, you should be able to install it with the package manager for your operating system.
More detailed instructions can be found [here.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Building from Source

The repository contains the html output because it is plaintext and it can be found in the `docs/` directory.
The pdf will have to be built from source. Building the files in both formats can be done as follows.

The first step is to clone the repo using

```bash
git clone https://github.com/OrghoN/compsPaper
cd compsPaper
```

### automatic build script

The following command runs the build script. It builds both the pdf and html taking references into account and thus only needs to be run once.
It also removes intermediary files.

*Note: The html generated from this script is named `index.html` and is placed in the `docs/`  directory and is not named `main.html` as one might expect*

```bash
source build.sh
```

### html

The following command will build the html output and put it in the `docs/` directory. However the intermediate files do get dumped out in themain directory of the repo.

```bash
htlatex main.tex "" "" -ddocs/
bibtex main
htlatex main.tex "" "" -ddocs/
htlatex main.tex "" "" -ddocs/
```

### pdf

The following command will build the pdf. 
The pdf is supposed to be the official formatting of the paper, so if there are any differences from the html version, the pdf is considered definitive.

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Regardless of whether one is building to pdf or to html, it may be necessary to run the build commands twice in order for things like references and footnotes to be properly linked.