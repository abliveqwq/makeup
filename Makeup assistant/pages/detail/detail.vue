<template>
	<view>
		<!-- 轮播图 -->
		<u-swiper class="u-m-10" :list="swiper"  height="1100" img-mode="aspectFill"></u-swiper>
		<!-- 标题 -->
		<view style="padding: 25rpx; font-size: 46rpx; font-weight: bold;">{{list.name}}</view>
		<!-- 简略 -->
		<view style="padding: 15rpx; font-size: 36rpx;">{{list.line}}</view>
		<!-- 点赞和收藏 -->
		<view class="u-m-20" style="display: flex;">
			<!-- 点赞 -->
			<view class="u-m-r-100" @click="getlike(id)">
					<!-- 点赞成功 -->
					<view>
						<view style="" v-if="good" @click="good=false" >
						<image src="../../static/点赞.png" style="width: 75rpx; height: 75rpx;"></image>
						</view>
					</view>
					<!-- 取消点赞 -->
					<view>
						<view style="" v-if="!good" @click="good=true" >
						<image src="../../static/点赞 (1).png" style="width: 75rpx; height: 75rpx;"></image>
					</view>
				</view>
			</view>
			<!-- 收藏 -->
			<view class="u-m-l-60" @click="getcoll(id)">
				<!-- 收藏成功 -->
				<view>
					<view style="" v-if="coll" @click="coll=false" >
					<image src="../../static/收藏.png" style="width: 75rpx; height: 75rpx;"></image>
					</view>
				</view>
				<!-- 取消收藏 -->
				<view>
					<view style="" v-if="!coll" @click="coll=true" >
					<image src="../../static/收藏 (1).png" style="width: 75rpx; height: 75rpx;"></image>
					</view>
				</view>
			</view>
		</view>
		<hr class="u-m-t-10">
		<!-- 评论 -->
		<u-section title="评论" class="u-m-t-30 u-m-l-20" fontSize="36" :right="false"></u-section>
		<!-- 发表评论 -->
		<view style="display: flex;" class="u-m-20">
			<image :src="'http://127.0.0.1:3006/'+user.avatar" mode="aspectFill" style="width: 88rpx; height: 88rpx; border-radius: 50rpx;"></image>
			<u-input v-model="comment" :auto-height="true"  :border="true"  class="u-m-l-20" style="background-color: #f7f7f7;"/>
			<u-button @click="setcomment()" :plain="true" type="error" style="margin-left: 10rpx;">发送</u-button>
		</view>
		
		<hr class="u-m-t-20">
		<!-- 评论区 -->
		<view  style="display: flex; margin-top: 35rpx; margin-left: 20rpx;" v-for="item in type">
			<!-- <image :src="'http://127.0.0.1:3006/'+comment.avatar" mode="aspectFill" style="width: 100rpx; height: 100rpx; border-radius: 50rpx;"></image> -->
			<u-avatar :size="140" :src="'http://127.0.0.1:3006/'+item.avatar" class="head" size="large" style="padding-left: 5rpx;" ></u-avatar>
			<view style="font-size: 36rpx; padding-left: 25rpx;">{{item.username}}</view>
			<view style="font-size: 40rpx; margin-top: 50rpx;margin-left: -70rpx;">{{item.comment}}</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				id:'',
				list:[],
				swiper:[],
				good:true,
				coll:true,
				likeid:[],
				collid:[],
				type:[],
				user:[],
				comment:'',
				times:''
			};
		},
		onLoad(e) {
			this.id=e.id;//拿到id并渲染
			this.getdetail()
			this.getcomment()
			this.getuser()
		},
		methods:{
			// 查询个人信息
			getuser(){
				console.log(this.$head)
				uni.request({
					url:this.$url+'/info/userinfo',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.user=res.data.user
						console.log(this.user)
					}
				})
			},
			// 获取详情信息
				getdetail() {	
					uni.request({
						url: this.$url + '/api/detail',
						method: 'GET',
						header: this.$head,
						success: (res) => {
							const detail = res.data.data.find(item => item.id == this.id);
							if (detail) {
								this.list = detail;
								this.swiper = detail.images.split(',').map(image => {
									return 'http://127.0.0.1:3006/detail/' + image;
								});
							}
						}
					});
				},
			// 查询喜欢
			setlike(){
				uni.request({
					url:this.$url+'/api/like',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.likeid=res.data.data[0].likeid
					}
				})
			},
			// 往后端里面发送喜欢请求
			getlike(id){
				if(this.good==true){
					uni.request({
						url:this.$url+'/api/dellike/'+this.likeid,
						method:'GET',
						header:this.$head,
						success: (res) => {
							console.log(res)
							this.likeid=this.like
							uni.showToast({
								title:'取消成功',
								icon:'success'
							})
						}
					})
				}else{
					uni.request({
						url:this.$url+'/api/like',
						method:'POST',
						header:this.$head,
						data:{like:this.id},
						success: (res) => {
							this.like=this.like
							uni.showToast({
								title:'点赞成功',
								icon:'success'
							})
						}
					})
					this.setlike(this.like)
					console.log(this.like)
				}
			},
			// 查询收藏
			setcoll(){
				uni.request({
					url:this.$url+'/api/coll',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
					}
				})
			},
			// 往后端里面发送收藏请求
			getcoll(id){
				if(this.coll==true){
					uni.request({
						url:this.$url+'/api/delcoll/'+this.collid,
						method:'GET',
						header:this.$head,
						success: (res) => {
							console.log(res)
							this.collid=this.coll
							uni.showToast({
								title:'取消成功',
								icon:'success'
							})
						}
					})
					this.setcoll(this.coll)
					console.log(this.coll)
				}else{
					uni.request({
						url:this.$url+'/api/coll',
						method:'POST',
						header:this.$head,
						data:{coll:this.id},
						success: (res) => {
							this.coll=this.coll
							uni.showToast({
								title:'收藏成功',
								icon:'success'
							})
						}
					})
					this.setcoll(this.coll)
					console.log(this.coll)
				}
			},
			// 查询评论
			getcomment(){
				uni.request({
					url:this.$url+'/api/comment',
					method:'GET',
					header:this.$head,
					success: (res) => {
						console.log(res)
						this.type=res.data.data.filter(item=>item.commid == this.id)
					}
				})
			},
			// 发布评论
			setcomment(){
			    uni.request({
			        url: this.$url + '/api/comment',
			        method: 'POST',
			        header: this.$head,
			        data: {
			            commid: this.id,
			            avatar: this.user.avatar,
			            username: this.user.nickname,
			            comment: this.comment
			        },
			        success: (res) => {
			            console.log(this.comment);
			            console.log('发布成功');
			            uni.showToast({
			                title: '发布成功',
			                icon: 'success'
			            });
			        }
			    });
			}

		}
	}
</script>

<style lang="scss">
  hr {
        border: none; /* 移除默认边框 */
        height: 0.5rpx; /* 设置线条高度 */
        background-color: #afafaf; /* 设置线条颜色 */
    }
</style>
