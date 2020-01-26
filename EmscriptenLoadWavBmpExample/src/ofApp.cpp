#include "ofApp.h" 

void embind_1(float embind1) {
  lua_getglobal(ofxOfeliaLua::L, "embind_1"); 
  lua_pushnumber(ofxOfeliaLua::L, embind1);
  lua_call(ofxOfeliaLua::L, 1, 0); 
  }

void embind_2(float embind2) {
  lua_getglobal(ofxOfeliaLua::L, "embind_2");
  lua_pushnumber(ofxOfeliaLua::L, embind2); 
  lua_call(ofxOfeliaLua::L, 1, 0); 
  }

void embind_3(float embind3) { 
  lua_getglobal(ofxOfeliaLua::L, "embind_3"); 
  lua_pushnumber(ofxOfeliaLua::L, embind3); 
  lua_setglobal(ofxOfeliaLua::L, "embind_3");
  }

void embind_4(float embind4) {
  lua_getglobal(ofxOfeliaLua::L, "embind_4");
  lua_pushnumber(ofxOfeliaLua::L, embind4);   
  lua_setglobal(ofxOfeliaLua::L, "embind_4");
  }

void embind_5(const emscripten::val &embind_5) {               
  std::vector<float> rv;  
  const auto l = embind_5["length"].as<unsigned>();     
  rv.resize(l);
  emscripten::val memoryView{emscripten::typed_memory_view(l, rv.data())};  
  memoryView.call<void>("set", embind_5);
  lua_getglobal(ofxOfeliaLua::L, "embind_5");  
  lua_newtable(ofxOfeliaLua::L);  
  for (int i=0; i<rv.size(); i++) { 
    lua_pushnumber(ofxOfeliaLua::L, i+1); 
    lua_pushnumber(ofxOfeliaLua::L, rv[i]); 
    lua_settable(ofxOfeliaLua::L,-3);  
    }     
  lua_call(ofxOfeliaLua::L, 1, 0);       
  }   
 
void embind_6(int width, int height, const emscripten::val &embind_6) {   
  std::vector<int> rv;
  const auto l = embind_6["length"].as<unsigned>();  
  rv.resize(l);
  emscripten::val memoryView{emscripten::typed_memory_view(l, rv.data())};
  memoryView.call<void>("set", embind_6); 
  lua_getglobal(ofxOfeliaLua::L, "embind_6");
  lua_pushnumber(ofxOfeliaLua::L, width);
  lua_pushnumber(ofxOfeliaLua::L, height);  
  lua_newtable(ofxOfeliaLua::L);       
  for (int i=0; i<rv.size(); i++) { 
    lua_pushnumber(ofxOfeliaLua::L, i+1);  
    lua_pushnumber(ofxOfeliaLua::L,  rv[i]); 
    lua_settable(ofxOfeliaLua::L,-3); 
    }      
  lua_call(ofxOfeliaLua::L, 3, 0); 
  }  

EMSCRIPTEN_BINDINGS(my_module) {    
  emscripten::function("embind_1", &embind_1);  
  emscripten::function("embind_2", &embind_2);  
  emscripten::function("embind_3", &embind_3);
  emscripten::function("embind_4", &embind_4);
  emscripten::function("embind_5", &embind_5); 
  emscripten::function("embind_6", &embind_6);
  }

//--------------------------------------------------------------
void ofApp::setup()
{
    // basic settings
    const int numInChannels = 0; // number of audio input channels to use
    const int numOutChannels = 2; // number of audio output channels to use
    const int sampleRate = 44100; // audio sample rate
#ifdef TARGET_EMSCRIPTEN
    const int ticksPerBuffer = 32; // used to compute the audio buffer len: tpb * blocksize (always 64)
#else
    const int ticksPerBuffer = 8; // used to compute the audio buffer len: tpb * blocksize (always 64)
#endif
    const bool bOpenMidiInPort = false; // whether to open midi input port in init()
    const bool bOpenMidiOutPort = false; // whether to open midi output port in init()
    const int midiInPortNum = 0; // midi input port number to open
    const int midiOutPortNum = 0; // midi output port number to open
    const bool bOpenPatch = true; // whether to open a patch in init()
    const string &patchName = "pd/main.pd"; // path of the patch to open (relative to "project/bin/data")
    
    
    // init ofelia
    if (!ofelia.init(numInChannels, numOutChannels,
                     sampleRate, ticksPerBuffer,
                     bOpenMidiInPort, bOpenMidiOutPort,
                     midiInPortNum, midiOutPortNum,
                     bOpenPatch, patchName))
    {
        OF_EXIT_APP(1);
    }   
    ofelia.setup();   
}

//--------------------------------------------------------------
void ofApp::update()
{
    ofelia.update();
}

//--------------------------------------------------------------
void ofApp::draw()
{ 
    ofelia.draw();
}

//--------------------------------------------------------------
void ofApp::exit()
{
    ofelia.exit();
    
    // clear resources
    ofelia.clear();
}

//--------------------------------------------------------------
void ofApp::keyPressed(ofKeyEventArgs &e)
{
    ofelia.keyPressed(e);
}

//--------------------------------------------------------------
void ofApp::keyReleased(ofKeyEventArgs &e)
{
    ofelia.keyReleased(e);  
}
 
//--------------------------------------------------------------
void ofApp::mouseMoved(ofMouseEventArgs &e)
{
    ofelia.mouseMoved(e);
}

//--------------------------------------------------------------
void ofApp::mouseDragged(ofMouseEventArgs &e)
{
    ofelia.mouseDragged(e);
}

//--------------------------------------------------------------
void ofApp::mousePressed(ofMouseEventArgs &e)
{
    ofelia.mousePressed(e); 
}

//--------------------------------------------------------------
void ofApp::mouseReleased(ofMouseEventArgs &e)
{
    ofelia.mouseReleased(e);
}

//--------------------------------------------------------------
void ofApp::mouseEntered(ofMouseEventArgs &e)
{
    ofelia.mouseEntered(e);
}

//--------------------------------------------------------------
void ofApp::mouseExited(ofMouseEventArgs &e)
{
    ofelia.mouseExited(e);
}

//--------------------------------------------------------------
void ofApp::windowResized(ofResizeEventArgs &e)
{
    ofelia.windowResized(e);
}

//--------------------------------------------------------------
void ofApp::messageReceived(ofMessage &e)
{
    ofelia.messageReceived(e);
}

//--------------------------------------------------------------
void ofApp::dragged(ofDragInfo &e)
{
    ofelia.dragged(e);
}
