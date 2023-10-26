#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No project name given on command line."
	exit
fi

PROJECT_NAME=$1
CREATION_DATE=$(date "+%Y-%m-%d")

mkdir $PROJECT_NAME
cp CMakeLists.txt $PROJECT_NAME
cp LICENSE $PROJECT_NAME

cd $PROJECT_NAME

# Create directories
mkdir src
mkdir bin
mkdir build
mkdir include
mkdir test


# Add a hello world to start me off.
# Three parts due to the hash and var issue 'EOF' allows #, not vars.
cat <<EOF >> src/main.cpp
/* Author	: Andy Edmondson
 * Email	: andrew.edmondson@gmail.com
 * Created  : $CREATION_DATE
 */ 
EOF

echo "#include <iostream>" >> src/main.cpp

cat <<EOF >> src/main.cpp

int main(){
	std::cout << "\n\n*** Project '$PROJECT_NAME' has been set up! ***\n" << std::endl;

	return 0;
}
EOF

# Start the readme, add more to this later.
echo "# $PROJECT_NAME project" >> README.md
cat <<EOF >> README.md
| Author : Andy Edmondson | 
Email  : andrew.edmondson@gmail.com | 
Created: $CREATION_DATE | 
EOF


# git
git init -b main
echo "bin/" >> .gitignore
echo "build/" >> .gitignore
echo "cmake-build-debug/" >> .gitignore
echo ".idea/" >> .gitignore
echo "extern/" >> .gitignore
git add *
git commit -m "Project creation"


# gtest for unit tests
cat <<'EOF' >> test/hello_test.cpp
#include <gtest/gtest.h>

// Demonstrate some basic assertions.
TEST(HelloTest, BasicAssertions) {
  // Expect two strings not to be equal.
  EXPECT_STRNE("hello", "world");
  // Expect equality.
  EXPECT_EQ(7 * 6, 42);
}
EOF


# Do a build to make sure it works.
cd build
cmake ..
cmake --build .

cd ..
./bin/a.out
./bin/hello_test


cd ..
clion $PROJECT_NAME &
