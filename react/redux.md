redux
===

## 安装

npm install --save redux
npm install --save react-redux
npm install --save-dev redux-devtools

## 概念
### ACTION
export const ADD_TODO = 'ADD_TODO';
export function addTodo(text) {
  return { type: ADD_TODO, text }
}

## REDUCERS

## STORE
创建一个单一的store
let store = createStore(reducers)// 可为空，reducers代表默认数据

发起action
store.dispatch(addTodo('Learn about actions'))// 参数为action

注册监听器
let unsubscribe = store.subscribe(() =>
  console.log(store.getState())
)

注销监听器
unsubscribe()

## 数据流
- store.dispatch(action);
- store 调用reducer来更新state
- 执行注册的subscribe
- redux调用接口更新state

## 搭配react使用
- 安装redux-react
- 使用createStore创建state
    let store = createStore(todoApp)
- 使用Provider包装来，保证所有容器组件可以访问store
    render(
          <Provider store={store}>
            <App />
          </Provider>,
      rootElement
    )
- 使用connect创建容器组件,直接将state对应的属性绑定到props中，以及
- 
    function select(state) {
      return {
        visibleTodos: selectTodos(state.todos, state.visibilityFilter),
        visibilityFilter: state.visibilityFilter
      }
    }

    // 包装 component ，注入 dispatch 和 state 到其默认的 connect(select)(App) 中；
    export default connect(select)(App)

## 搭配router

安装react-router

    npm install --save react-router

配置webpackdevserver

    devServer: {
      historyApiFallback: true,
    }

配置root

    import React, { PropTypes } from 'react';
    import { Provider } from 'react-redux';
    import { Router, Route, browserHistory } from 'react-router';
    import App from './App';

    const Root = ({ store }) => (
      <Provider store={store}>
        <Router history={browserHistory}>
          <Route path="/(:filter)" component={App} />
        </Router>
      </Provider>
    );

    Root.propTypes = {
      store: PropTypes.object.isRequired,
    };

    export default Root;


