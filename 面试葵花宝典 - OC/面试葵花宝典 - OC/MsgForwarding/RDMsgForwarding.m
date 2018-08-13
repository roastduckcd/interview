//
//  RDMsgForwarding.m
//  面试葵花宝典 - OC
//
//  Created by yang song on 2018/8/13.
//  Copyright © 2018 yangsong. All rights reserved.
//

#import "RDMsgForwarding.h"
#import "RDMsgOther.h"
#import "RDMsgCommon.h"
#import <objc/message.h>

@implementation RDMsgForwarding

/**
 动态方法解析
    在该处对方法进行解析,该方法会进入两次，第1步和第4步
 @param sel 未实现的方法
 @return YES 代表处理过(前提是一定要处理过该方法比如class_addMethod) NO，未处理进行下一步
    指定其他解析对象
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0){

    if(sel == @selector(something:)) {
        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(dynamicllyMethod:)), "v@:");
        return YES;
    } else {
        return [super resolveInstanceMethod:sel];
    }
}
- (void)dynamicllyMethod:(NSString *)msg {
    NSLog(@"动态解析方法 : %@", msg);
}

/**
 解析失败的方法可以在这里被转发到指定的对象进行解析

 @param aSelector 未实现的方法
 @return 指定解析方法的备选对象，如果为nil进入下一步方法签名
 */
- (id)forwardingTargetForSelector:(SEL)aSelector OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0){
    RDMsgOther *someObject = [RDMsgOther new];
    if([someObject respondsToSelector:aSelector]) {
        return someObject;
    } else {
        return [super forwardingTargetForSelector:aSelector];
    }
}

/**
 获取方法签名，方法签名包括了方法类型编码(\@encode)等信息
    该方法的调用者需要实现了该方法才能获取到signature, 包括+instanceMethodSignatureForSelector:方法也是一样

 @param aSelector 实现的方法
 @return 方法签名进入5.2步, 如果为nil则消息无法处理进入第5.1步
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE(""){
    // 类型编码写死，不灵活
    // signature 3中获取方式
    // 1. 类方法 通过类型编码获取+signatureWithObjCTypes:
    //    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    //    if(signature) {
    //        return signature;
    //    } else {
    //        return [super methodSignatureForSelector:aSelector];
    //    }
    // 2. 实例方法 通过实现了方法的对象获取-methodSignatureForSelector:
    // 3. 类方法 通过实现了方法的对象获取+instanceMethodSignatureForSelector:

    // 先看父类有无方法
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if(!signature) {
        // 父类也没有，使用一个公共对象处理
        return [RDMsgCommon instanceMethodSignatureForSelector:aSelector];;
    }
    return nil;
}

/**
 没有方法签名，消息解析失败, 程序崩溃

 @param aSelector 失败的消息
 */
- (void)doesNotRecognizeSelector:(SEL)aSelector{
        // 5.1或6 e.1
    NSLog(@"skdjflkdsf");
}

/**
 收到方法签名，进行消息处理. 根据方法签名形成的invocation，去找能调用该方法的对象或更改消息实现。
    1. 可以更换消息selector成本类中实现的方法名，然后调用invoke方法
    2. 或者更换处理消息的对象，如同forwardingTarget方法一样
        设定能处理方法的target：anInvocation.target，然后调用invoke方法
        也可直接使用[anInvocation invokeWithTarget:],这里使用后会同步更改anInvocation.target
    3. 甚至同时更改调用对象和该对象能响应的方法
    4. 不做处理也可
 @param anInvocation 方法调用，包含方法名，方法参数等信息，甚至可以添加
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation OBJC_SWIFT_UNAVAILABLE(""){
        // 5.2 e.2
    RDMsgCommon *common = [RDMsgCommon new];
    if([common respondsToSelector:anInvocation.selector]) {
//        anInvocation.target = other;
//        [anInvocation invoke];
        [anInvocation invokeWithTarget:common];
    } else {
        [super forwardInvocation:anInvocation];
        // 父类继续转转发，如果转发失败，则仍调用- (void)doesNotRecognizeSelector:，程序崩溃
    }
}
@end
