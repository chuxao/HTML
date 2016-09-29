//
//  main.m
//  文件操作
//
//  Created by admin on 15/4/30.
//  Copyright (c) 2015年 viviana. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *path = NSHomeDirectory();     //得到当前程序路径
        NSLog(@"%@",path);
        NSString *filePath = [path stringByAppendingPathComponent:@"file1"];        //组合位置和文件名（新定义的），形成目标文件路径；
        NSLog(@"%@",filePath);
        NSFileManager *fileManager = [NSFileManager defaultManager];        //管理文件NSFileManager初始化
        BOOL result;
        if([fileManager fileExistsAtPath:filePath]){        //测试filePath的所指定的文件是否已经有存在
            NSLog(@"file exist !");
        }else{
            result = [fileManager createFileAtPath:filePath contents:nil attributes:nil];       //向filePath所指定的文件上写入数据，数据来自于data；第二个位置为<#(NSData *)#>；
            if(result == YES){
                NSLog(@"success to create file!");
            }else{
                NSLog(@"fail to create file!");
            }
        }
        
        
        NSString *contentStr = @"hello world!";
        NSData *strData = [contentStr dataUsingEncoding:NSUTF8StringEncoding];      //把内容转化成data类型；
        //在读写文件时，都是先把数据读到缓存区，然后再读写到文件中；NSData类来设置缓存区；
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];      //为进行写入操作打开一个文件
        [fileHandle writeData:strData];     //将data写入文件
        [fileHandle closeFile];         //关闭文件
        BOOL result2;
        NSString *str = @"Hello you!";
        NSArray *array = [[NSArray alloc]initWithObjects:@"one",@"two",@"three",nil];
        result2 = [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
        BOOL result3;
        NSData *data = [NSKeyedArchiver alloc];
        
        
        
    }
    return 0;
}
































