<template>
	<view class="my">
		<image class="img" src="../../static/asdcasdcasd.jpg"  mode="aspectFill" ></image>
		<view class="personal">
			<view class="name-profile">
				<u-avatar @click="avatar" :size="140" :src="'http://127.0.0.1:3006/'+data.avatar" class="head"></u-avatar>
				<view class="info">
					<view class="name">{{data.username ||'Allen'}}</view>
					<view class="profile">{{data.profile ||'这家伙很懒，什么都没有留下！'}}</view>
				</view>
			</view>
			<view class="from">
				<u-cell-group>
					<u-cell-item title="昵称"  @click="nickname" v-model="nick"  ><view>{{data.nickname}}</view></u-cell-item>
					<u-cell-item title="性别"  @click="sex1"  v-model="sex" ><view>{{data.sex}}</view></u-cell-item>
					<u-cell-item title="手机号码"  @click="phonenum"  v-model="phone"  ><view>{{data.phone}}</view></u-cell-item>
					<u-cell-item title="简介"  @click="prof"  v-model="profile"  ><view>{{data.profile}}</view></u-cell-item>
				</u-cell-group>
			</view>
			<!-- 退出登录按钮 -->
			<u-button class="u-m-50" type="primary" shape="circle" @click="edit()">修改信息</u-button>
		</view>
	</view>
</template>
 
<script>
	export default {
		data() {
			return {
				pic:'https://uviewui.com/common/logo.png',
				nick:'',
				sex:'',
				phone:'',
				profile:'',
				data:[]
			}
		},
		onLoad() {
			this.getuser()
		},
		methods: {
			avatar(){
				uni.chooseImage({
				    count: 1, 
				    success: (res) => {
				        uni.uploadFile({
				            url: this.$url+'/info/update/avatar', 
				            method: 'POST', 
				            header: this.$head, 
				            filePath: res.tempFilePaths[0], 
				            name: 'file', 
				            success: (res) => {
				                console.log(res); 
				                this.data.avatar = JSON.parse(res.data).data
								console.log(this.data.avatar)
				            }
				        });
				    }
				});
			},
			getuser(){
				uni.request({
					url:this.$url+'/info/userinfo',
					method:'GET',
					header:this.$head,
					data:{
						avatar:this.data.avatar,
						nickName:this.nickname,
						phone:this.phone,
						sex:this.sex,
						profile:this.profile
					},
					success: (res) => {
						console.log(res);
						this.data=res.data.user	
					}
				})
			},
			nickname(){
				uni.showModal({
					title:"昵称",
					content:this.nick.nickName,
					editable:true,
					success: (res) => {
						console.log(res)
						if(res.confirm){
							this.nick=res.content
							this.getuser()
						}
					}
				})
			},
			sex1(){
				uni.showModal({
					title:"性别",
					content:this.sex.sex,
					editable:true,
					success: (res) => {
						console.log(res)
						if(res.confirm){
							this.sex=res.content
							this.getuser()
						}
					}
				})
			},
			phonenum(){
				uni.showModal({
					title:"手机号码",
					content:this.phone.phone,
					editable:true,
					success: (res) => {
						console.log(res)
						if(res.confirm){
							this.phone=res.content
							this.getuser()	
							success: (res) => {
								this.phone = this.phone	
								console.log(this.phone)
							}
						}
					},
					
				})
			},
			prof(){
				uni.showModal({
					title:"简介",
					content:this.profile.profile,
					editable:true,
					success: (res) => {
						console.log(res)
						if(res.confirm){
							this.profile=res.content
							console.log(this.profile)
						}
					}
				})
			},	
			edit(){
				uni.request({
					url:this.$url+'/info/userinfo',
					method:'POST',
					header:this.$head,
					data:{
						avatar:this.data.avatar,
						nickname:this.nick,
						phone:this.phone,
						sex:this.sex,
						profile:this.profile
					},
					success: (res) => {
						console.log(this.user_prc,this.nick,this.sex,this.phone,this.profile)
						console.log(res);
						if(this.phone==''){
							alert('手机号输入不能为空')
						}else{
							uni.showToast({
								title:'修改成功',
								icon:'success'
							})
							setTimeout(()=>{
								// 跳转到个人中心页面并刷新
								uni.reLaunch({
									url:'/pages/user/user'
								})
							},2000)
						}
					}
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
		height: 630rpx;
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
			margin-top: 20rpx;
			font-size: 40rpx;
		}
	}
</style>