<template>
	<view>
		<u-section title="商品列表" class="u-m-t-20 u-m-l-20" fontSize="36" :right="false"></u-section>
		<!-- 商品信息 -->
		<view style="margin:20rpx;" class="u-body-item u-flex u-boder-bottom u-col-between u-p-t-0" v-for="item in order" :key="item.id">
		    <image :src="`http://127.0.0.1:3006/hzlist/` + item.images" mode="aspectFill" style="height: 260rpx; border-radius: 20rpx;"></image>
		    <view class="u-body-item-title u-line-2">
		        <view class="u-body-item-title u-line-2" style="margin-left: 20rpx; font-size: 36rpx; font-weight: bold;">
		            {{ item.name }}
		        </view>
		        <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 28rpx; color:#afafaf">
		            {{ item.type }}
		        </view>
		        <view style="display: flex;">
		            <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 36rpx; color:red">
		                {{ item.price }}元
		            </view>
		            <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 36rpx; color:red">
		                {{ item.Plant }}人种草
		            </view>
		        </view>
		    </view>
		</view>
		<u-section title="收货地址" class="u-m-t-20 u-m-l-20" fontSize="36" :right="false"></u-section>
		<view class="u-m-30" v-if="address.length > 0">
			<view v-if="defaultAddress" style="font-size: 36rpx;">
			    <text>选择地址：</text>
			    <text>{{ defaultAddress.recipient_name }} {{ defaultAddress.phone_number }} {{ defaultAddress.address }}</text>
			</view>
		</view>
		<view v-else style="margin: 30rpx; font-size: 36rpx;">
		    <p>没有收货地址可显示</p>
		</view>
		<p @click="newaddress" style="text-align: center; font-size: 36rpx; color:darkblue">新增地址</p>
		<view class="u-m-30">
			<view style="font-size: 36rpx; font-weight: bold;">价格:{{this.price}}</view>
		</view>
		<u-button style="margin: 50rpx;" @click="show=true">支付</u-button>
		<!-- 输入支付密码 -->
			<u-modal v-model="show"  @confirm="edit">
				<u-input v-model="value" class="u-m-30" type="password" maxlength="6" ></u-input>
			</u-modal>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				price:'',
				list:[],
				order:[],
				address:[],
				show:false,
				value:'',
				defaultAddress: null,
			};
		},
		onLoad(e) {
			this.price=e.totalPrice
			this.list=e.selectedIds
			this.getshop()
			this.getaddress()
			 this.loadDefaultAddress();
		},
		methods:{
			// 支付成功，死代码
			edit(){
				if(this.value==0){
					uni.showToast({
						title:'请输入支付密码',
						icon:'error'
					})
				}else{
					uni.showToast({
						title:'支付成功',
						icon:'success'
					})
					setTimeout(()=>{
						uni.reLaunch({
							url:'/pages/index/index'
						})
					},2000)
				}
				if(this.address==0){
					uni.showToast({
						title:'请新增地址',
						icon:'error'
					})
				}
			},
			// 查询购物车
			getshop(list) {
			    uni.request({
			        url: this.$url + '/api/shop',
			        method: 'GET',
			        header: this.$head,
			        success: (res) => {
						 this.order = res.data.data.filter(item => this.list.includes(item.id));
			        }
			    });
			},
			// 从本地拿收货地址出来
			  loadDefaultAddress() {
						this.defaultAddress = uni.getStorageSync('defaultAddress');
					},
			// 查询收货地址
			getaddress(){
				// 发送get请求
				uni.request({
					url:this.$url+'/api/address',
					method:'GET',
					header:this.$head,
					success: (res) => {
						// console.log(res)
						this.address=res.data.data
						console.log(this.address)
					}
				})
			},
			newaddress(){
				uni.navigateTo({
					url:'/pages/newaddress/newaddress'
				})
			}
		}
	}
</script>

