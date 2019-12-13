#pragma once

#include "ofxiOS.h"

class Brush {
    
    public:
    void setup(ofVec2f touch, float globalSize){
        pos = touch;
        size = globalSize;
    }
    void draw(){
        ofDrawCircle(pos,size);
    }
    ofVec2f pos;
    float size;
};
