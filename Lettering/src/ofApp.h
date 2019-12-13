#pragma once

#include "ofxiOS.h"
#include "Brush.h"

#define NUM_SECTIONS 3

class ofApp : public ofxiOSApp {
    
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    ofVec2f touchPoint;
    ofTrueTypeFont myFont;
    float myWidth;
    ofImage exampleImage;
    ofPixels pixels;
    ofColor myColor;
    
    ofImage screenshot[NUM_SECTIONS];
    ofRectangle button[NUM_SECTIONS];
    string buttonText[NUM_SECTIONS];
    ofRectangle small, medium, large;
    ofVec2f origin[NUM_SECTIONS];
    int currentSection;
    vector <Brush> brushStroke;
    float size;
};
