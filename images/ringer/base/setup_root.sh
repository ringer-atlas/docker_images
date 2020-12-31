



echo "======================================================================================"
echo "setup root..."
# Set ROOT by hand
export ROOTSYS="/opt/root/buildthis"
export PATH="$ROOTSYS/bin:$PATH"
export LD_LIBRARY_PATH="$ROOTSYS/lib:$LD_LIBRARY_PATH"
export PYTHONPATH="/opt/root/buildthis/lib:$PYTHONPATH"

#echo "setup gaugi..."
#current=$PWD
#cd $(mktemp -d)
#temp=$PWD
#git clone https://github.com/ringer-atlas/gaugi.git
#cd $temp/gaugi && source scripts/setup.sh
echo "======================================================================================"

#cd $current



