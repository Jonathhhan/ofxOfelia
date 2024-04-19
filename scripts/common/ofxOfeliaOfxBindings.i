// SWIG (http://www.swig.org) interface wrapper for the openFrameworks core API
// 2014-17 Dan Wilcox <danomatika@gmail.com>

// main MODULE
%module ofx
%{
	#include "../../ofxVolumetrics/src/ofxVolumetrics.h"
	#include "../../ofxStableDiffusion/libs/stable-diffusion/include/stable-diffusion.h"
%}

// ----- C++ -----

// SWIG doesn't understand C++ streams
%ignore operator <<;
%ignore operator >>;

// expanded primitives
%typedef unsigned int size_t;
%typedef long long int64_t;
%typedef unsigned long long uint64_t;

%include <stl.i>
%include <std_string.i>
%include <std_vector.i>

// ----- Bindings------

%include "../../ofxVolumetrics/src/ofxVolumetrics.h"
%include "../../ofxVolumetrics/src/ofxImageSequencePlayer.h"
%include "../../ofxStableDiffusion/libs/stable-diffusion/include/stable-diffusion.h"