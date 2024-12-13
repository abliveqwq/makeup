<template>
	<view>
		<view class="login-from" style="position: absolute; top: 80rpx;left: 80rpx;">
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<u-input v-model="ord" :border="false" color="#fff" placeholder="请输入原来的密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<u-input v-model="news"   :border="false" color="#fff" placeholder="请输入新的密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<view style="display: flex; background:Rgba(255, 255, 255, 0.6); width: 600rpx; padding: 20rpx; border-radius: 50rpx; margin-top: 20rpx;">
				<u-input :border="false" color="#fff" placeholder="确认密码" style="padding-left:25rpx;" placeholder-style="color:#333"></u-input>
			</view>
			<u-button shape="circle" type="primary	" class="u-m-t-30" @click="edit()" >修改密码</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				ord:'',
				news:''
			};
		},
		onLoad() {
			
		},
		methods:{
			// edit方法发送post请求到后端，修改成功之后存储新的密码在mysql数据库中
			edit(){
				uni.request({
					url:this.$url+"/info/updatepwd",
					method:'POST',
					header:this.$head,
					data:{
						oldPassword:this.ord,
						newPassword:this.news
					},
					success: (res) => {
						console.log(res);
						if(res.statusCode==401||res.statusCode==500){
							uni.showToast({
								title:'密码有误',
								icon:'error'
							})
						}else{
							uni.showToast({
								title:'修改成功',
								icon:'success'
							})
							setTimeout(()=>{
								uni.switchTab({
									url:'/pages/user/user'
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
			background-color: #FAACA8;
			background-image: linear-gradient(19deg, #FAACA8 0%, #DDD6F3 100%);
		}

</style>
