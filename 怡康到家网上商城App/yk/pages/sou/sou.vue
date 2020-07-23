<template>
	<view class="sou">
		<view class="sou-shop">
			<icon class="icon" size="20" type="search" ></icon>
			<input class="inp" type="text"  placeholder="请输入搜索内容" v-model="num"/>
			<view class="sou-suo" @click="suo">搜索</view>
		</view>
		<view class="guess">
				<view class="guess-index">
					<view class="guess-item" v-for="(x,y) in list" :key="y" @click="fn(x.id)">
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
	export default {
		data() {
			return {
				num:'',
				list:null
			}
		},
		methods: {
			suo(){
				console.log(this.num);
				uni.request({
					url:'http://localhost/ykphp/cx.php',
					data:{
						s:this.num
					},
					success:res=>{
						console.log(res.data);
						this.list = res.data
					}
				})
			},
			fn(id){
				let i = JSON.stringify(id);
				uni.navigateTo({
					url:`../index/info/info?id=${i}`,
				})
			},
		}
	}
</script>

<style>
	.sou{
		width:100%;
		height:1334rpx;
		background-color: #eee;
	}
	.inp{
		width:500rpx;
		height:60rpx;
		margin: 0 auto;
		font-size: 28rpx;
		background-color: #fff;
		position: relative;top:20rpx;
	}
	.icon{
		width: 64rpx;
		height:60rpx;
		background-color: #fff;
		text-align: center;
		line-height: 60rpx;
		position: absolute;
		left:62rpx;
		top:20rpx;
		border-top-left-radius: 20rpx;
		border-bottom-left-radius: 20rpx;
	}
	.sou-suo{
		width:100rpx;
		height:60rpx;
		font-size: 28rpx;
		background-color: #fff;
		text-align: center;
		line-height: 60rpx;
		position: absolute;
		right:24rpx;
		top:20rpx;
		border-top-right-radius: 20rpx;
		border-bottom-right-radius: 20rpx;
	}
	.guess{
		width:100%;
		margin-top:40rpx;
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
