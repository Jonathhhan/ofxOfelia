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
%typedef unsigned uint8_t;
%typedef unsigned uint32_t;
%typedef unsigned int size_t;
%typedef long long int64_t;
%typedef unsigned long long uint64_t;

%include <stl.i>
%include <std_string.i>
%include <std_vector.i>

// ----- ofImage.h -----

// forward declare needed types
%ignore ofBaseImage_;
template<typename T> class ofBaseImage_ {};

// forward declare base template classes
%ignore ofBaseImage;
%ignore ofBaseFloatImage;
%ignore ofBaseShortImage;

%template(ofBaseImage) ofBaseImage_<unsigned char>;
%template(ofBaseFloatImage) ofBaseImage_<float>;
%template(ofBaseShortImage) ofBaseImage_<unsigned short>;

// DIFF: ofImage.h:
// DIFF:   ignore ofCloseFreeImage()
%ignore ofCloseFreeImage;

// DIFF:   ignoring ofPixels operator
%ignore ofImage_::operator ofPixels_<PixelType>&();

// DIFF:   ignoring const & copy constructor in favor of && constructor
%ignore ofImage_(const ofImage_<PixelType>&);

// TODO:   find a way to release ofColor instances returned by getColor()

%include "graphics/ofImage.h"

%template(ofImage) ofImage_<unsigned char>;
%template(ofFloatImage) ofImage_<float>;
%template(ofShortImage) ofImage_<unsigned short>;

// ----- ofGraphicsBaseTypes.h -----

// DIFF: ofGraphicsBaseTypes.h: ignore all abstract and base types
%ignore ofAbstractParameter;
%ignore ofBaseDraws;
%ignore ofBaseUpdates;
%ignore ofBaseHasTexture;
%ignore ofBaseHasTexturePlanes;

%ignore ofAbstractHasPixels;
%ignore ofBaseHasPixels_;
%ignore ofBaseHasPixels;
%ignore ofBaseHasFloatPixels;
%ignore ofBaseHasShortPixels;

%ignore ofAbstractImage;
%ignore ofBaseImage_;
%ignore ofBaseImage;
%ignore ofBaseFloatImage;
%ignore ofBaseShortImage;

%ignore ofBaseRenderer;
%ignore ofBaseGLRenderer;

%ignore ofBaseSerializer;
%ignore ofBaseFileSerializer;
%ignore ofBaseURLFileLoader;
%ignore ofBaseMaterial;

// include header for derived classes
%include "graphics/ofGraphicsBaseTypes.h"

// ----- Renaming -----

// strip "ofx" prefix from classes
%rename("%(strip:[ofx])s", %$isclass) "";

// strip "ofx" prefix from global functions & make first char lowercase
%rename("%(regex:/ofx(.*)/\\l\\1/)s", %$isfunction) "";

// strip "OFX_" from constants & enums
%rename("%(strip:[OFX_])s", %$isconstant) "";
%rename("%(strip:[OFX_])s", %$isenumitem) "";

// ----- Bindings------

%include "../../ofxVolumetrics/src/ofxVolumetrics.h"
%include "../../ofxVolumetrics/src/ofxImageSequencePlayer.h"
%include "../../ofxStableDiffusion/libs/stable-diffusion/include/stable-diffusion.h"
