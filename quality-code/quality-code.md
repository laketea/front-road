quality-code
---

## NOTE1

> FROM http://taobaofed.org/blog/2017/01/05/writing-readable-code/

#### 命名
名词命名对象，动词命名函数，
复数表示数组，对于复数与单数一样或者需要特别强调复数的数组，则用list来表示

#### 函数单一职责
函数只做一件事情，如果需要处理多个事情，则拆分成不同的接口
例如:
``` 
async function fetchUserInfo(id) {
  const isSingle = typeof idList === 'string';
  const idList = isSingle ? [id] : id;
  const result = await request.post('/api/userInfo', {idList});
  return isSingle ? result[0] : result;
}

// 可以这样调用
const userList = await fetchUserInfo(['1011', '1013']);
// 也可以这样调用
const user = await fetchUserInfo('1017');
```

#### 控制函数的副作用
尽量控制函数的副作用

```
//ERROR
async function getUserDetail(id) {
  const user = await fetchSingleUserInfo(id);
  await addFavoritesToUser(user);
  ...
}
async function addFavoritesToUser(user) {
  const result = await fetchUserFavorits(user.id);
  user.favoriteBooks = result.books;
  user.favoriteSongs = result.songs;
  user.isMusicFan = result.songs.length > 100;
}

//RIGHT
async function getUserDetail(id) {
  const user = await fetchSingleUserInfo(id);
  const {books, songs, isMusicFan} = await getUserFavorites(id);
  //不在getUserFavorites函数里面修改user，而是返回数据assign
  return Object.assign(user, {books, songs, isMusicFan})
}
async function getUserFavorites(id) {
  const {books, songs} = await fetchUserFavorits(user.id);
  return {
    books, songs, isMusicFan: result.songs.length > 100
  }
}
```

#### 非侵入性地改造函数
函数是一段独立和内聚的逻辑,改造函数的时候，我们不一定要改函数内部的逻辑，而是可以在外面独立实现高阶函数来包装一下逻辑,这里面其实是利用了函数组合的概念

```
//ERROR
const userInfoMap = {};
const fetchUserInfo = (userId, callback) => {
  if (userInfoMap[userId]) {            // 新增代码
    callback(userInfoMap[userId]);    // 新增代码
  } else {                              // 新增代码
    const param = {
      // ... 参数
    };
    request(param, (result) => {
      userInfoMap[userId] = result;   // 新增代码
      callback(result);
    });
  }
}

//RIGHT
const memorizeThunk = (func, reducer) => {
  const cache = {};
  return (...args, callback) => {
    const key = reducer(...args);
    if (cache[key]) {
      callback(...cache[key]);
    } else {
      func(...args, (...result) => {
        cache[key] = result;
        callback(...result);
      });
    }
  }
}
const fetchUserInfo = (userInfo, callback) => {
  // 原来的逻辑
}
const fetchUserInfoCache = memorize(fetchUserInfo, (userId) => userId);
```

