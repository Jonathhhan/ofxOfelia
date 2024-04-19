// communication folder bindings
// 2017 Dan Wilcox <danomatika@gmail.com>

// ----- ofSerial.h -----

// DIFF: ofSerial.h: pass binary data as full char strings
%apply(unsigned char *STRING, int LENGTH) {(unsigned char * buffer, int length)};

%include "communication/ofSerial.h"

// clear typemap
%clear(unsigned char * buffer, int length);
