<template>
	<view>
		<view @click="godetail(item)" style="margin: 30rpx;" class="u-body-item u-flex u-boder-bottom u-col-between u-p-t-0" v-for="item in list" :key="item.collid">
			<image :src="`http://127.0.0.1:3006/list/` + item.images" style="width: 280rpx; height: 280rpx; border-radius: 10rpx"></image>
			<view class="u-body-item-title u-line-2">
				<view class="u-body-item-title u-line-1" style="margin-left: 30rpx; font-weight: bold; font-size: 50rpx;">
					{{ item.name }}
				</view>
				<view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 28rpx; color:#afafaf">
					{{ item.type }}
				</view>
				<view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 28rpx; color:#afafaf">
					{{ item.Briefly }}
				</view>
				<u-button @click="delcoll(item.likeid)" :plain="true" type="error" style="margin-top: 20rpx; margin-right: 20rpx; width: 200rpx;">取消点赞</u-button>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				list: [] // 存储喜欢的列表
			};
		},
		onLoad() {
			this.savecoll(); // 页面加载时查询喜欢的项目
		},
		methods: {
			// 查询喜欢的项目
			savecoll() {
				uni.request({
					url: this.$url + '/api/like',
					method: 'GET',
					header: this.$head,
					success: (res) => {
						console.log(res);
						this.list = res.data.data; // 保存返回的列表数据
					}
				});
			},
			// 取消喜欢的项目
			delcoll(likeid) {
				uni.request({
					url: this.$url + '/api/dellike/' + likeid, // 使用当前项的 collid 进行删除
					method: 'GET',
					header: this.$head,
					success: (res) => {
						console.log(res);
						// 从 list 中移除被删除的项
						this.list = this.list.filter(item => item.likeid !== likeid);
						// 显示删除成功的提示
						uni.showToast({
							title: '取消成功',
							icon: 'success'
						});
					}
				});
			},
			// 跳转到详情页
			godetail(item) {
				uni.navigateTo({
					url: `/pages/detail/detail?id=${item.collid}`
				});
			}
		}
	}
</script>

<style lang="scss">

</style>
