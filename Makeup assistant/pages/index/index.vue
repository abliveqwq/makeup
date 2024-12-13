<template>
	<view class="content">
		<!-- 搜索框 -->
		<u-search @search="gosearch" @custom="gosearch" v-model="keyword" class="u-m-30"></u-search>
		<!-- 轮播图 -->
		<u-swiper class="u-m-20" :list="swiper" mode="number" height="350"></u-swiper>
		<!-- 分类 -->
		<u-section title="妆容分类" class="u-m-t-20 u-m-l-20" fontSize="36" :right="false"></u-section>
		<view class="u-m-t-20">
			<u-grid :col="6" :border="false">
				<u-grid-item v-for="item in type.slice(0,5)" @click="goclassifly(item)">
					<image :src="`http://127.0.0.1:3006/icon/`+item.icon" style="width: 80rpx; height: 80rpx;"></image>
					<view>{{item.type}}</view>
				</u-grid-item>
				<u-grid-item @click="gotype">
					<image src="../../static/个护化妆.png" style="width: 80rpx; height: 80rpx;"></image>
					<view>更多</view>
				</u-grid-item>
			</u-grid>
		</view>
		<!-- 推荐列表 -->
		<u-section title="妆容教程" class="u-m-t-20 u-m-l-20" fontSize="36"></u-section>
		<view>
		    <view>
		      <u-grid :border="false" col="2" style="padding: 2%"  >
		        <u-grid-item v-for="item in list.slice(0,10)" style="margin-top: 20rpx" @click="godetail(item)"  >
		          <view>
		            <image :src="`http://127.0.0.1:3006/list/`+item.images" mode="aspectFill" style="width: 320rpx; height: 320rpx;border-radius: 10rpx" ></image>
		            <view class="u-line-2" style="font-size: 40rpx; width: 300rpx;">{{item.name}}</view>
		            <view style="font-size: 36rpx;overflow: hidden;text-overflow:ellipsis; white-space: nowrap; width: 160rpx;color: #d6d6d6;margin-top: 8rpx">{{item.Briefly}}</view>
		          </view>
		        </u-grid-item>
		      </u-grid>
		    </view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				swiper:[],
				type:[],
				list:[],
				keyword:''
			}
		},
		onLoad() {
			this.getimage()
			this.gettype()
			this.getlist()
		},
		methods: {
			// 获取轮播图
			getimage(){
				uni.request({
					url:this.$url+'/api/swiper',
					method:'GET',
					header:this.$head,
					success: (res) => {
						this.swiper=res.data.data.map(item=>{
							return	'http://127.0.0.1:3006/swiper/'+item.image
						})
					}
				})
			},
			// 获取分类列表
			gettype(){
				uni.request({
					url:this.$url+'/api/type',
					method:'GET',
					header:this.$head,
					success: (res) => {
						this.type=res.data.data
					}
				})
			},
			// 获取列表
			getlist(){
				uni.request({
					url:this.$url+'/api/list',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.list=res.data.data
					}
				})
			},
			gotype(){
				uni.navigateTo({
					url:'/pages/classify/classify'
				})
			},
			goclassifly(item){
				uni.navigateTo({ 
					url:`/pages/type/type?typeid=${item.typeid}`
				})
			},
			// 跳转搜索页并带搜索框中的内容
			gosearch(){
				uni.navigateTo({
					url:`/pages/search/search?name=${this.keyword}`
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

<style>
	
</style>
