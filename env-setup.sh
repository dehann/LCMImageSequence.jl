

JULIA_EXE=julia06

echo "Testing that $JULIA_EXE application is present in the current environment..."
JULIA_BIN_TEST=$($JULIA_EXE -e "println("0")")
if [ $JULIA_BIN_TEST -eq 0 ]; then
  echo ""
  echo "$($JULIA_EXE -e "versioninfo();")"
else
  echo ""
  echo "'$JULIA_EXE' application not in current environment, please ensure you jave Julia installed and linked to '$JULIA_EXE' command."
  echo "Please download and extract relevent version of Julia from www.julialang.org/downloads and add juliaXX as executable command to your environment."
  echo "For example: "
  echo "   pushd /usr/bin/"
  echo "   sudo ln -s $HOME/WHERES/julia-*/bin/julia julia06"
  echo "   popd"
  echo " OR, add the following function to ~/.bashrc"
  echo "   julia06() {"
  echo "      $HOME/WHERES/julia-*/bin/julia \"$@\""
  echo "   }"
fi
echo ""

getjuliapkgdir() {
  $JULIA_EXE -e "println(Pkg.dir())"
}

LCM_JULIA_USR_PATH="$(getjuliapkgdir)/LCMCore/deps/usr"
echo "Using sandboxed LCM at: $LCM_JULIA_USR_PATH"

build-lcmtypes() {
  WORKING_DIR=$1
  export LCM_JAR=$LCM_JULIA_USR_PATH/share/java/lcm.jar
  export LCM_GEN_EXE=$LCM_JULIA_USR_PATH/bin/lcm-gen
  $LCM_GEN_EXE -p --ppath $WORKING_DIR $WORKING_DIR/*.lcm
  pushd $WORKING_DIR
  echo `pwd`
  $LCM_GEN_EXE -j --jpath $WORKING_DIR $WORKING_DIR/*.lcm
  javac -cp $LCM_JAR bot_core/*.java
  javac -cp $LCM_JAR sensor/*.java
  javac -cp $LCM_JAR vicon/*.java
  jar cf data_types.jar */*.class
  popd
}

lcm-spy-with-types() {
  export CLASSPATH=$LCM_JULIA_USR_PATH/share/java/lcm.jar:$1 && $LCM_JULIA_USR_PATH/bin/lcm-spy
}
