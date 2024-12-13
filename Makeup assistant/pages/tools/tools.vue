<template>
    <view>
        <!-- 根据tab每一项，渲染出每一个的分类列表 -->
        <u-tabs :list="type" :is-scroll="true" fontSize="36" :current="current" @change="change"></u-tabs>
        <view style="margin:20rpx;" class="u-body-item u-flex u-boder-bottom u-col-between u-p-t-0" v-for="item in typename" :key="item.id">
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
                <u-button @click="edit(item.id)" style="margin-top: 10rpx; margin-left: 20rpx;">加入购物车</u-button>
            </view>
        </view>
    </view>
</template>

<script>
export default {
    data() {
        return {
            type: [],
            list: [],
            typename: [],
            current: 0,
            shopid: []
        };
    },
    onLoad() {
        this.gettype();
        this.getlist();
        this.getshop();
    },
    methods: {
		// 获取用户信息
        getuser() {
            uni.request({
                url: this.$url + '/info/userinfo',
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    console.log(res);
                }
            });
        },
		// 切换分类表
        change(index) {
            this.current = index;
            this.typename = this.list.filter((item) => item.type == this.type[index].name);
        },
		// 获取分类信息
        gettype() {
            uni.request({
                url: this.$url + '/api/hzptype',
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    this.type = res.data.data;
                }
            });
        },
		// 获取列表信息
        getlist(type) {
            uni.request({
                url: this.$url + '/api/hzplist',
                method: 'GET',
                header: this.$head,
                data: { type: name },
                success: (res) => {
                    console.log(res);
                    this.list = res.data.data;
                    this.typename = this.list.filter((item) => item.type == '粉底液');
                }
            });
        },
		// 查询购物车
        getshop() {
            uni.request({
                url: this.$url + '/api/shop',
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    console.log(res);
                }
            });
        },
		// 加入购物车
        edit(itemId) {
            uni.request({
                url: this.$url + '/api/shop',
                method: 'POST',
                header: this.$head,
                data: { shop: itemId },
                success: (res) => {
                    console.log(res);
                    uni.showToast({
                        title: '添加成功',
                        icon: 'success'
                    });
                    this.getshop(); //调用查询购物车信息
                },
                fail: (err) => {
                    console.error(err);
                    uni.showToast({
                        title: '添加失败',
                        icon: 'error'
                    });
                }
            });
        }
    }
};
</script>

