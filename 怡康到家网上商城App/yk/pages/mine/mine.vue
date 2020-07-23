<template>
	<view class="mine">
		<view class="mine-bj">
			<image class="mine-img" src="http://www.yaoking.cn/public/app/b2c/statics/sprites/touxiang.png" mode=""></image>
			<view class="mine-yong">{{tel}}</view>
			<view class="mine-zhu" @click="zhu">注销</view>
		</view>
		<view class="banner">
			<view class="mine-money">
				<image src="http://www.yaoking.cn/wap_themes/yaoking_new/images/iconqb.png" mode=""></image>
				<view>我的钱包</view>
			</view>
			<view class="mine-ye">
				<image src="../../static/ye.png" mode=""></image>
				<view>余额</view>
			</view>
		</view>
		<view class="banner1">
			<view class="banner1-y">
				<image src="../../static/t.png" mode=""></image>
				<view>用药提醒</view>
			</view>
			<view class="banner1-y">
				<image src="../../static/w.png" mode=""></image>
				<view>问诊记录</view>
			</view>
			<view class="banner1-y">
				<image src="../../static/f.png" mode=""></image>
				<view>我的处方</view>
			</view>
		</view>
		<view class="banner2">
			<view class="banner2-s">怡康商城</view>
			<view class="banner2-x"></view>
			<view class="banner2-info">
				<view class="info">
					<image src="../../static/dingdan.png" mode=""></image>
					<view>我的订单</view>
				</view>
				<view class="info">
					<image src="../../static/pintuan.png" mode=""></image>
					<view>我的拼团</view>
				</view>
				<view class="info">
					<image src="../../static/youhui.png" mode=""></image>
					<view>优惠劵</view>
				</view>
				<view class="info" @click="ban">
					<image src="../../static/dizhi.png" mode=""></image>
					<view>地址管理</view>
				</view>
				<view class="info">
					<image src="../../static/shoucang.png" mode=""></image>
					<view>产品收藏</view>
				</view>
			</view>
		</view>
		<view class="banner2">
			<view class="banner2-s">我的店铺</view>
			<view class="banner2-x"></view>
			<view class="banner2-info">
				<view class="info">
					<image src="../../static/dingdan.png" mode=""></image>
					<view>门店订单</view>
				</view>
				<view class="info">
					<image src="../../static/shoucang.png" mode=""></image>
					<view>店铺收藏</view>
				</view>
				<view class="info">
					<image src="../../static/youhui.png" mode=""></image>
					<view>优惠劵</view>
				</view>
				<view class="info" @click="ban">
					<image src="../../static/dizhi.png" mode=""></image>
					<view>地址管理</view>
				</view>
				<view class="info">
					
				</view>
			</view>
		</view>
		<view class="zhanwei"></view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				tel:''
			}
		},
		methods: {
			zhu(){
				 uni.showModal({
				      title: '提示',
				      content: '是否退出登录',
				      cancelText: '取消',
				      confirmText: '确定',
				      success: res => {
				        if (res.confirm) {
				          uni.removeStorage({
				            key: 'uname',
				            success: res => {
								uni.navigateTo({
									url:'../login/login'
								})
				            },
				          })
				        }
				      }
				    })
			},
			ban(){
				uni.navigateTo({
					url:'../site/site'
				})
			}
		},
		onShow() {
			
			uni.getStorage({
				key:'uname',
				success:res=>{
					console.log(res.data)
					this.tel = res.data
				},
				fail() {
					uni.navigateTo({
						url:'../login/login'
					})
				}
			})
		}
	}
</script>

<style>
	.mine{
		background-color: #eee;
	}
	.mine-bj{
		width:100%;
		height:480rpx;
		background:url('http://www.yaoking.cn/public/app/wap/statics/images/bg.png') no-repeat center;
		position: relative;
		background-size: cover;
		margin-bottom: 20rpx;
	}
	.mine-img{
		width:200rpx;
		height: 200rpx;
		position: absolute;
		left:calc(50% - 100rpx);
		top:40rpx;
	}
	.mine-yong{
		width: 100%;
		text-align: center;
		position: absolute;
		top:300rpx;
		left:0;
	}
	.banner{
		width:96%;
		height:150rpx;
		border-radius: 30rpx;
		margin: 0 auto;
		background-color: #fff;
	}
	.mine-money{
		width:300rpx;
		height:100%;
		text-align: center;
		display: inline-block;
	}
	.mine-money>image{
		width:60rpx;
		height:60rpx;
		margin-top:20rpx;
	}
	.mine-money>view{
		font-size: 30rpx;
	}
	.banner-x{
		width:2rpx;
		height:100rpx;
		background-color: #eee;
	}
	.mine-ye{
		display: inline-block;
		width:100rpx;
		height: 100%;
		text-align: center;
	}
	.mine-ye>image{
		width:60rpx;
		height:60rpx;
	}
	.mine-ye>view{
		font-size: 30rpx;
		color:#666;
		
	}
	.banner1{
		width:96%;
		height:200rpx;
		background-color: #fff;
		border-radius: 30rpx;
		margin: 20rpx auto;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.banner1-y{
		width:33.3%;
		text-align: center;
	}
	.banner1-y>image{
		width:40rpx;
		height:50rpx;
	}
	.banner1-y>view{
		font-size: 28rpx;	
	}
	.banner2{
		width:96%;
		height:260rpx;
		background-color: #fff;
		margin: 20rpx auto;
		border-radius: 30rpx;
	}
	.banner2-s{
		width:100%;
		font-size: 30rpx;
		padding:20rpx 30rpx;
		box-sizing: border-box;
	}
	.banner2-x{
		width:96%;
		height:2rpx;
		background-color: #000;
		margin: 0 auto;
	}
	.banner2-info{
		width:100%;
		height:200rpx;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}
	.info{
		width:20%;
		text-align: center;
		line-height: 100%;
	}
	.info>image{
		width:80rpx;
		height:80rpx;
		margin-bottom: 20rpx;
	}
	.info>view{
		font-size: 26rpx;
	}
	.zhanwei{
		width:100%;
		height:300rpx;
	}
	.mine-zhu{
		width:100rpx;
		height:60rpx;
		background-color: #007AFF;
		font-size: 28rpx;
		text-align: center;
		line-height: 60rpx;
		color:#fff;
		position: absolute;
		right: 20rpx;
		top:20rpx;
	}
</style>

