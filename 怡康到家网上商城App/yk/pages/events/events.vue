<template>
	<view class="events">
		<!-- 自定义导航 -->
		<uni-nav-bar fixed="true" status-bar="true" backgroundColor="#3CB371" color="#fff">
			<view class="navbar">活动</view>
		</uni-nav-bar>
		<view class="events-img">
			<image src="../../static/bb.png" mode=""></image>
		</view>
		<view class="events-img1">
			<image src="../../static/fib.png" mode=""></image>
		</view>
		<view class="guess">
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in rib" :key="y" @click="fn(x.id)">
						<image :src="x.src" mode=""></image>
						<view class="guess-name">{{x.name}}</view>
						<view class="guess-price">¥{{x.price}}</view>
					</view>
				</view>
		</view>
		<!-- 呼吸 -->
		<view class="events-img1">
			<image src="../../static/huxi.png" mode=""></image>
		</view>
		<view class="guess">
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in huxi" :key="y" @click="fn(x.id)">
						<image :src="x.src" mode=""></image>
						<view class="guess-name">{{x.name}}</view>
						<view class="guess-price">¥{{x.price}}</view>
					</view>
				</view>
		</view>
		<!-- 滋养保健 -->
		<view class="events-img1">
			<image src="../../static/baojian.png" mode=""></image>
		</view>
		<view class="guess">
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in baojian" :key="y" @click="fn(x.id)">
						<image :src="x.src" mode=""></image>
						<view class="guess-name">{{x.name}}</view>
						<view class="guess-price">¥{{x.price}}</view>
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
				rib:null,
				huxi:null,
				baojian:null
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
		onShow() {
			uni.request({
				url:'http://localhost/ykphp/rib.php',
				success: res => {
					this.rib = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/huxi.php',
				success: res => {
					this.huxi = res.data
				}
			}),
			uni.request({
				url:'http://localhost/ykphp/baojian.php',
				success: res => {
					this.baojian = res.data
				}
			})
		}
	}
</script>

<style>
	.events{
		background-color: #eee;
	}
	.navbar{
		width:100%;
		text-align: center;
	}
	.events-img{
		width:100%;
		height:400rpx;
	}
	.events-img>image,.events-img1>image{
		width:100%;
		height:100%;
	}
	.events-img1{
		width:100%;
		height:60rpx;
		margin-top: 20rpx;
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
		font-size: 28rpx;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		margin-left:20rpx;
		text-align: left;
	}
	.guess-price{
		text-align: left;
		margin-left:25rpx;
		font-size: 30rpx;
		margin-top:30rpx;
		color:#f00;
	}
</style>
