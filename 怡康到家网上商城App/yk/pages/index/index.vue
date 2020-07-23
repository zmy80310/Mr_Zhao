<template>
	<view class="index">
		<!-- 自定义导航 -->
		<uni-nav-bar fixed="true" status-bar="true" backgroundColor="#A9CBEE" color="#fff">
			<image class="top-img" src="/static/dt.png" mode="" slot="left"></image>
			<text class="top-text">陕西省西安市雁塔区丈八西路</text>
			<view slot="right">
				<view class="right-view">
					<image src="../../static/scan.png" mode=""></image>
				</view>
			</view>
		</uni-nav-bar>
		<!-- 搜索框 -->
		<view class="icon" @click="tiao">
			<view class="index-icon">
				<icon type="search" class="index-i"></icon>
				<text class="index-text">花茶</text>
			</view>
		</view>
		<!-- swiper -->
		<view class="swiper">
			<swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" :circular="true">
				<swiper-item v-for="(x,y) in swiper" :key="y">
					<view class="swiper-item">
						<image :src="x.src" mode=""></image>
					</view>
				</swiper-item>
			</swiper>
		</view>
		<!-- banner -->
		<view class="index-banner">
			<view class="banner-index" v-for="(x,y) in banner" :key="y">
				<image class="banner-img" :src="x.src" mode=""></image>
				<view class="banner-text">{{x.name}}</view>
			</view>
		</view>
		<!-- banner1 -->
		<view class="index-banner1">
			<view class="banner1-index" v-for="(x,y) in banner1" :key="y">
				<image class="banner1-img" :src="x.src" mode=""></image>
				<view class="banner1-text">{{x.name}}</view>
			</view>
		</view>
		
		<!-- scroll-view -->
		<view class="content">
			<scroll-view scroll-x="true">
				<view class="content-index" v-for="(x,y) in scoll" :key="y" @click="fn(x.id)">
					<image class="content-img" :src="x.src" mode=""></image>
					<view class="content-text">{{x.name}}</view>
					<view class="content-price">¥{{x.price}}</view>
				</view>
			</scroll-view>
		</view>
		<!-- 新人专享 -->
		<view class="enjoy">
			<image src="https://image.360kad.com/group2/M00/F1/1A/CgAgFV5m8F2AfX-nAADzAAb1iDI689.jpg" mode=""></image>
		</view>
		<!-- 猜你喜欢 -->
		
		<view class="guess">
				<view class="index-guess">猜你喜欢</view>
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in guess" :key="y" @click="fn(x.id)">
						<image :src="x.src" mode=""></image>
						<view class="guess-name">{{x.name}}</view>
						<view class="guess-text">{{x.text}}</view>
						<view class="guess-price">¥{{x.price}}</view>
						<image class="guess-img" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1583733548991&di=f0e39c2311b858c7ad1c0a5032bac500&imgtype=0&src=http%3A%2F%2Fpic.90sjimg.com%2Fdesign%2F00%2F57%2F93%2F24%2F58facefc0d0a1.png" mode="" @click="push"></image>
					</view>
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
				swiper:null,
				banner:null,
				banner1:null,
				scoll:null,
				guess:null
			}
		},
		onLoad() {
			// 获取swiper轮播图
			uni.request({
				url:'http://localhost/ykphp/swiper.php',
				success: res => {
					this.swiper = res.data;
				}
			})
			//获取banner
			uni.request({
				url:'http://localhost/ykphp/banner.php',
				success:res=>{
					this.banner = res.data;
				}
			})
			//获取banner1
			uni.request({
				url:'http://localhost/ykphp/banner1.php',
				success:res=>{
					this.banner1 = res.data;
				}
			})
			//获取scoll
			uni.request({
				url:'http://localhost/ykphp/scoll.php',
				success:res=>{
					this.scoll = res.data;
				}
			})
			// 获取商品
			uni.request({
				url:'http://localhost/ykphp/guess.php',
				success:res=>{
					this.guess = res.data;
				}
			})
		},
		methods: {
			tiao(){
				uni.navigateTo({
					url:'../sou/sou'
				})
			},
			fn(id){
				let i = JSON.stringify(id);
				uni.navigateTo({
					url:`info/info?id=${i}`,
				})
			},
			push(){
				uni.getStorage({
					key:'uname',
					success:res=>{
						let tel = res.data;
						let data1 = new Date();
						let time = data1.getTime();
						uni.request({
							url:'http://localhost/ykphp/gouwu.php',
							data:{
								src:this.infoData.src,
								name:this.infoData.name,
								price:this.infoData.price,
								number:this.number,
								text:this.infoData.text,
								tel:tel,
								time:time
							},
							success:res=>{
								 if (res.data === 2) {
								    uni.showToast({
								     title: '添加成功',
								     icon: 'success',
								     duration: 2000
								     })
								}else if(res.data === 1){
									uni.request({
										url:'http://localhost/ykphp/gouwu22.php',
										data:{
											tel:tel,
											src:this.infoData.src
										},
										success:res=>{
											console.log(res.data);
											 for (let x of res.data) {
											     if (this.number >= 1) {
											        var n1 = x.number * 1 + this.number * 1;
													console.log(x.number)
											       } else {
											            var n1 = (x.number - 0) + 1;
											        }
											    }
												uni.request({
													url:'http://localhost/ykphp/gouwu1.php',
													data:{
														tel:tel,
														src:this.infoData.src,
														number:n1
													},
													success:res=>{
														 if (res.data === 1) {
														    wx.showToast({
														       title: '添加成功',
														        icon: 'success',
														        duration: 2000
														    })
														}
													}
												})
										}
									})
								}
							}
						})
					},
					fail:res=> {
						 uni.showToast({
						    title: '请前去登陆',
						    icon: 'loading',
						    duration: 2000
						})
					}
				})
			}
		}
	}
