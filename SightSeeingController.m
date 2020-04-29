//
//  SightSeeingController.m
//  SightSeeing
//
//  Created by Kai Wegner on 29.04.20.
//  Copyright 2020 __MyCompanyName__. All rights reserved.
//

#import "SightSeeingController.h"


@implementation SightSeeingController

-(void)awakeFromNib
{
	mCaptureSession = [[QTCaptureSession alloc] init];
	BOOL success = NO;
	NSError *error;
	QTCaptureDevice *device = [QTCaptureDevice defaultInputDeviceWithMediaType:QTMediaTypeVideo];
	//NSDictionary *attributes = [device deviceAttributes];
//	NSEnumerator *attrEnumerator = [attributes objectEnumerator];
//	id attr;
//	while((attr = [attrEnumerator nextObject])){
//		NSLog(@"key=%@ value=%@", attr, [attributes objectForKey:attr]); 
//	}
	
	if(device) {
		success = [device open:&error];
		if(!success){
		}
		mCaptureDeviceInput = [[QTCaptureDeviceInput alloc] initWithDevice:device];
		success = [mCaptureSession addInput:mCaptureDeviceInput error:&error];
		if(!success){
			// handle error
		}
		mCaptureMovieFileOutput = [[QTCaptureMovieFileOutput alloc] init];
		success = [mCaptureSession addOutput:mCaptureMovieFileOutput error:&error];
		if(!success)
		{
			// handle error
		}
		[mCaptureMovieFileOutput setDelegate:self];
//
//		NSEnumerator *connectionEnumerator = [[mCaptureMovieFileOutput connections] objectEnumerator];
//		QTCaptureConnection *connection;
//		
//		while((connection = [connectionEnumerator nextObject])){
//			NSString *mediaType = [connection mediaType];
//			QTCompressionOptions *compressOptions = nil;
//			if([mediaType isEqualToString:QTMediaTypeVideo]){
//				compressOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptions480SizeH264Video"];
//			}else if([mediaType isEqualToString:QTMediaTypeSound]){
//				compressOptions = [QTCompressionOptions compressionOptionsWithIdentifier:@"QTCompressionOptionsHighQualityAACAudio"];
//			}
//			
//			[mCaptureMovieFileOutput setCompressionOptions:compressOptions forConnection:connection];
//		
//		}
		[mCaptureView setCaptureSession:mCaptureSession];	
		[mCaptureSession startRunning];
	}
}

- (void)windowWillClose:(NSNotification *)notification
{
	[mCaptureSession stopRunning];
	[[mCaptureDeviceInput device] close];
}

- (void)dealloc
{
	[mCaptureSession release];
	[mCaptureDeviceInput release];
	[mCaptureMovieFileOutput release];

	[super dealloc];
}


@end
