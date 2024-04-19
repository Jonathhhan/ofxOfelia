// SWIG (http://www.swig.org) interface wrapper for the openFrameworks core API
// 2014-17 Dan Wilcox <danomatika@gmail.com>

// main MODULE
%module ofxImGui
%{
	#include "../../../../ofxImGui/src/Gui.h"
	using namespace ofxImGui;
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

%rename(c_end) end;

// ----- Bindings------

%include "../../../../ofxImGui/src/Gui.h"