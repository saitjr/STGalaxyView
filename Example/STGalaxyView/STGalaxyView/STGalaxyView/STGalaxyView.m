//
//  STGalaxyView.m
//  STGalaxyView
//
//  Created by TangJR on 1/12/16.
//  Copyright © 2016 tangjr. All rights reserved.
//

//The MIT License (MIT)
//
//Copyright (c) 2016 saitjr
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

#import "STGalaxyView.h"

@interface STGalaxyView () {
    CAEmitterLayer *_emitterLayer;
}

@end

@implementation STGalaxyView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupEmitterLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _emitterLayer.frame = self.bounds;
    _emitterLayer.position = self.center;
    _emitterLayer.emitterPosition = CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetHeight(self.bounds) / 2.0);
    _emitterLayer.emitterSize = self.bounds.size;
}

- (void)setupEmitterLayer {
    _emitterLayer = [CAEmitterLayer new];
    _emitterLayer.backgroundColor = [UIColor blackColor].CGColor;
    _emitterLayer.emitterShape = kCAEmitterLayerPoint;
    [self.layer addSublayer:_emitterLayer];
    
    CAEmitterCell *cell = [CAEmitterCell new];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snowflake1"].CGImage);
    cell.birthRate = 6;
    cell.lifetime = 10;
    cell.velocity = 300.0;
    cell.scale = 0.5;
    cell.scaleRange = 0.2;
    cell.scaleSpeed = 0.05;
    cell.alphaSpeed = 0.8;
    cell.alphaRange = 0;
    cell.color = [UIColor colorWithWhite:1 alpha:0].CGColor;
    cell.emissionLongitude = -M_PI_2;
    cell.emissionRange = M_PI;
    cell.velocityRange = 20.0;
    _emitterLayer.emitterCells = @[cell];
}

@end