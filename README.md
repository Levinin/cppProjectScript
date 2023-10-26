# Cpp Project Creation Script
My script for creating a new cpp project including gtest, cmake file etc.
Mainly on here to make sure I don't lose it.

Run by:
`./cpp_new.bash <project name>`

This creates a project with the structure:

```
|_ src/
    |_ main.cpp
|_ bin/
    |_ a.out
    |_ hello_test
|_ extern/
|_ include/
|_ test/
    |_ hello_test.cpp
|_ build/
|_ .git/
|_ .gitignore
|_ LICENCE
|_ README.md
|_ CMakeLists.txt
|_ cmake-build-debug/
|_ .idea/
```

Note, the script will seek to cmake the code in main.cpp and hello_test.cpp to check everything is working correctly on the system. It will also init a git repo with a main branch and add to it.
At the end of the script it will try to open CLion since that it what I am using at the moment (and hence the .idea/ directory gets created).

