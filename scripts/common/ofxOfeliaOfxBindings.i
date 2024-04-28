// addon MODULE
%module ofx


%import "../../ofxLua/swig/openFrameworks.i"
%import "../../../libs/openFrameworks/gl/ofGLBaseTypes.h"

%{
	#include "../../ofxOpenCv/src/ofxOpenCv.h"
	#include "../../ofxAssimpModelLoader/src/ofxAssimpModelLoader.h"
	#include "../../ofxVolumetrics/src/ofxVolumetrics.h"
	#include "../../ofxStableDiffusion/libs/stable-diffusion/include/stable-diffusion.h"
	#include "../../ofxImGui/src/Gui.h"
	using namespace ofxImGui;
%}


// ofxImGui
%ignore operator bool;
%rename(c_end) end;

// ofxOpenCv
%ignore operator &=;


// ----- Renaming -----

// strip "ofx" prefix from classes
%rename("%(strip:[ofx])s", %$isclass) "";

// strip "ofx" prefix from global functions & make first char lowercase
%rename("%(regex:/ofx(.*)/\\l\\1/)s", %$isfunction) "";

// strip "OFX_" from constants & enums
%rename("%(strip:[OFX_])s", %$isconstant) "";
%rename("%(strip:[OFX_])s", %$isenumitem) "";


// ----- Bindings------
%include "../../ofxOpenCv/src/ofxCvBlob.h"
%include "../../ofxOpenCv/src/ofxCvHaarFinder.h"
%include "../../ofxOpenCv/src/ofxCvContourFinder.h"
%include "../../ofxOpenCv/src/ofxCvImage.h"
%include "../../ofxOpenCv/src/ofxCvColorImage.h"
%include "../../ofxOpenCv/src/ofxCvFloatImage.h"
%include "../../ofxOpenCv/src/ofxCvGrayscaleImage.h"
%include "../../ofxOpenCv/src/ofxCvShortImage.h"
%include "../../ofxAssimpModelLoader/src/ofxAssimpModelLoader.h"
%include "../../ofxAssimpModelLoader/src/ofxAssimpAnimation.h"
%include "../../ofxVolumetrics/src/ofxVolumetrics.h"
%include "../../ofxVolumetrics/src/ofxImageSequencePlayer.h"
%include "../../ofxStableDiffusion/libs/stable-diffusion/include/stable-diffusion.h"
%include "../../ofxImGui/src/Gui.h"
