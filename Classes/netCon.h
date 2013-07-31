//
//  netCon.h
//  FitNexus
//
//  Created by keith on 23/11/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface netCon : NSObject {
	AsyncSocket * mySocket;
}



-(int)init;
-(void) sendData:(NSString *) msg;
//-(void) sendData:(NSString *) msgString;
-(void) onSocketDidDisconnect:(AsyncSocket *)sock;

-(void) onSocket: (AsyncSocket *)sock willDisconnectWithError:(NSError *)err;
-(void) onSocket:(AsyncSocket *)sock didAcceptNewSocket:(AsyncSocket *)newSocket;

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port;

-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData*) data withTag: (long)tag;

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag;





- (void)dealloc;


@end
