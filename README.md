# HRViewVisible
[![CI Status](https://img.shields.io/travis/1335430614@qq.com/HRViewVisible.svg?style=flat)](https://travis-ci.org/1335430614@qq.com/HRViewVisible)
[![Version](https://img.shields.io/cocoapods/v/HRViewVisible.svg?style=flat)](https://cocoapods.org/pods/HRViewVisible)
[![License](https://img.shields.io/cocoapods/l/HRViewVisible.svg?style=flat)](https://cocoapods.org/pods/HRViewVisible)
[![Platform](https://img.shields.io/cocoapods/p/HRViewVisible.svg?style=flat)](https://cocoapods.org/pods/HRViewVisible)

## Overview（概述）：
Make a UIView or it's subviews hide or unhide and automatically hide it's associate constraints 
（UIView 或者它的子类，自动隐藏并且可控的收起他相关联的约束）

## Situation（场景）：
<img width="517" alt="image" src="https://github.com/user-attachments/assets/0de187f5-68b8-4ae2-b99d-b083d46b3545">


We have a cell like this, and tags line is mutable， maybe just have tag1 and tag3， tag2 and tag4 is hide， maybe others. we should hide tag2 and right constraint, hide test4 and left constraint。so you can use this repository。

（如果我们有一个类似于上边图示的cell， 其中tags 一行是可变的，也就是说tags是不固定的, 可能只有tag1 和 tag3， 其中tag2 和 tag4 是隐藏， 我们为了保证间距，我们需要隐藏tag2 的同时，应该将其宽度 & 右边距的约束也隐藏掉，同理tag4 隐藏的同时应该将其宽度&左边距隐藏）

<img width="490" alt="image" src="https://github.com/user-attachments/assets/014d3954-d088-4dea-865d-9309b25e4b49">
For example, if we have a page like the previous one where view2 is dynamic, which means that view2 can be hidden, then in order to keep the spacing of the page, we need to hide view2 and also hide its height & bottom or top margin.

（在比如，我们有如上一个页面，view2 是动态的，也就是说view2 可能会隐藏，那么为了保证页面的间距，我们需要隐藏view2 的同时将其高度 & 下边距或者上边距也隐藏掉。）

## Usage （使用）

* pod 'HRViewVisible', '~> 1.0.0'

## Screenshot (截图)
<img width="375" alt="image" src="https://github.com/HaoXianSen/HRViewVisible/blob/main/Snapshot/snapshot1.gif"> <img width="375" alt="image" src="https://github.com/HaoXianSen/HRViewVisible/blob/main/Snapshot/snapshot2.gif">

## Author (联系我)

harry_c2016@163.com

## License (许可)

HRViewVisible is available under the MIT license. See the LICENSE file for more info.


