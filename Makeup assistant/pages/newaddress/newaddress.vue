<template>
    <view>
        <u-section title="管理地址" class="u-m-t-20 u-m-l-20" fontSize="36" :right="false"></u-section>
		<!-- 如果收货地址比0多就显示收货地址 -->
        <view v-if="address.length > 0">
            <u-card v-for="(item, index) in address" :key="index" :title="item.recipient_name" :sub-title="item.phone_number">
                <template v-slot:body>
                    <view>
                        <view class="u-body-item u-flex u-border-bottom u-col-between u-p-t-0">
                            <view class="u-body-item-title u-line-2">收货地址：{{ item.address }}</view>
                            <u-button @click="setDefaultAddress(index)" type="text" style="color: #007aff;">
                                {{ item.isDefault ? '默认地址' : '设为默认' }}
                            </u-button>
                        </view>
                    </view>
                </template>
            </u-card>
        </view>
		<!-- 没有则显示没有收货地址 -->
        <view v-else style="margin: 30rpx; font-size: 36rpx;">
            <p>没有收货地址可显示</p>
        </view>
        <u-button @click="show = true" style="margin: 50rpx;" type="primary">新增地址</u-button>
        <!-- 弹出层 -->
        <u-popup v-model="show" mode="bottom" border-radius="14" height="400px">
            <u-form :model="form" ref="form1" class="u-m-30" label-width="120">
                <u-form-item label="收货人" prop="name"><u-input placeholder="请输入昵称" v-model="form.name" /></u-form-item>
                <u-form-item label="手机号码" prop="phone"><u-input placeholder="请输入手机号码" v-model="form.phone" /></u-form-item>
                <u-form-item label="地址" prop="address"><u-input placeholder="请输入地址" v-model="form.address" /></u-form-item>
            </u-form>
            <u-button @click="addAddress()" style="margin: 50rpx;" type="primary">新增</u-button>
        </u-popup>
    </view>
</template>

<script>
export default {
    data() {
        return {
            show: false,
            address: [],
            form: {
                name: "",
                phone: '',
                address: '这里可以写默认地址',
            }
        };
    },
    onLoad() {
        this.getAddress();
    },
    methods: {
        // 查询地址
        getAddress() {
            uni.request({
                url: this.$url + '/api/address',
                method: 'GET',
                header: this.$head,
                success: (res) => {
                    this.address = res.data.data;
                    console.log(this.address);
                    // 读取默认地址
                    this.loadDefaultAddress();
                }
            });
        },
        // 新增地址
        addAddress() {
            uni.request({
                url: this.$url + '/api/address',
                method: 'POST',
                header: this.$head,
                data: {
                    recipient_name: this.form.name,
                    phone_number: this.form.phone,
                    address: this.form.address
                },
                success: (res) => {
                    uni.showToast({
                        title: '新增成功',
                        icon: 'success'
                    });
                    this.show = false;
                    this.getAddress(); // Refresh the address list
                }
            });
        },
        // 设置默认地址
        setDefaultAddress(index) {
            // 将所有地址的 isDefault 设置为 false
            this.address.forEach((item, i) => {
                item.isDefault = i === index;
            });
            // 保存到本地存储
            uni.setStorageSync('defaultAddress', this.address[index]);
            uni.showToast({
                title: '已设置为默认地址',
                icon: 'success'
            });
        },
        // 加载默认地址
        loadDefaultAddress() {
            const defaultAddress = uni.getStorageSync('defaultAddress');
            if (defaultAddress) {
                const index = this.address.findIndex(item => item.address === defaultAddress.address);
                if (index !== -1) {
                    this.address[index].isDefault = true;
                }
            }
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
</style>
