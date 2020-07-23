<template>
	<view class="call">
		<!-- 自定义导航 -->
		<uni-nav-bar fixed="true" status-bar="true" backgroundColor="#3CB371" color="#fff">
			<view class="call-left" slot="left">
				<text>陕西</text>
				<image class="call-img" src="../../static/xia.png" mode=""></image>
			</view>
			<view class="call-centent">
				<icon class="call-icon" size="20" type="search"></icon>
				<text class="call-text">新注册用户送100现金代金劵</text>
			</view>
			<view class="call-right" slot="right">
				<image class="right-img" src="../../static/scan.png" mode=""></image>
				<image class="right-img" src="../../static/lingdang.png" mode=""></image>
			</view>
		</uni-nav-bar>
		
		<!-- banner -->
		<view class="banner">
			<view class="banner-item" v-for="(x,y) in banner" :key="y">
				<image class="banner-img" :src="x.src" mode=""></image>
				<view>{{x.name}}</view>
			</view>
		</view>
		<!-- 轮播图 -->
		<view class="swiper">
			<swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" :circular="true" easing-function="linear">
				<swiper-item v-for="(x,y) in swiper" :key="y">
					<view class="swiper-item">
						<image :src="x.src" mode=""></image>
					</view>
				</swiper-item>
			</swiper>
		</view>
		<!-- banner1 -->
		<view class="banner1">
			<view class="banner1-item" v-for="(x,y) in banner1" :key="y">
				<image class="banner1-img" :src="x.src" mode=""></image>
				<view class="banner1-text">{{x.name}}</view>
			</view>
		</view>
		<!-- 专享 -->
		<view class="enjoy">
			<image src="https://p3.maiyaole.com/img/mobile/20202/1583291715324104.jpg" mode=""></image>
		</view>
		<!-- 团购 -->
		<view class="call-group">
			<view class="group-view">
				<text class="view-text">拼团购</text>
				<text class="view-text1">更多  ></text>
			</view>
			<scroll-view scroll-x="true">
				<view class="content-index" v-for="(x,y) in cscoll" :key="y" @click="fn(x.id)">
					<image class="content-img" :src="x.src" mode=""></image>
					<view class="content-text">{{x.name}}</view>
					<view class="content-price">¥{{x.price}}</view>
				</view>
			</scroll-view>
		</view>
		<!-- 图 -->
		<view class="enjoy1">
			<image src="https://p1.maiyaole.com/img/mobile/20193/1556610892577101.jpg" mode=""></image>
		</view>
		<!-- scoll2 -->
		<view class="call-scoll1">
			<view class="cscoll">热卖专区 ></view>
			<scroll-view scroll-x="true">
				<view class="content-index" v-for="(x,y) in cscoll" :key="y" @click="fn(x.id)">
					<image class="content-img" :src="x.src" mode=""></image>
					<view class="content-text">{{x.name}}</view>
					<view class="content-price">¥{{x.price}}</view>
				</view>
			</scroll-view>
		</view>
		<!-- 图 -->
		<view class="enjoy1">
			<image src="https://p1.maiyaole.com/img/mobile/20188/1538188351745101.jpg" mode=""></image>
		</view>
		<!-- scoll3 -->
		<view class="call-scoll2">
			<scroll-view scroll-x="true">
				<view class="content-index" v-for="(x,y) in cscoll" :key="y" @click="fn(x.id)">
					<image class="content-img" :src="x.src" mode=""></image>
					<view class="content-text">{{x.name}}</view>
					<view class="content-price">¥{{x.price}}</view>
				</view>
			</scroll-view>
		</view>
		<!-- 图 -->
		<view class="enjoy1">
			<image src="https://p3.maiyaole.com/img/mobile/20176/1499410059646101.jpg" mode=""></image>
		</view>
		<!-- scoll4 -->
		<view class="call-scoll2">
			<scroll-view scroll-x="true">
				<view class="content-index" v-for="(x,y) in cscoll" :key="y" @click="fn(x.id)">
					<image class="content-img" :src="x.src" mode=""></image>
					<view class="content-text">{{x.name}}</view>
					<view class="content-price">¥{{x.price}}</view>
				</view>
			</scroll-view>
		</view>
		<!-- s商品 -->
		<view class="guess">
				<view class="index-guess">猜你喜欢</view>
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in scoll" :key="y" @click="fn(x.id)">
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
				banner:null,
				swiper:null,
				banner1:null,
				cscoll:null,
				scoll:null
			}
		},
		methods: {
			fn(id){
				let i = JSON.stringify(id);
				uni.navigateTo({
					url:`../index/info/info?id=${i}`,
				})
			},
		},
		onLoad() {
			uni.request({
				url:'http://localhost/ykphp/callbanner.php',
				success: res => {
					this.banner = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/callswiper.php',
				success: res => {
					this.swiper = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/callbanner1.php',
				success: res => {
					this.banner1 = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/cscoll.php',
				success: res => {
					this.cscoll = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/scoll.php',
				success: res => {
					this.scoll = res.data
				}
			})
		}
	}
</script>

<style>
	.call{
		background-color: #eee;
	}
	.call-left{
		border:2rpx solid #3CB371;
	}
	.call-img{
		width:30rpx;
		height:30rpx;
		position: absolute;
		top:33rpx;
		left:90rpx;
	}
	.call-centent{
		width:450rpx;
		height:60rpx;
		background-color: #fff;
		border-radius: 20rpx;
		
	}
	.call-icon{
		position: absolute;
		top:0rpx;
		left:170rpx;
	}
	.call-text{
		position: absolute;
		top:0rpx;
		color:#999;
		font-size: 26rpx;
		margin-left:60rpx;
	}
	.call-right{
		width:400rpx;
		margin-top:25rpx;
	}
	.right-img{
		width:60rpx;
		height:60rpx;
	}
	.banner{
		width:100%;
		display: flex;
		justify-content: space-around;
		align-items: center;
		background-color: #fff;
		padding-top:20rpx;
	}
	.banner-item{
		width:25%;
		text-align: center;
	}
	.banner-img{
		width:100rpx;
		height: 100rpx;
	}
	.banner-item>view{
		font-size: 30rpx;
		color:#999;
	}
	.swiper{
		width: 96%;
		height: 154px;
		margin: 0 auto;
		border-radius: 20rpx;
		margin-top:20rpx;
	}
	.swiper>swiper-item{
		width: 100%;
		height: 100%;
		border-radius: 20rpx;
	}
	.swiper-item{
		width: 100%;
		height: 100%;
		border-radius: 20rpx;
	}
	.swiper-item>image{
		width: 100%;
		height: 100%;
		border-radius: 20rpx;
	}
	.banner1{
		width:100%;
		display: flex;
		justify-content: space-around;
		align-items: center;
		flex-wrap: wrap;
		margin-top:40rpx;
	}
	.banner1-item{
		width:20%;
		text-align: center;
		margin-bottom: 40rpx;
	}
	.banner1-img{
		width: 100rpx;
		height:100rpx;
	}
	.banner1-text{
		font-size: 28rpx;
		color:#999;
	}
	.enjoy1{
		width:100%;
		height:500rpx;
		margin-top:30rpx;
	}
	.enjoy1>image{
		width:100%;
		height:100%;
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
	.call-group{
		width:96%;
		margin: 20rpx auto;
		background-color: #fff;
		border-radius: 10rpx;
	}
	.group-view{
		width:100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding:20rpx 20rpx 20rpx 40rpx;
		box-sizing: border-box;
	}
	.view-text{
		color:#f00;
	}
	.view-text1{
		color:#999;
	}
	.call-scoll1>scroll-view{
		width:100%;
		height:100%;
		white-space: nowrap;
		margin-top:40rpx;
	}
	.call-scoll2{
		background-color: #fff;
		border: 2rpx solid #fff;
	}
	.call-scoll2>scroll-view{
		width:100%;
		height:100%;
		white-space: nowrap;
		margin-top:40rpx;
	}
	.call-group>scroll-view{
		width:100%;
		height:100%;
		white-space: nowrap;
		margin-top:40rpx;
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
	.call-scoll1{
		width:100%;
		position: relative;
		padding-left:80rpx;
		box-sizing: border-box;
		background-color: #fff;
		border: 2rpx solid #fff;
		
	}
	.cscoll{
		width:60rpx;
		height:100%;
		position: absolute;
		top:0;
		left:0;
		background-color: #AA0000 ;
		color:#fff;
		text-align: center;
		line-height: 60rpx;
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
