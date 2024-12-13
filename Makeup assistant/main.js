import App from './App'

//导入uview组件
import uView from "uview-ui";
Vue.use(uView);

//封装
Vue.prototype.$url = 'http://127.0.0.1:3006'

//请求拦截，配置Token等参数
const head = {
	Authorization:'Bearer '+uni.getStorageSync('token')
}
Vue.prototype.$head = head


// #ifndef VUE3
import Vue from 'vue'
import './uni.promisify.adaptor'
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  ...App
})
app.$mount()
// #endif

// #ifdef VUE3
import { createSSRApp } from 'vue'
export function createApp() {
  const app = createSSRApp(App)
  return {
    app
  }
}
// #endif