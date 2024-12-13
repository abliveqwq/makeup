<template>
	<view>
		<view >
			<view @click="godetail(item)"  v-for="item in list" class="u-body-item u-flex u-p-t-0" >
				 <image :src="`http://127.0.0.1:3006/list/`+item.images" mode="aspectFit" ></image>
				<view class="u-body-item-title u-line-4">
					<view style="margin: 20rpx; font-weight: bold;font-size: 36rpx;" >
						{{item.name}}
					</view>
					<view style="font-size: 28rpx; color:#afafaf">
						{{item.line}}
					</view>
					<view >{{item.type}}</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list: [],
			};
		},
		onLoad(e) {
			this.value=e
			console.log(this.value)
			this.getlist(this.value)
		},
		methods:{
			// 查询列表
			getlist(value){
				console.log(value.typeid)
				uni.request({
					url:this.$url+'/api/list',
					method:'GET',
					header:this.$head,
					success: (res) => {
						 this.list = res.data.data.filter(item => item.typeid == value.typeid);
						 console.log(this.list)
					}
				})
			},
			// 跳转详情页
			godetail(item){
				uni.navigateTo({
					url:`/pages/detail/detail?id=${item.id}`
				})
			}
		}
	}
</script>

<style lang="scss">
.u-card-wrap { 
		background-color: $u-bg-color;
		padding: 1px;
	}
	
	.u-body-item {
		font-size: 32rpx;
		color: #333;
		padding: 20rpx 10rpx;
	}
		
	.u-body-item image {
		width: 320rpx;
		flex: 0 0 320rpx;
		height: 320rpx;
		border-radius: 8rpx;
		margin-left: 12rpx;
	}
</style>
