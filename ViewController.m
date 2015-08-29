//
//  ViewController.m
//  GCDWebUploader
//
//  Created by jia on 15/8/28.
//  Copyright (c) 2015年 jia. All rights reserved.
//

#import "ViewController.h"

#import "GCDWebUploader.h"
#import "GCDWebServerDataResponse.h"

@interface ViewController () <GCDWebUploaderDelegate>
{
    GCDWebUploader* _webServer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self startWebServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Inner Methods

- (void)startWebServer
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    _webServer = [[GCDWebUploader alloc] initWithUploadDirectory:documentsPath];
    _webServer.delegate = self;
    _webServer.allowHiddenItems = YES;
    [_webServer start];
    
    // web 地址 自动拷贝到粘贴板 方便用户在浏览器内输入
}

#pragma mark - GCDWebUploaderDelegate
/**
 *  Delegate methods for GCDWebUploader.
 *
 *  @warning These methods are always called on the main thread in a serialized way.
 */
- (void)webUploader:(GCDWebUploader*)uploader didDownloadFileAtPath:(NSString*)path
{
    
}

/**
 *  This method is called whenever a file has been uploaded.
 */
- (void)webUploader:(GCDWebUploader*)uploader didUploadFileAtPath:(NSString*)path
{
    
}

/**
 *  This method is called whenever a file or directory has been moved.
 */
- (void)webUploader:(GCDWebUploader*)uploader didMoveItemFromPath:(NSString*)fromPath toPath:(NSString*)toPath
{
    
}

/**
 *  This method is called whenever a file or directory has been deleted.
 */
- (void)webUploader:(GCDWebUploader*)uploader didDeleteItemAtPath:(NSString*)path
{
    
}

/**
 *  This method is called whenever a directory has been created.
 */
- (void)webUploader:(GCDWebUploader*)uploader didCreateDirectoryAtPath:(NSString*)path
{
    
}

#pragma mark - GCDWebServerDelegate
/**
 *  This method is called after the server has successfully started.
 */
- (void)webServerDidStart:(GCDWebServer*)server
{
    NSLog(@"\n\nServerURL: %@, port: %lu\n\n", server.serverURL, (unsigned long)server.port);
}

/**
 *  This method is called after the Bonjour registration for the server has
 *  successfully completed.
 */
- (void)webServerDidCompleteBonjourRegistration:(GCDWebServer*)server
{
    NSLog(@"\n\nBonjourURL: %@\n\n", server.bonjourServerURL);
}

/**
 *  This method is called when the first GCDWebServerConnection is opened by the
 *  server to serve a series of HTTP requests.
 *
 *  A series of HTTP requests is considered ongoing as long as new HTTP requests
 *  keep coming (and new GCDWebServerConnection instances keep being opened),
 *  until before the last HTTP request has been responded to (and the
 *  corresponding last GCDWebServerConnection closed).
 */
- (void)webServerDidConnect:(GCDWebServer*)server
{
    
}

/**
 *  This method is called when the last GCDWebServerConnection is closed after
 *  the server has served a series of HTTP requests.
 *
 *  The GCDWebServerOption_ConnectedStateCoalescingInterval option can be used
 *  to have the server wait some extra delay before considering that the series
 *  of HTTP requests has ended (in case there some latency between consecutive
 *  requests). This effectively coalesces the calls to -webServerDidConnect:
 *  and -webServerDidDisconnect:.
 */
- (void)webServerDidDisconnect:(GCDWebServer*)server
{
    
}

/**
 *  This method is called after the server has stopped.
 */
- (void)webServerDidStop:(GCDWebServer*)server
{
    
}
@end
