React-More
===

## JSX
jsx最终会转换为react.element

### react元素类型
元素类型

- 小写开头(div,span等)
- 大写开头(Menu等自定义组件)，类型也可以使用点表示法，但是不能使用其他表达式

jsx转换的时候，如果发现小写，则使用内置的类html组件类型,如果发现大写开头则认为是自定义类型.    
那么这个自定义类型如何跟组件关联呢？ react将element-type作为类似变量名与组件关联，
也就是说组件的声明或者变量引用必须在当前作用域内，否则就会报错

### 属性
- 表达式
- string字面量
- 默认属性true
- Spread属性
- children
    + string字面亮
    + jsx
    + 表达式
    + 函数
    + 忽略的：undefined,null,booleans


## 属性类型检查
通过给组件定义propTypes来配置属性类型检查，但是类型检查只会在开发时有效.

属性检查具体在什么时间点检查呢？

## Refs and the DOM
提供一种方式，在组件中直接引用dom

    <div>
        <input
          type="text"
          ref={(input) => { this.textInput = input; }} />
        <input
          type="button"
          value="Focus the text input"
          onClick={this.focus}
        />
        </div>


