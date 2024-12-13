<template>
    <view>
        <view class="list" style="margin: 20rpx;">
            <checkbox-group @change="onCheckboxChange">
                <label>
                    <view v-for="(product, index) in products" :key="product.id" class="product-item">
                        <checkbox :value="String(product.id)" :checked="selected.includes(String(product.id))"></checkbox>
                        <image :src="`http://127.0.0.1:3006/hzlist/` + product.images" mode="aspectFill" style="height: 260rpx; border-radius: 20rpx;"></image>
                        <view class="u-body-item-title u-line-2">
                            <view class="u-body-item-title u-line-2" style="margin-left: 20rpx; font-size: 36rpx; font-weight: bold;">
                                {{ product.name }}
                            </view>
                            <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 28rpx; color:#afafaf">
                                {{ product.type }}
                            </view>
                            <view style="display: flex;">
                                <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 36rpx; color:red">
                                    {{ product.price }}元
                                </view>
                                <view class="u-body-item-title u-line-2" style="margin-left: 30rpx; margin-top: 20rpx; font-size: 36rpx; color:red">
                                    {{ product.Plant }}人种草
                                </view>
                            </view>
                            <u-button @click="delshop(product.id)" style="margin-top: 10rpx; margin-left: 20rpx;">删除</u-button>
                        </view>
                    </view>
                </label>
            </checkbox-group>
			<view class="u-m-20" style="display: flex;">
				<u-button type="primary" @click="calculateTotal">结算</u-button>
				<u-button type="primary" @click="clearCart">清空购物车</u-button>
			</view>
            <view v-if="totalPrice > 0">	
                <text>总计：￥{{ totalPrice }}</text>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            products: [],
            selected: [],
            shopid: []
        };
    },
    computed: {
        // 计算总价
        totalPrice() {
            return this.selected.reduce((total, id) => {
                const product = this.products.find(p => String(p.id) === id);
                return total + (product ? parseFloat(product.price) : 0);
            }, 0).toFixed(2); // 确保两位小数
        }
    },
    onLoad() {
        this.getshop();
    },
    methods: {
        // 查询购物车
        getshop() {
            uni.request({
                url: this.$url + '/api/shop',
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    console.log(res);
                    this.products = res.data.data;
                }
            });
        },
        // 删除购物车项
        delshop(productid) {
			this.shopid=productid
            uni.request({
               url: this.$url+'/api/delshop/' + this.shopid,
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    console.log(res);
                    this.products = this.products.filter(product => product.id !== productid); 
					console.log(this.shopid)
                    uni.showToast({
                        title: '删除成功',
                        icon: 'success'
                    });
                },
                fail: () => {
                    uni.showToast({
                        title: '删除失败',
                        icon: 'none'
                    });
                }
            });
        },
			//清空购物车 
		   clearCart() {
			   uni.request({
				   url: this.$url + '/api/delallshop'+this.shopid, // 调整为更合适的 URL
				   method: 'GET', 
				   header: this.$head,
				   success: (res) => {
					   console.log(res);
					   this.products = []; // 清空本地产品列表
					   this.selected = []; // 清空选中的商品ID
					   uni.showToast({
						   title: '购物车已清空',
						   icon: 'success'
					   });
				   },
				   fail: () => {
					   uni.showToast({
						   title: '清空失败',
						   icon: 'none'
					   });
				   }
			   });
		   },
        // 点击选中的复选框
        onCheckboxChange(e) {
            console.log(e);
            this.selected = e.detail.value; // 获取选中的商品ID
        },
        // 判断商品是否等于0，等于0则弹出模态框
        calculateTotal() {
            if (this.selected.length === 0) {
                uni.showToast({
                    title: '请选择商品进行结算',
                    icon: 'none'
                });
                return;
            }
			  const selectedIds = this.selected.join(',');
            // 这里可以调用后端
           uni.navigateTo({
           	url:`/pages/order/order?totalPrice=${this.totalPrice}&selectedIds=${selectedIds}`
           })
        }
    }
}
</script>

<style lang="scss" scoped>
.list {
    display: flex;
    flex-direction: column;
    .product-item {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        .product-image {
            width: 60px;
            height: 60px;
            margin-right: 10px;
        }
        
        .product-name {
            flex: 1;
        }
        
        .product-price {
            white-space: nowrap;
        }
    }
}
button {
    margin-top: 20px;
}
</style>
