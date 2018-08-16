#!/bin/bash
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
git clone https://github.com/JohnLangford/vowpal_wabbit.git
cd vowpal_wabbit
./autogen.sh
./configure
make
make install
cd ..
conda install -c bioconda emboss
echo ========================================
echo Setting up Genetic Data analysis Library and compiling utility tools
echo ========================================
cd util
sh INSTALL.sh
cd ..
echo ========================================
echo Downloading and extracting gold standard datasets
echo ========================================
mkdir data
cd data
wget http://giant.csail.mit.edu/carnelian/EC-2192-DB.tar.gz
tar -zxvf EC-2192-DB.tar.gz
rm EC-2192-DB.tar.gz
cd ..
