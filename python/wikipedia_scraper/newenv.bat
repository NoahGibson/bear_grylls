   @echo off
   rem ***********************************************************************
   rem Removes existing virtual environment and creates new virtual
   rem environment, installing the required packages
   rem 
   rem This expects to be called in the following format:
   rem 
   rem   C:\> newenv
   rem
   rem ***********************************************************************
   
   :: delete existing virtual machine (include, lib, scripts, tcl folders & pip-selfcheck.json)
   echo Removing files...
   if exist Lib/ (RMDIR /S /Q Lib)
   if exist Include/ (RMDIR /S /Q Include)
   if exist Scripts/ (RMDIR /S /Q Scripts)
   if exist tcl/ (RMDIR /S /Q tcl)
   if exist pip-selfcheck.json (del pip-selfcheck.json)
   
   :: create new virtual environment
   echo Creating new environment...
   virtualenv "%cd%"
   
   :: install the required packages
   echo Installing required packages...
   call Scripts\activate.bat
   pip install --upgrade pip
   pip install -r requirements.txt
   call Scripts\deactivate.bat