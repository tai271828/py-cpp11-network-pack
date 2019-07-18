#!/bin/bash
#
# Ubuntu Xenial + pipenv
#
WORKDIR="${HOME}/work-my-projects/py-cpp11-network-pack"
INCLUDE_PATH_PYBIND11="${HOME}/.local/share/virtualenvs/<pipenv-venv>/python3.5m/include"
INCLUDE_PATH_PYTHONDEV="/usr/include/python3.5m"
PYTHON_VERSION='3.5'

mkdir -p ${WORKDIR}
cd ${WORKDIR}

# setup pipenv
git clone git@github.com:tai271828/py-cpp11-network-pack.git
cd ${WORKDIR}/py-cpp11-network-pack
pipenv install
pipenv shell
INCLUDE_PATH_PYBIND11=`python-config --includes`
INCLUDE_PATH_PYBIND11=$(cd $(dirname "${INCLUDE_PATH_PYBIND11}")/.. && pwd)

# setup pybind11 and the assocaited projects and examples
git clone git@github.com:pybind/pybind11.git
git clone git@github.com:pybind/python_example.git
git clone git@github.com:pybind/cmake_example.git

# setup pybind11
cd ${WORKDIR}/pybind11

mkdir build
cd build
cmake -DPYTHON_EXECUTABLE:FILEPATH=`which python`  -DCMAKE_INSTALL_PREFIX=`python-config --includes | awk {'print $1'} | sed 's/-I//'` -DCMAKE_CXX_FLAGS=-I${INCLUDE_PATH_PYTHONDEV}  ..
make install

# compile the example code
#c++ -O3 -Wall -shared -std=c++11 -fPIC -I`which python`/../../include/python${PYTHON_VERSION}m/include  example.cpp -I${INCLUDE_PATH_PYTHONDEV} -o example`python-config --extension-suffix`
