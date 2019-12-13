#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetFrameRate(200);
    
    //TEXT
    myFont.load("PTSans.ttc", 46);
    myWidth = myFont.stringWidth("HexCode");
    buttonText[0]="Excercise 1";
    buttonText[1]="Excercise 2";
    buttonText[2]="Excercise 3";

    //LOAD PHOTO
    screenshot[0].load("Basic-Strokes-for-Small-Brush-Pens-REV-iPad.jpg");
    screenshot[1].load("CustomLetteringWorksheets-LoveYou-iPad.jpg");
    screenshot[2].load("Alphabet-Calligraphy-Medium-iPad.jpg");
    
    
    //BUTTONS POSITION
    origin[0].set(230,1800);
    origin[1].set(610,1800);
    origin[2].set(990,1800);
    currentSection=0;
    for (int i=0; i<NUM_SECTIONS;i++){
        button[i].set(origin[i],360,200);
    }
    
    //SIZE BUTTONS
    small.set(10,10,80,80);
    medium.set(10,110,100,100);
    large.set(10,230,120,120);
    size=15;

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    //DRAW PHOTO
    ofSetColor(255);
    screenshot[currentSection].draw(0,0);
    
    //DRAW BUTTONS
    for(int i=0;i<NUM_SECTIONS;i++){
        ofSetColor(255,192,203);
        ofDrawRectangle(button[i]);
        ofSetColor(24,27,18);
        myFont.drawString(buttonText[i],origin[i].x+30,origin[i].y+125);
    }
    ofDrawRectangle(small);
    ofDrawRectangle(medium);
    ofDrawRectangle(large);

    //DRAW BRUSH
    for(int i=0;i<brushStroke.size();i++){
        ofSetColor(24,27,18);
        brushStroke[i].draw();
    }
    
    //DRAW POP-UP
    if(brushStroke.size()>2000){
         ofSetColor(71,206,237);
               ofDrawRectangle(380,700,800,400);
               ofSetColor(24,27,18);
               myFont.drawString("Keep practicing!",500,900);
    }

}
    

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    
    if(touch.y>1500 || touch.y<330){
        for(int i=0;i<NUM_SECTIONS;i++){
            if(button[i].inside(touch)){
                currentSection=i;
                brushStroke.clear();
            }
        }
        if(small.inside(touch)) {
            size=5;
        }
        if(medium.inside(touch)){
            size=10;
        }
        if(large.inside(touch)){
            size=20;
        }
    } else {
        //DISAPPEAR TITLE
       // text=" ";
        ofBackground(250,250,250);
        
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    Brush newBrush;
    newBrush.setup(touch, size);
    brushStroke.push_back(newBrush);

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
