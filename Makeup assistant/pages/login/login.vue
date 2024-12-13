<template>
	<view>
		<view style="position: absolute;top: 200rpx;left: 60rpx;font-size: 60rpx;">
			<view>欢迎登录</view>
		</view>
		<view class="login-from" style="position: absolute; top: 350rpx;left: 80rpx;">
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; ">
				<u-input v-model="username" :border="false" color="#fff" placeholder="请输入账号" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<u-input v-model="password" type="password" :border="false" color="#fff" placeholder="请输入密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<u-button shape="circle" type="primary	" class="u-m-t-30"  @click="login">登录</u-button>
			<view style="text-align: center;margin-top: 35rpx;">
			        <text class="text-grey1">没有账号?</text>
					<!-- 如果没有账号，点击注册文字调用goreguser方法 -->
			        <text style="color: #fff1f6;" @click="reguser()">立即注册</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				username:'',
				password:''
			};
		},
		onLoad() {
			
		},
		methods:{
			// 跳转到注册页面
			reguser(){
				uni.navigateTo({
					url:'/pages/reguser/reguser'
				})
			},
			// login登录发送post请求到后端，登录成功之后存储用户名，密码和token值在mysql数据库中
			login(){
				uni.request({
					url:this.$url+'/user/login',
					method:'POST',
					header:this.$head,
					data:{
						username:this.username,
						password:this.password
					},
					success:(res)=>{
						console.log(res)
						if(res.data.message=="登录失败"||res.data.message=='密码输入错误'){
							uni.showToast({
								title:'登录失败，账号或密码错误',
								icon:'error'
							})
						}else{
							uni.setStorageSync("token",res.data.token)
								console.log(res)
								uni.showToast({
									title:'登录成功',
									icon:'success'
								})
								setTimeout(()=>{
										uni.reLaunch({
										    url: '/pages/index/index'
										})
									},2000)
						}
					}
				})
			}
		}
	}
</script>

<style lang="scss">
		page{
			background-image:url('../../static/1.jpg');
			background-size: cover;
		}

</style>