</script>

<style>
	.index{
		background-color: #eee;
	}
	.top-img{
		width:60rpx;
		height:60rpx;
	}
	.top-text{
		position: absolute;
		left:80rpx;
		top:0rpx;
	}
	.right-view {
		width: 56rpx;
		height: 56rpx;
	}
	.right-view>image {
		width: 100%;
		height: 100%;
	}
	.icon{
		width:100%;
		background-color: cyan;
		padding: 15rpx 0;
		box-sizing: border-box;
	}
	.index-icon{
		width:90%;
		height:60rpx;
		background-color: #fff;
		margin:0 auto;
		border-radius: 18rpx;
		position: relative;
	}
	.index-i{
		position: absolute;
		left:20rpx;
		top:8rpx;
	}
	.index-text{
		font-size: 30rpx;
		color:#666;
		position: absolute;
		left:80rpx;
		top:8rpx;
	}
	.swiper{
		width: 750rpx;
		height: 154px;
	}
	.swiper>swiper-item{
		width: 100%;
		height: 100%;
	}
	.swiper-item{
		width: 100%;
		height: 100%;
	}
	.swiper-item>image{
		width: 100%;
		height: 100%;
	}
	.index-banner,.index-banner1{
		width:100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		flex-wrap: wrap;
		background-color: #fff;
		
	}
	.banner-index,.banner1-index{
		width:20%;
		height:200rpx;
		text-align: center;
	}
	.banner-img{
		width:100rpx;
		height:100rpx;
	}
	.banner-text{
		font-size: 28rpx;
		color:#999;
	}
	.banner1-img{
		width:80rpx;
		height:80rpx;
	}
	.banner1-text{
		font-size: 28rpx;
		margin-top:20rpx;
	}
	.content{
		width:100%;
		height: 300rpx;
		overflow: hidden;
		background-color: #fff;
		margin-top:20rpx;
	}
	.content>scroll-view{
		width:100%;
		height:100%;
		white-space: nowrap;
	}
	.content-index{
		display: inline-block;
		width:250rpx;
		text-align: center;
	}
	.content-img{
		width:180rpx;
		height:180rpx;
	}
	.content-text{
		font-size: 28rpx;
		white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  width:100%;
		  text-align: center;
		 margin-left: 20rpx;
	}
	.content-price{
		font-size: 28rpx;
		color:#f00;
	}
	.enjoy{
		width:100%;
		height:300rpx;
		margin-top:30rpx;
	}
	.enjoy>image{
		width:100%;
		height:100%;
	}
	.guess{
		width:100%;
	}
	.index-guess{
		width:100%;
		font-size: 40rpx;
		text-align: center;
		margin-top:50rpx;
	}
	.guess-index{
		width:100%;
		display: flex;
		justify-content: space-around;
		align-items: center;
		flex-wrap: wrap;
	}
	.guess-item{
		width:48%;
		background-color: #FFFFFF;
		text-align: center;
		margin-top:20rpx;
		position: relative;
		
	}
	.guess-item>image{
		width:250rpx;
		height:250rpx;
	}
	.guess-item>.guess-img{
		width:50rpx;
		height:50rpx;
		float: right;
		margin-right: 20rpx;
	}
	.guess-name{
		font-size: 32rpx;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-left:30rpx;
		text-align: left;
	}
	.guess-text{
		font-size: 26rpx;
		color:#999;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-left:15rpx;
	}
	.guess-price{
		text-align: left;
		margin-left:15rpx;
		font-size: 26rpx;
		color:#f00;
	}
</style>
