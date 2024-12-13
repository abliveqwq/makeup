<template>
	<view>
		<!-- 上传图片 -->
		<u-section title="上传图片" class="u-m-t-20 u-m-l-20" fontSize="36" :right="false"></u-section>
		<view class="u-m-30">
			<u-upload @on-success="handleSuccess"  action="http://127.0.0.1:3006/api/update/image" name="file" :header="header" ref="uUpload1" :fileList="fileList" @afterRead="afterPic" :auto-upload="false"  multiple :maxCount="10" uploadIcon="plus"></u-upload>
			<u-button @click="OneuploadFile">上传</u-button>
		</view>
		<!-- 输入框 -->
		<view class="u-m-t-20">
				<u-cell-item title="类别" v-model="type" @click="show=true" ><view>{{type}}</view></u-cell-item>
				<view style="display: flex;margin: 20rpx; font-size: 36rpx;">
					<text style="text-align:center; margin-top: 30rpx;">标题:</text>
					 <u-input v-model="name" :border="false"  class="u-m-t-20" placeholder="添加标题" style="border-bottom: 2rpx solid black;" ></u-input>
				</view>
				<view style="display: flex;margin: 20rpx; font-size: 36rpx;">
					<text style="text-align:center; margin-top: 30rpx;">正文:</text>
					 <u-input  v-model="line"  class="u-m-t-20" placeholder="请输入正文" style="height: 200rpx;"></u-input>
				</view>
				<u-select v-model="show" mode="single-column" :list="list" @confirm="confirm"></u-select>
				<!-- 点击按钮确认修改传参 -->
				<u-button type="success" class="u-m-50" style="border-radius: 50rpx;" @click="edit()">提交</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				path: '',
				show:false,
				list: [
					{label:'淡妆新手',value:'1'},
					{label:'韩系妆容',value:'2'},
					{label:'日系',value:'3'},
					{label:'亚裔',value:'4'},
					{label:'日常',value:'5'},
					{label:'全妆',value:'6'},
					{label:'御姐妆容',value:'7'}
				],
				type:'',
				name:'',
				line:'',
				action: 'http://127.0.0.1:3006/update/image',
				fileList: [],
				images: [],
				header:{Authorization:'Bearer '+uni.getStorageSync('token')}
			};
		},
		onLoad() {
			
		},
		methods:{
			// 添面图片
			afterPic(event) {
			    let lists = [].concat(event.file)
			    lists.forEach(item => {
			        this.fileList.push({
			            ...item
			        });
			        this.OneuploadFile(item); // 上传每个文件
			    });
			},
			// 文件上传
			 OneuploadFile(file) {
			this.$refs.uUpload1.upload();
			
			  //   console.log(this.fileList);
			  //   uni.uploadFile({
			  //       url: 'http://127.0.0.1:3006/api/update/image',  // 服务器地址
			  //       filePath: file.url,
			  //       name: 'file',
					// header:this.$head,
			  //       success: (res) => {
			  //           const images = JSON.parse(res.data);
			  //           this.images.push(images.data); // 保存每一个成功上传的图片路径
			  //           console.log(images);
			  //       },
			  //       fail: (err) => {
			  //           console.error(err); // 记录上传失败的错误
			  //       }
			  //   });
			},
			handleSuccess(res, file) {
			            // 处理上传成功后的返回数据
						this.images.push(res.data)
			            console.log('上传成功:', res);
			            console.log('文件信息:', file);
			            // 可以在这里处理 res，例如保存图片路径等
			        },
			// 注意返回值为一个数组，单列时取数组的第一个元素即可(只有一个元素)
			confirm(e) {
				console.log(e);
				this.type=e[0].label
				this.typeid=e[0].value
			},
			edit(){
				uni.request({
					url:this.$url+'/api/publish',
					method:'POST',
					header:this.$head,
					data:{
						typeid:this.typeid,
						type:this.type,
						name:this.name,
						line:this.line,
						image: this.images || '' // 这里将已上传的图片列表传递给后端
					},
					success: (res) => {
						console.log(res)
						if(res.statusCode==500){
							console.log('数据库错误')
						}else{
							uni.showToast({
								title:'发布成功',
								icon:'success'
							})
							setTimeout(()=>{
									uni.reLaunch({
									    url: '/pages/index/index'
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

</style>
