# The Fundamentals of Camera Calibration

This is a monorepo containing all the files for my IB Math AA HL Extended Essay.

## Structure

- **`texmf`**: contains the custom preamble and macros used in this paper.
- **`sections`**: contains `.tex` included in `main.tex`.
- **`assets`**: contains figures, images, and tables used in the paper.
- **`data`**: data collected for the experiment. These files are passed into `calicam` to be processed.
- **`calicam`**: git submodule containing a python package which processes the data and calculates the intrinsic parameters, extrinsic parameters, and the projection matrix using `scipy`. It also validates the model and is capable of generating graphs using `matplotlib`.

## Cloning the Repo

Make sure you have [`git`](https://git-scm.com/) installed on your machine. Then, clone this repository by command line:

```shell
git clone --recurse-submodules https://github.com/lew1101/Fundamentals-of-Camera-Calibration.git
```

## Build

Make sure you have `latexmk` installed on your machine. Then, `cd` into the project and run `build.sh`.

```shell
cd Fundamentals-of-Camera-Calibration
./build.sh
```

## Author

[Kenneth Lew](https://github.com/lew1101)
