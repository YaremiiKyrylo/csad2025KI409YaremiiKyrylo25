# CMake generated Testfile for 
# Source directory: D:/GitClone/csad2025KI409YaremiiKyrylo25
# Build directory: D:/GitClone/csad2025KI409YaremiiKyrylo25/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
if(CTEST_CONFIGURATION_TYPE MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
  add_test(math_operations_test "D:/GitClone/csad2025KI409YaremiiKyrylo25/build/Debug/math_operations_test.exe")
  set_tests_properties(math_operations_test PROPERTIES  _BACKTRACE_TRIPLES "D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;58;add_test;D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
  add_test(math_operations_test "D:/GitClone/csad2025KI409YaremiiKyrylo25/build/Release/math_operations_test.exe")
  set_tests_properties(math_operations_test PROPERTIES  _BACKTRACE_TRIPLES "D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;58;add_test;D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
  add_test(math_operations_test "D:/GitClone/csad2025KI409YaremiiKyrylo25/build/MinSizeRel/math_operations_test.exe")
  set_tests_properties(math_operations_test PROPERTIES  _BACKTRACE_TRIPLES "D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;58;add_test;D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;0;")
elseif(CTEST_CONFIGURATION_TYPE MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
  add_test(math_operations_test "D:/GitClone/csad2025KI409YaremiiKyrylo25/build/RelWithDebInfo/math_operations_test.exe")
  set_tests_properties(math_operations_test PROPERTIES  _BACKTRACE_TRIPLES "D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;58;add_test;D:/GitClone/csad2025KI409YaremiiKyrylo25/CMakeLists.txt;0;")
else()
  add_test(math_operations_test NOT_AVAILABLE)
endif()
subdirs("_deps/googletest-build")
