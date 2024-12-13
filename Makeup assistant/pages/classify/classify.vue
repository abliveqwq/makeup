<template>
	<view class="box">
		<view class="content_main">
			<view class="option">
				<view class="item" v-for="(item,index) in icon" @click="clickItem(item,index)"  :class="index == current ? 'name' : ''">
					{{item.type}}
				</view>
			</view>
			<view >
				<view @click="godetail(item)"  v-for="item in list" class="u-body-item u-flex u-p-t-0" style="padding-left: 50rpx;">
					 <image :src="`http://127.0.0.1:3006/list/`+item.images" mode="aspectFit"  ></image>
					<view class="u-body-item-title u-line-3">
						<view style="margin-left: 10rpx;font-weight: bold;font-size: 36rpx;" >
							{{item.name}}
						</view>
						<view style="font-size: 28rpx; color:#afafaf">
							{{item.line}}
						</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				name: '淡妆新手', // 默认分类
				pageNum: 1,
				countStatus: false,
				current: 0,
				icon: [{ type: '全部' }, { type: '淡妆新手' }], // 确保有这个分类
				list: [],
				typename: []
			};
		},
		onLoad() {
			this.geticon()
			this.getlist()
		},
		methods: {
			// 查询列表
			getlist() {
				uni.request({
					url: this.$url + '/api/list',
					method: 'GET',
					header: this.$head,
					success: (res) => {
						if (res.data.data) {
							this.list = this.name 
								? res.data.data.filter(item => {
								
								let image=item.images.split(",")
									if(image.length>=2){
										item.images=image[0]
									}
									return item.type === this.name
								})
								: res.data.data; // 根据当前分类过滤
						
						}
					}
				});
			},
			 clickItem(item, index) {
			        this.current = index;
			        this.name = item.type === '全部' ? '' : item.type;
			        this.pageNum = 1;
			        this.getlist();
			    },
			// 查询分类
			geticon(){
				uni.request({
					url:this.$url+'/api/type',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.icon=res.data.data
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

<style lang="scss" scoped>
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
		width: 220rpx;
		flex: 0 0 220rpx;
		height: 220rpx;
		border-radius: 8rpx;
		margin-left: 12rpx;
	}
	.box {
		height: 100%;
		.content_main {
			margin-top: 20rpx;
			display: flex;
			justify-content: space-between;
			
			.option {
				width: 35%;
				background-color: #fdfdfd;
				border-radius: 0rpx 20rpx 0rpx 0rpx;
				overflow-y: auto;
				height: 1300rpx;
				border-right: 1rpx solid #f7f7f7;
				.item {
					width: 100%;
					height: 120rpx;
					display: flex;
					align-items: center;
					justify-content: center;
					color: #858585;
					border-radius: 0rpx 20rpx 20rpx 0rpx;
					transition: background-color 0.3s ease, color 0.3s ease, font-weight 0.3s ease;
					animation: slideIn 5s ease;
					&.name {
						background-color: #f3f3f3;
						color: #000;
						font-weight: bold;
					}
				}
			}

		}
	}
</style>