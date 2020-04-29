//
//  SightSeeingController.h
//  SightSeeing
//
//  Created by Kai Wegner on 29.04.20.
//  Copyright 2020 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>

@interface SightSeeingController : NSObject {
	IBOutlet QTCaptureView *mCaptureView;
	QTCaptureSession *mCaptureSession;
	QTCaptureMovieFileOutput *mCaptureMovieFileOutput;
	QTCaptureDeviceInput *mCaptureDeviceInput;
}

@end
