#!/usr/bin/env bash

# Exit on failure
set -e

sw_vers

brew update

brew uninstall --ignore-dependencies python
brew install python@2 --universal --framework
export PATH="$(brew --prefix python@2)/bin:$PATH"
python2.7 -v || (exit 0)
python2 -v || (exit 0)
python -v

brew install libidn
brew install ghostscript
gs -v

brew install imagemagick
compare -version

# Qt is xpdf dependency
# We specify version explicitly, because Qt >= 5.12.0 requires macOs >= 10.12.0
brew install qt@5.11

brew install xpdf
pdfinfo -v || (exit 0)

brew cask install -v basictex
# export PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
export PATH=/Library/TeX/Distributions/Programs/texbin:$PATH

sudo tlmgr option repository http://mirrors.rit.edu/CTAN/systems/texlive/tlnet
sudo -i tlmgr update --self --all
sudo tlmgr install            \
  collection-basic            \
  collection-bibtexextra      \
  collection-binextra         \
  collection-fontsextra       \
  collection-fontsrecommended \
  collection-fontutils        \
  collection-formatsextra     \
  collection-langenglish      \
  collection-langeuropean     \
  collection-langother        \
  collection-latex            \
  collection-latexextra       \
  collection-latexrecommended \
  collection-mathscience      \
  collection-metapost         \
  collection-pictures         \
  collection-plaingeneric     \
  collection-pstricks
