
mkdir Build32
cd Build32
cmake ..
MSBuild.exe CHardInfo.sln -property:Configuration=Debug
MSBuild.exe CHardInfo.sln -property:Configuration=Release

cd ../bin/Debug32/
CHardInfoTest.exe
pause

cd ../Release32/
CHardInfoTest.exe
pause