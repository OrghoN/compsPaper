# compsPaper
hosts the source files for the paper required for the comprehensive exams for PhD.

## Prerequisites

In order to buildthese files, latex is required.
Latex can be installed by following the instructions provided [here.](https://www.latex-project.org/get/)

## Building from Source

The repository contains the html output because it is plaintext and it can be found in the `html/` directory.
The pdf will have to be built from source. Building the files in both formats can be done as follows.

The first step is to clone the repo using

```bash
git clone https://github.com/OrghoN/compsPaper
cd compsPaper
```

### html

The following command will build the html output and put it in the `html/` directory. However the intermediate files do get dumped out in themain directory of the repo.

```bash
htlatex main.tex "" "" -dhtml/
```

### pdf

The following command will build the pdf and place both the output and intermediate files in the pdf directory.
The pdf is supposed to be the official formatting of the paper, so if there are any differences from the html version, the pdf is considered definitive.

```bash
pdflatex -output-directory pdf main.tex
```

