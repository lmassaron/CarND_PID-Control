##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=CarND-PID-Control-Project
ConfigurationName      :=Debug
WorkspacePath          :=/home/lm/CARND/CarND-PID-Control-Project
ProjectPath            :=/home/lm/CARND/CarND-PID-Control-Project
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Luca
Date                   :=11/05/17
CodeLitePath           :=/home/lm/.codelite
LinkerName             :=gcc
SharedObjectLinkerName :=gcc -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="CarND-PID-Control-Project.txt"
PCHCompileFlags        :=
MakeDirCommand         :=mkdir -p
LinkOptions            :=  -O0
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch). $(LibraryPathSwitch)Debug 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := ar rcus
CXX      := gcc
CC       := gcc
CXXFLAGS :=  -std=c++11 -Wall -g -Wall $(Preprocessors)
CFLAGS   :=   $(Preprocessors)
ASFLAGS  := 
AS       := as


##
## User defined environment variables
##
CodeLiteDir:=/usr/share/codelite
Objects0=$(IntermediateDirectory)/src_PID.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(ObjectSuffix) $(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(ObjectSuffix) $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(ObjectSuffix) $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@test -d ./Debug || $(MakeDirCommand) ./Debug


$(IntermediateDirectory)/.d:
	@test -d ./Debug || $(MakeDirCommand) ./Debug

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/src_PID.cpp$(ObjectSuffix): src/PID.cpp $(IntermediateDirectory)/src_PID.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/src/PID.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_PID.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_PID.cpp$(DependSuffix): src/PID.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_PID.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_PID.cpp$(DependSuffix) -MM src/PID.cpp

$(IntermediateDirectory)/src_PID.cpp$(PreprocessSuffix): src/PID.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_PID.cpp$(PreprocessSuffix) src/PID.cpp

$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix): src/main.cpp $(IntermediateDirectory)/src_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/src/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_main.cpp$(DependSuffix): src/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main.cpp$(DependSuffix) -MM src/main.cpp

$(IntermediateDirectory)/src_main.cpp$(PreprocessSuffix): src/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_main.cpp$(PreprocessSuffix) src/main.cpp

$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(ObjectSuffix): build/CMakeFiles/feature_tests.cxx $(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/build/CMakeFiles/feature_tests.cxx" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(DependSuffix): build/CMakeFiles/feature_tests.cxx
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(ObjectSuffix) -MF$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(DependSuffix) -MM build/CMakeFiles/feature_tests.cxx

$(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(PreprocessSuffix): build/CMakeFiles/feature_tests.cxx
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/build_CMakeFiles_feature_tests.cxx$(PreprocessSuffix) build/CMakeFiles/feature_tests.cxx

$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(ObjectSuffix): build/CMakeFiles/feature_tests.c $(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/build/CMakeFiles/feature_tests.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(DependSuffix): build/CMakeFiles/feature_tests.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(ObjectSuffix) -MF$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(DependSuffix) -MM build/CMakeFiles/feature_tests.c

$(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(PreprocessSuffix): build/CMakeFiles/feature_tests.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/build_CMakeFiles_feature_tests.c$(PreprocessSuffix) build/CMakeFiles/feature_tests.c

$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(ObjectSuffix): build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(DependSuffix): build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(DependSuffix) -MM build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp

$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(PreprocessSuffix): build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdCXX_CMakeCXXCompilerId.cpp$(PreprocessSuffix) build/CMakeFiles/3.5.1/CompilerIdCXX/CMakeCXXCompilerId.cpp

$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(ObjectSuffix): build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(DependSuffix)
	$(CC) $(SourceSwitch) "/home/lm/CARND/CarND-PID-Control-Project/build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(DependSuffix): build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(ObjectSuffix) -MF$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(DependSuffix) -MM build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c

$(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(PreprocessSuffix): build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/build_CMakeFiles_3.5.1_CompilerIdC_CMakeCCompilerId.c$(PreprocessSuffix) build/CMakeFiles/3.5.1/CompilerIdC/CMakeCCompilerId.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


