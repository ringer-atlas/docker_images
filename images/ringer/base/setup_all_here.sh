
echo "======================================================================================"
echo "setup root..."
# Set ROOT by hand
export ROOTSYS="/opt/root/buildthis"
export PATH="$ROOTSYS/bin:$PATH"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="/opt/root/buildthis/lib:$PYTHONPATH"

echo "======================================================================================"
echo "setup gaugi..."
current=$PWD
cd $(mktemp -d)
mkdir git_repos
cd git_repos
temp=$PWD

git clone https://github.com/ringer-atlas/gaugi.git
cd $temp/gaugi && source scripts/setup.sh
echo "======================================================================================"
echo "setup prometheus..."
git clone https://github.com/ringer-atlas/gaugi.git
cd $temp/prometheus && mkdir build && cd build && cmake .. && make && cd .. && source setup.sh

echo "======================================================================================"
echo "setup kolmov..."
git clone https://github.com/ringer-atlas/kolmov.git
cd $temp/kolmov && source scripts/setup.sh

echo "======================================================================================"
echo "setup saphyra..."
git clone https://github.com/ringer-atlas/saphyra.git
cd $temp/saphyra && source scripts/setup.sh


echo "======================================================================================"
echo "setup orchestra..."
git clone https://github.com/ringer-atlas/orchestra.git
cd $temp/orchestra && source scripts/setup.sh


echo "======================================================================================"
echo "setup tunings..."
git clone https://github.com/ringer-atlas/ringer_tunings.git
cd $temp/ringer_tunings && source setup.sh

echo "======================================================================================"
echo "all packages can be found at $temp."
echo "======================================================================================"
cd $current



