#!/bin/bash

	find gnu -name "*?.?*" | \
		xargs jar -cvmf ./mboth/idl2vb/manifest.txt ../bin/IDL2VB.jar
		
	jar tf ../bin/IDL2VB.jar
    
	find mboth/idl2vb mboth/util -name "*.class" | \
		xargs jar uvf ../bin/IDL2VB.jar
    
    
