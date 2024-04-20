// SWIG (http://www.swig.org) interface wrapper for the openFrameworks core API
// 2014-17 Dan Wilcox <danomatika@gmail.com>

// main MODULE
%module ImGui
%{
	#include "../../ofxImGui/libs/imgui/src/imgui.h"
%}

//------
// Array type tags
//------

%include <carrays.i>
%array_functions(bool, BoolArray)
%array_functions(int, IntArray)
%array_functions(float, FloatArray)
%array_functions(char, CharArray)
%array_functions(unsigned int, UintArray)
%array_functions(unsigned char, UcharArray)
%array_functions(char*, CharPArray)
%array_functions(ImDrawVert, ImDrawVertArray)
%array_functions(ImFontGlyph, ImFontGlyphArray)
%array_functions(ImColor, ImColorArray)
%array_functions(ImGuiStorage, ImGuiStorageArray)
%array_functions(ImGuiViewport, ImGuiViewportArray)

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

// ----- ImGui specific -----
%ignore ImGuiNavInput;
%ignore KeyMap;
%ignore KeysDown;
%ignore NavInputs;
%ignore operator new(size_t, ImNewWrapper, void*);   // Ignored because SWIG doesn't support this operator
%ignore operator delete(void*, ImNewWrapper, void*); // Ignored because SWIG doesn't support this operator
%ignore ImGuiTextFilter::ImGuiTextRange; // Ignored because SWIG doesn't support nested structs
%ignore ImGuiStorage::ImGuiStoragePair;  // Ignored because SWIG doesn't support nested structs
%ignore Value(const char*, int);          // Always use float version instead
%ignore Value(const char*, unsigned int); // Always use float version instead
%ignore ImColor::ImColor(int, int, int);          // Always use float version instead
%ignore ImColor::ImColor(int, int, int, int);     // Always use float version instead

%rename(c_end) end;
%rename(tobool) ImGuiOnceUponAFrame::operator bool;
%rename(toImU32) ImColor::operator ImU32;
%rename(toImVec4) ImColor::operator ImVec4;
%rename(GetColorU32_ImU32) GetColorU32(ImU32 col);

%immutable ImGuiIO::IniFilename;
%immutable ImGuiIO::LogFilename;
%immutable ImGuiIO::BackendPlatformName;
%immutable ImGuiIO::BackendRendererName;
%immutable ImDrawList::_OwnerName;

// ----- Bindings------

%include "../../ofxImGui/libs/imgui/src/imgui.h"
