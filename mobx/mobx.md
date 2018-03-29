# MOBX

mobx是与redux类似的状态管理库，

## 核心概念

被观察者与观察者模式，@observable 以及 @observer

- 状态
- 衍生 (Derivations), 计算属性以及反应
- 动作

参考示例：

```

import { observable } from 'mobx';

class Todo {
    @observable todos =[{
        title: 'test',
        done: false
    }]
}

import { observer } from 'mobx-react';

@observer
class TodoBox extends Component  {
  render() {
    return (
      <ul>
        {this.props.store.todos.map(todo => <li>{todo.title}</li>)}
      </ul>
    )
  }
}

const store = new Store();

render(<TodoBox store={store} />, document.getElementById('root') );
```

## 与redux的对比

redux: reducer, initState, action, dispatch, subscribe

函数式编程思想，复杂的结构以及样子代码，触发action 以及处理reducer, 并且需要显示的subscribe订阅state的更改

mobx：面向对象的领域模型思想，API简单，支持计算属性,比较容易理解以及上手，不需要显示的subscribe state的改变，通过observer 自动根据状态来衍生处理

## 待探索

- 需要以某个实例来实践，model之间如何共享
- mobx的实现原理



