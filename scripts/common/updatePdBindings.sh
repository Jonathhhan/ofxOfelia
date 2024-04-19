#!/bin/bash

# generate swig bindings
swig -c++ -lua -fcompact -fvirtual -I../../../../libs/openFrameworks -I../../src -o ../../src/ofxOfeliaPdBindings.cpp ofxOfeliaPdBindings.i
swig -c++ -lua -fcompact -fvirtual -I../../../../libs/openFrameworks -I../../src -o ../../src/ofxOfeliaOfxBindings.cpp ofxOfeliaOfxBindings.i
swig -c++ -lua -fcompact -fvirtual -I../../../../libs/openFrameworks -I../../src -o ../../src/ofxOfeliaOfxImGuiBindings.cpp ofxOfeliaOfxImGuiBindings.i
swig -c++ -lua -fcompact -fvirtual -I../../../../libs/openFrameworks -I../../src -o ../../src/ofxOfeliaImGuiPdBindings.cpp ofxOfeliaImGuiBindings.i
