<template>
	<view class="my">
		<image class="img" src="../../static/dasdasdasd.jpg"  mode="aspectFill" ></image>
		<view class="personal">
			<view class="name-profile">
				<u-avatar :size="140" :src="'http://127.0.0.1:3006/'+list.avatar" class="head"></u-avatar>
				<view class="info">
					<view class="name">{{list.username ||'Allen'}}</view>
					<view class="profile">{{list.nickname ||'未设置昵称'}}</view>
					<view class="profile">{{list.profile  ||'这家伙很懒，什么都没有留下！'}}</view>
				</view>
			</view>
			<view class="from">
				<u-cell-group>
					<u-cell-item title="修改信息" @click="info" ></u-cell-item>
					<u-cell-item title="我的收藏" @click="cell"></u-cell-item>
					<u-cell-item title="我的喜欢" @click="history"></u-cell-item>
					<u-cell-item title="修改密码" @click="password" ></u-cell-item>
					<u-cell-item title="意见反馈" ></u-cell-item>
				</u-cell-group>
			</view>
			<!-- 退出登录按钮 -->
			<u-button class="u-m-50" type="primary" shape="circle" @click="edit()">退出登录</u-button>
		</view>
	</view>
</template>
 
<script>
	export default {
		data() {
			return {
				list:[]
			}
		},
		onLoad() {
			this.getuser()
		},
		methods: {
			//  发送get请求连接mysql数据库查询用户信息
			getuser(){
				console.log(this.$head)
				uni.request({
					url:this.$url+'/info/userinfo',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.list=res.data.user
						console.log(this.list)
					}
				})
			},
			info(){
				uni.navigateTo({
					url:'/pages/userinfo/userinfo'
				})
			},
			cell(){
				uni.navigateTo({
					url:'/pages/cell/cell'
				})
			},
			history(){
				uni.navigateTo({
					url:'/pages/hos/hos'
				})
			},
			password(){
				uni.navigateTo({
					url:'/pages/password/password'
				})
			},
			edit(){
				uni.reLaunch({
					url:'/pages/login/login'
				})
			}
		},
	}
</script>
 
<style lang="scss">
	.img {
		width: 100%;
	}
	.personal {
		height: 810rpx;
		background: linear-gradient(to bottom, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.7));
		/* 渐变透明白色背景 */
		margin: 20rpx;
		border-radius: 20rpx 20rpx 0 0;
		margin-top: -100rpx;
		position: relative;
		box-shadow: 0 10rpx 20rpx rgba(0, 0, 0, 0.1);
		z-index: 10;
		/* 确保高于其他元素 */
		.name-profile {
			padding: 35rpx;
			display: flex;
			align-items: flex-start;
			position: relative;
			.head {
				margin-top: -10rpx;
				/* 确保头像左边界紧贴容器左边 */
				border-radius: 50%;
				width: 150rpx;
				height: 150rpx;
			}
			.info {
				display: flex;
				flex-direction: column;
				justify-content: center;
				margin-left: 50rpx;
			}
			.name {
				font-size: 35rpx;
				margin-top: 10rpx;
				margin-bottom: 10rpx;
				color: #0c34ba;
				font-weight: 600;
			}
			.profile {
				margin-top: 10rpx;
				color: #646566;
				font-size: 24rpx;
				font-weight: 400;
			}
		}
		.from {
			color: #646566;
			margin-top: 80rpx;
			font-size: 40rpx;
		}
	}
</style>