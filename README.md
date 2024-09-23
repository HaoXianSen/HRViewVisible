# HRViewVisible
## Overview（概述）：
Make a UIView or it's subviews hide or unhide and automatically hide it's associate constraints 
（UIView 或者它的子类，自动隐藏并且可控的收起他相关联的约束）

## Situation（场景）：
<img width="574" alt="image" src="https://github.com/user-attachments/assets/75eeadba-65e3-4909-94d6-8d32cf282b95">

We have a cell like this, and tags line is mutable， maybe just have tag1 and tag3， tag2 and tag4 is hide， maybe others. we should hide tag2 and right constraint, hide test4 and left constraint。so you can use this repository。

（如果我们有一个类似于上边图示的cell， 其中tags 一行是可变的，也就是说tags是不固定的, 可能只有tag1 和 tag3， 其中tag2 和 tag4 是隐藏， 我们为了保证间距，我们需要隐藏tag2 的同时，应该将其宽度 & 右边距的约束也隐藏掉，同理tag4 隐藏的同时应该将其宽度&左边距隐藏）

<img width="490" alt="image" src="https://github.com/user-attachments/assets/014d3954-d088-4dea-865d-9309b25e4b49">
For example, if we have a page like the previous one where view2 is dynamic, which means that view2 can be hidden, then in order to keep the spacing of the page, we need to hide view2 and also hide its height & bottom or top margin.

（在比如，我们有如上一个页面，view2 是动态的，也就是说view2 可能会隐藏，那么为了保证页面的间距，我们需要隐藏view2 的同时将其高度 & 下边距或者上边距也隐藏掉。）

## Usage （使用）

## Screenshot (截图)


