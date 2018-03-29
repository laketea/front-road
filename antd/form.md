form

---

Form 本身只是简单包装了下 form

Form.create

```javascript
create() {
    const formWrapper = createDOMForm(assign({
      fieldNameProp: 'id',
    }, options, {
      fieldMetaProp: FIELD_META_PROP,
    }));

    return functon(Component) {


        return formWrapper(React.createClass({
            
            childContextTypes,
            getChildContext,

            render() {
                this.props.form.getFieldProps = this.deprecatedGetFieldProps;

                const withRef: any = {};
                if (options && options.withRef) {
                  withRef.ref = 'formWrappedComponent';
                }
                return <Component {...this.props} {...withRef} />;
            }

        }))
    }
}
```


## createDOMForm

```

function createDOMForm(option) {
  return createBaseForm({
    ...option,
  }, [mixin]);
}

mixin: {
    getForm,
    validateFieldsAndScroll
}

```

### createBaseForm

```

function createBaseForm() {
    

    function decorate(WrappedComponent) {
        const Form = createReactClass({
            ...

            render() {

                return <WrappedComponent {...props} />
            }
            })
        return argumentContainer(Form, WrappedComponent);
    }

    return decorate;


}
```

### 组件结构

Form
    -> AnonymousWrapped
        -> Component


## 核心问题

双向绑定如何实现？
initialValue 如何实现？


### getFieldDecorator

用法 getFieldDecorator(name, fieldOptions)(<Input />);
高阶函数
本质上是 clone fieldElem实现的，但是默认会赋上管理权的最终影响

通过name，fieldOption生产一部分props
再通过fieldMeta来生成value属性


```javascript



getFieldDecorator(name, fieldOption) {
    const props = this.getFieldProps(name, fieldOption);
    return (fieldElem) => {
      const fieldMeta = this.fieldsStore.getFieldMeta(name);
      const originalProps = fieldElem.props;
      fieldMeta.originalProps = originalProps;
      fieldMeta.ref = fieldElem.ref;
      return React.cloneElement(fieldElem, {
        ...props,
        ...this.fieldsStore.getFieldValuePropValue(fieldMeta),
      });
    };
  }
```



