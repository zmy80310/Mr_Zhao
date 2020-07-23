<template>
	<view>
		<view class="ad-wrap">
		<!-- one -->
		<view class="ad-one">
		<view class="peo">收货人</view>
		<view class="ad-nm">
		<text class="ad-name1">姓名</text>
		<input class="ad-name2" type="text" focus="" placeholder="真实姓名" bindinput="name" v-model="name"></input>
		</view>
		<view class="ad-nm">
		<text class="ad-name1">电话</text>
		<input class="ad-name2" type="text" focus="" placeholder="手机号码" bindinput="tel" v-model="tel"></input>
		</view>
		
		</view>
		<!-- two -->
		<view class="ad-two">
		<view class="peo">收获地址</view>
		<view class="ad-nm">
		<text class="ad-name1" >地区信息 <text class="ad-name22" @tap="openAddres">{{site}}</text></text>
			<simple-address ref="simpleAddress" :pickerValueDefault="cityPickerValueDefault" @onConfirm="onConfirm" themeColor='#007AFF'></simple-address>
		</view>
		<view class="ad-nm" >
		<text class="ad-name1">详细地址</text>
		<input class="ad-name2" @click="push" type="text" focus="" placeholder="街道门牌、楼层房间号等信息"  v-model="address"></input>
		</view>
		<!-- 默认地址 -->
		  <view class="moren">
		    <switch class="moren-2" checked="checked" />
		    <view class="moren-1">设为默认地址</view>
		  </view>
		</view>
		<!-- 尾部 -->
		<view class="bottom" @click="newad">{{num}}</view>
		</view>
		

	</view>
</template>

<script>
	import simpleAddress from "@/components/simple-address/simple-address.nvue"
	export default {
		components:{
			simpleAddress
		},
		data() {
			return {
				cityPickerValueDefault: [0, 0, 1],
				    name: '',
				    tel: '',
				    address: '',
				    item: null,
				    checked: false,
					site:'请选择',
					yonghu:'',
					num:'保存',
					id:''
			}
		},
		methods: {
			openAddres() {
				this.$refs.simpleAddress.open();
			},
			onConfirm(e) {
				this.site = e.label
			},
			newad(){
				if(this.num == '保存'){
					if(this.name && this.tel && this.address != ''){
							if(this.site != '请选择'){
								 uni.getStorage({
								       key: 'uname',
								       success: res=> {
								         uni.request({
								           url: 'http://localhost/ykphp/site.php',
								           method: 'POST',
								           header: {
								             "content-type": 'application/x-www-form-urlencoded'
								           },
								           data: {
								             name: this.name,
								             cell: this.tel,
								             cite: this.site,
								             address: this.address,
								             tel: res.data,
								             state:this.checked
								           },
								            success:res=>{
								              console.log(res.data);
											  this.yonghu = res.data;
								              if (res.data === 1) {
								                wx.showToast({
								                  title: '添加成功',
								                  icon: 'success',
								                  duration: 2000
								                })
								                setTimeout(()=>{
								                    wx.navigateBack({
								                      delta:1
								                    })
								                },2500)
								              }
								            }
								         })
								       },
								       fail: res => {
								         wx.showToast({
								           title: '请先去登陆',
								           icon: 'loading',
								           duration: 2000
								         })
								       }
								     })
						}else{
							 uni.showToast({
							   title: '输入内容不能为空',
							 icon: 'loading',
							  duration: 2000
							 })
						}
					}
				}else if(this.num = '修改'){
					if(this.name && this.tel && this.address != ''){
							if(this.site != '请选择'){
							 wx.request({
							        url: 'http://localhost/ykphp/xg2.php',
							        method: 'POST',
							        header: {
							          "content-type": 'application/x-www-form-urlencoded'
							        },
							        data: {
							          tel:this.yonghu,
							          id: this.id,
							          name: this.name,
							          cell: this.tel,
							          cite: this.site,
							          address: this.address,
							          state:this.checked
							        },
							        success: res => {
							          if (res.data === 1) {
							            wx.showToast({
							              title: '修改成功',
							              icon: 'success',
							              duration: 2000
							            })
							            setTimeout(() => {
							              wx.navigateBack({
							                delta: 1
							              })
							            }, 2000)
							          }
							        }
							      })
						}else{
							 uni.showToast({
							   title: '输入内容不能为空',
							 icon: 'loading',
							  duration: 2000
							 })
						}
					}
				}
		},
			push(){
				console.log(111)
				uni.chooseLocation({
				    success: res=>{
						this.address = res.name
				    }
				}); 
			}
		},
		onLoad(options) {
			uni.getStorage({
				key:'uname',
				success:res=> {
					this.yonghu = res.data;
				}
			})
			if(JSON.stringify(options) === '{}'){
				this.num = '保存'
			}else{
				let op = JSON.parse(options.id);
				this.id = op
				this.num = '修改'
				wx.request({
			          url: 'http://localhost/ykphp/xg1.php',
			          method: 'POST',
			          header: {
			            "content-type": 'application/x-www-form-urlencoded'
			          },
			          data: {
			            id: op
			          },
			          success: res => {
						  this.name = res.data.name;
						  this.tel = res.data.cell;
						  this.site = res.data.city;
						  this.address = res.data.address;
			          }
			        })
			}
		}
	}
</script>

<style>
	.ad-wrap{
	background: #e5e5e5; 
	height: 1100rpx;
	padding-top: 40rpx;
	}
	.ad-one,.ad-two{
	width: 94%;
	background: #ffffff;
	margin: 0 auto;
	}
	.peo{
	background: #e5e5e5;
	font-size: 26rpx;
	color: #666666;
	padding-bottom: 10rpx;
	}
	.ad-nm{
	display: flex;
	justify-content: flex-start;
	flex-flow: row nowrap;
	padding: 15rpx 20rpx;
	font-size: 28rpx;
	}
	.ad-name1{
	margin-right: 40rpx;
	margin-top: 8rpx;
	font-size: 30rpx;
	}
	.ad-name2{
	  margin-top: 8rpx;
	margin-left: 20rpx;
	
	}
	.ad-two{
	margin-top: 40rpx;
	}
	.bottom{
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgb(247, 102, 6);
	padding: 30rpx 0;
	text-align: center;
	color: #ffffff;
	}
	.bottom1{
	  width:100%;
	  height:68rpx; 
	  position: fixed;
	  bottom: 0;
	  left: 0;
	  right: 0; 
	  display: flex;
	  justify-content: space-around;
	  /* line-height: 60rpx; */
	}
	.move{
	  width:50%;
	  height:100%;
	  color:#f00;
	  text-align: center;
	  line-height: 68rpx;
	}
	.item{
	  width:50%;
	  height:100%;
	  background-color: #ff6700;
	  color:#fff;
	  text-align: center;
	  line-height:68rpx;
	}
	.moren{
	  margin-top:20rpx;
	  background: #fff;
	  height: 100rpx;
	  font-size: 40rpx;
	}
	.moren-1{
	  font-size: 30rpx;
	  margin-left:20rpx; 
	}
	.moren>.moren-2{
	  float: right;
	  margin-left: 20rpx;
	}
	.ad-name22{
		margin-left: 70rpx;
	}
</style>
