<template>
	<view  class="site">
		<!-- 自定义导航 -->
		<uni-nav-bar fixed="true" @clickLeft="back" @clickRight="go" status-bar="true" backgroundColor="#FFFFFF" color="#000">
			<image class="top-img" src="/static/jt.png" mode="" slot="left"></image>
			<text class="top-text">收货地址</text>
			<image class="top-img1" slot="right" src="../../static/tj.png" mode=""></image>
		</uni-nav-bar>
		<!-- 地址 -->
		<view class="site-item" v-for="(x,y) in list" :key="y">
			<view class="site-name">{{x.name}}</view>
			<view class="site-tel">{{x.tel}}</view>
			<view class="site-ciey">{{x.city}}{{x.address}}</view>
			<view class="site-mo">设为默认</view>
			<view class="site-bian" @click="bian(x.id)">
				编辑
			</view>
			<view class="site-move" @click="move(x.id,x.tel)">
				删除
			</view>
		</view>
	</view>
</template>

<script>
	// 导入导航组件NavBar
	import uniNavBar from "@/components/uni-nav-bar/uni-nav-bar.vue"
	export default {
		components:{
			uniNavBar	
		},	
		data() {
			return {
				list:[],
				tel:''
			}
		},
		methods: {
			back(){
				uni.navigateBack({
					delta:1
				})
			},
			go(){
				uni.navigateTo({
					url:'./sites/sites'
				})
			},
			bian(id){
				let i = JSON.stringify(id);
				uni.navigateTo({
					url:`sites/sites?id=${i}`,
				})
			},
			move(i,t){
			 uni.showModal({
			      title: '提示',
			      content: '是否确定删除此地址',
			      cancelText: '取消',
			      confirmText: '确定',
			      success: res => {
			        if (res.confirm) {
			          wx.request({
			            url: 'http://localhost/ykphp/dzmove.php',
			            method: 'POST',
			            header: {
			              "content-type": 'application/x-www-form-urlencoded'
			            },
			            data: {
			              id: i,
						  tel:t
			            },
			            success: res => {
			                wx.showToast({
			                  title: '删除成功',
			                  icon: 'success',
			                  duration: 2000
			                })
							this.list = res.data;
			            }
			          })
			        }
			      }
			    })
			}
		},
		onShow() {
			uni.getStorage({
				key:'uname',
				success:res=>{
					this.tel = res.data
				}
			})
			uni.request({
				url:'http://localhost/ykphp/dz.php',
				method:'POST',
				header:{
					 "content-type": 'application/x-www-form-urlencoded'
				},
				data:{
					tel:this.tel
				},
				success:res=>{
					this.list = res.data;
				}
			})
		}
	}
</script>

<style>
	.site{
		width:100%;
	}
	.top-img{
		width:60rpx;
		height:60rpx;
	}
	.top-img1{
		width:70rpx;
		height:70rpx;
		margin-left: 30rpx;
	}
	.top-text{
		margin: 0 auto;
		z-index: 999;
	}
	.site-item{
		width:100%;
		height: 300rpx;
		position: relative;
	}
	.site-name{
		position: absolute;
		top:20rpx;
		left:20rpx;
		font-size: 30rpx;
	}
	.site-tel{
		position: absolute;
		top:20rpx;
		left:200rpx;
		font-size: 30rpx;
		color:#999;
	}
	.site-ciey{
		width:100%;
		position: absolute;
		top:100rpx;
		left:20rpx;
		font-size: 30rpx;
		color:#999;
		padding-bottom:50rpx ;
		box-sizing: border-box;
		border-bottom: 2rpx solid #666;
	}
	.site-mo{
		width:200rpx;
		height: 60rpx;
		border:2rpx solid #999;
		font-size: 28rpx;
		text-align: center;
		line-height: 60rpx;
		border-radius: 20rpx;
		position: absolute;
		top:220rpx;
		left:20rpx;
	}
	.site-bian,.site-move{
		width:100rpx;
		height:60rpx;
		border:2rpx solid #999;
		font-size: 28rpx;
		text-align: center;
		line-height: 60rpx;
		border-radius: 20rpx;
		position: absolute;
		right: 150rpx;
		top: 220rpx;
	}
	.site-move{
		right:25rpx;
	}
</style>
