//
//  DispatchTest.m
//  RecordDemo
//
//  Created by huangshan on 2017/8/7.
//  Copyright © 2017年 huangshan. All rights reserved.
//

#import "DispatchTest.h"

static NSInteger t = 0;

@implementation DispatchTest

/**
 DISPATCH_QUEUE_SERIAL是每次运行一个任务，可以添加多个，执行次序FIFO。
 **/
- (void)test1
{
    NSDate *date = [NSDate date];
    
    NSString *daStr = [date description];
    
    const char *queueName = [daStr UTF8String];
    
    //DISPATCH_QUEUE_SERIAL等同于NULL
    dispatch_queue_t myQueue = dispatch_queue_create(queueName, DISPATCH_QUEUE_SERIAL);
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(addTime) userInfo:nil repeats:YES];
    
    //在main_queue中异步将任务放到myQueue队列里
    //放入myQueue的顺序是按代码的执行顺序：任务一，任务二，任务三（因为main_queue是顺序执行）
    //在myQueue取出的顺序是按照FIFO的顺序
    //因为这是一个串行的队列，所以取出后的任务是一个接着一个执行的
    
    
    //执行结果
    //[NSThread sleepForTimeInterval:6]~~~~~~~~6
    //[NSThread sleepForTimeInterval:3]~~~~~~~~9
    //[NSThread sleepForTimeInterval:12]~~~~~~~~21
    
    
    //任务一：
    dispatch_async(myQueue, ^{
        
        [NSThread sleepForTimeInterval:6];
        
        NSLog(@"[NSThread sleepForTimeInterval:6]~~~~~~~~%d", t);
        
    });
    
    //任务二：
    dispatch_async(myQueue, ^{
        
        [NSThread sleepForTimeInterval:3];
        
        NSLog(@"[NSThread sleepForTimeInterval:3]~~~~~~~~%d", t);
        
    });
    
    //任务三：
    dispatch_async(myQueue, ^{
        
        [NSThread sleepForTimeInterval:12];
        
        NSLog(@"[NSThread sleepForTimeInterval:12]~~~~~~~~%d", t);
        
    });
}

-(void)addTime {
    
    ++t;
}

@end
