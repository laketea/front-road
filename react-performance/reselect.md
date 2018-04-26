# reselect

reselect的作用是 可以计算衍生数据， 高效以及可组合的

高效，这点体现在 他只在input-selector数据改变的时候，才会执行衍生数据的计算函数, 在大量selector计算值的情况下，可以适当提高效率

reselect是用来解决什么问题？

解决mapStateToProps频繁计算的问题，因为从react-redux原理来看，每一次state改变，所有的mapStateToProps都会重新计算


```
const getVisibilityFilter = (state, props) =>
  state.todoLists[props.listId].visibilityFilter

const getTodos = (state, props) =>
  state.todoLists[props.listId].todos

const getVisibleTodos = createSelector(
  [ getVisibilityFilter, getTodos ],
  (visibilityFilter, todos) => {
    switch (visibilityFilter) {
      case 'SHOW_COMPLETED':
        return todos.filter(todo => todo.completed)
      case 'SHOW_ACTIVE':
        return todos.filter(todo => !todo.completed)
      default:
        return todos
    }
  }
)

export default getVisibleTodos

const mapStateToProps = (state, props) => {
  return {
    todos: getVisibleTodos(state, props)
  }
}
```


reslect的实现：

两层defaultMemoize