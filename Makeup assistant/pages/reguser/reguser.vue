<template>
	<view>
		<view style="position: absolute;top: 200rpx;left: 60rpx;font-size: 60rpx;">
			<view>注册账号</view>
		</view>
		<view class="login-from" style="position: absolute; top: 350rpx;left: 80rpx;">
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; ">
				<image src="../../static/我的 (1).png" mode="aspectFill" style="width: 50rpx;height: 50rpx;"></image>
				<u-input   v-model="username"  :border="false" color="#fff" placeholder="请输入账号" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<image src="../../static/密码.png" mode="aspectFill" style="width: 65rpx;height: 65rpx;"></image>
				<u-input type="password" v-model="password" :border="false" color="#fff" placeholder="请输入密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<image src="../../static/密码.png" mode="aspectFill" style="width: 65rpx;height: 65rpx;"></image>
				<u-input type="password"  :border="false" color="#fff" placeholder="确认密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<u-button shape="circle" type="primary	" class="u-m-t-30" @click="edit()" >注册</u-button>
			<view style="text-align: center;margin-top: 35rpx;">
			        <text class="text-grey1">拥有账号?</text>
					<!-- 如果没有账号，点击注册文字调用goreguser方法 -->
			        <text style="color: #fff1f6;" @click="login()">立即登录</text>
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
			login(){
				uni.navigateTo({
					url:'/pages/login/login'
				})
			},
			// 点击注册按钮调用edit方法发送post请求后端，请求成功之后，存到mysql数据库中，注册成功之后跳转到登录页面
				edit() {
					uni.request({
						url: this.$url + '/user/reguser',
						method: 'POST',
						header: this.$head,
						data: {
							username: this.username,
							password: this.password
						},
						success: (res) => {
							if (res.data.message === '用户名和密码不能为空') {
								uni.showToast({
									title: '用户名或密码不能为空',
									icon: 'error'
								});
							} else if (res.data.message === '用户名已存在') {
								uni.showToast({
									title: '已有账号',
									icon: 'error'
								});
							} else if (res.data.message === '用户注册成功') {
								console.log(res)
								uni.showToast({
									title: '注册成功',
									icon: 'success'
								});
								setTimeout(() => {
									uni.navigateTo({
										url: '/pages/login/login'
									});
								}, 2000);
							} else {
								console.log('未知错误:', res);
							}
						}
					});
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
