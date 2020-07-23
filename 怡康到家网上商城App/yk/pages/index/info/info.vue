<template>
	<view class="info">
		<view class="zhan"></view>
		<!-- 图片 -->
		<view class="info-img">
			<image class="img-info" :src="infoData.src" mode=""></image>
		</view>
		<!-- 内容 -->
		<view class="info-content">
			<view class="info-name">{{infoData.name}}</view>
			<view class="info-text">{{infoData.text}}</view>
			<view class="info-price">¥{{infoData.price}}</view>
			
			<view class="info-j">
				<text>货号:14432</text>
				<text>规格:0.790g*60片</text>
				<text>库存:{{infoData.number}}</text>
			</view>
		</view>
		<!-- 优惠 -->
			<view class="info-you">
				<text class="you-text">优惠</text>
				<text class="you-icon">></text>
			</view>
			<!-- 厂家 -->
			<view class="info-vender">
				<text class="vender-text">厂家</text>
				<text class="vender-icon">(河北中诺果维康保健品有限公司)石药集团...</text>
			</view>
			<!-- 商品数量 -->
			<view class="info-number" @click="num">
				<text class="number-text">选择</text>
				<text class="number-name">选择商品数量</text>
				<text class="number-icon">>
				</text>
			</view>
			<!-- 占位 -->
			<view class="zhanwei"></view>
			<!-- 底部 -->
			<view class="info-bottom">
				<view class="kefu">
					<image src="http://www.yaoking.cn/wap_themes/yaoking_new/images/kefu.png" mode=""></image>
					<view class="k">客服</view>
				</view>
				<view class="gouwu" @click="shop">
					<image src="/static/icon-cart.png" mode=""></image>
					<view class="info-gouwu">购物车</view>
				</view>
				<view class="btns">
						<text class="add" @click="push">加入购物车</text>
						<text class="buy">立即购买</text>
				</view>
			</view>
			<uni-popup type="bottom" ref="popup">
				<view class="pop">
					<view class="pop-item">
						<image :src="infoData.src" mode=""></image>
						<view class="pop-text">
							<text class="pop-price">¥{{infoData.price}}</text>
							<text class="pop-icon">库存{{infoData.number}}件</text>
						</view>
						<view class="huohao">货号 : 118562</view>
					</view>
					<view class="pop-x"></view>
					<view class="pop-number">
						<view class="number-s">购买数量</view>
						<view class="number-btn">
							<text class="min" @click="min">-</text>
							<tect class="number">{{number}}</tect>
							<text class="pop-add" @click="add">+</text>
						</view>
					</view>
					<view class="btn" @click="close">确定</view>
				</view>
			</uni-popup>
	</view>
</template>

<script>
	import uniPopup from '../../../components/uni-popup/uni-popup.vue';
	export default {
		components:{
			uniPopup
		},
		data() {
			return {
				id:'',
				infoData:null,
				number:1
			}
		},
		methods: {
			num(){
				this.$refs.popup.open()
			},
			shop(){
				uni.switchTab({
					url:'../../shop/shop'
				})
			},
			add(){
				this.number++;
			},
			min(){
				if(this.number>1){
					this.number--;
				}
			},
			close(){
				this.$refs.popup.close();
				console.log(this.number);
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
			
		},
		onLoad(options) {
			this.id = JSON.parse(options.id);
			uni.request({
				url:'http://localhost/ykphp/info.php',
				data:{
					id:JSON.parse(options.id)
				},
				success:res=>{
					console.log(res.data);
					this.infoData = res.data;
				}
			})
		},
		onShow() {
			
		}
	}
</script>

<style>
	.info{
		background-color: #eee;
	}
	.zhan{
		width:100%;
		height:30rpx;
		background-color: #eee;
	}
	.info-img{
		width:100%;
		height:400rpx;
		text-align: center;
		background-color: #fff;
		line-height: 400rpx;
	}
	.img-info{
		width:400rpx;
		height:100%;
	}
	.info-content{
		width:100%;
		margin-top:30rpx;
		background-color: #fff;
		border:1px solid #fff;
	}
	.info-name{
		width:100%;
		text-align: left;
		margin-left:40rpx;
		text-align:20rpx;
	}
	.info-text{
		margin-top:20rpx;
		font-size: 28rpx;
		color:#f00;
		margin-left:40rpx;
	}
	.info-price{
		font-size: 40rpx;
		color: #f00;
		margin-left:40rpx;
		margin-top:20rpx;
		
	}
	.info-j{
		margin-top:30rpx;
		font-size: 24rpx;
		display: flex;;
		justify-content: space-around;
		color:#999;
	}
	.info-you{
		width:100%;
		margin-top:20rpx;
		height:100rpx;
		background-color: #fff;
		line-height: 100rpx;
		display: flex;
		justify-content: space-between;
		padding: 0 20rpx;
		box-sizing: border-box;
		
	}
	.you-text{
		font-size: 38rpx;
		color:#666;
	}
	.you-icon{
		color:#666;
	}
	.info-vender{
	width: 100%;
	height:100rpx;
	margin-top:20rpx;
	background-color: #fff;
	line-height: 100rpx;
	display: flex;
	justify-content: space-between;
	padding: 0 20rpx;
	box-sizing: border-box;
	}
	.vender-text{
		font-size: 38rpx;
		color:#666;
	}
	.vender-icon{
		font-size: 30rpx;
	}
	.info-number{
		width: 100%;
	    height:100rpx;
		line-height: 100rpx;
		background-color: #fff;
		margin-top:20rpx;
		
	}
	.number-text{
		font-size: 38rpx;
		color:#666;
		padding: 0 20rpx;
		box-sizing: border-box;
	}
	.number-icon{
		float: right;
		margin-right: 20rpx;
		color: #666;
	}
	.number-name{
		font-size: 32rpx;
		margin-left:30rpx;
		
	}
	.zhanwei{
		width:100%;
		height:300rpx;
	}
	.info-bottom{
		width: 100%;
		height:100rpx;
		position: fixed;
		bottom: 0rpx;
		left:0rpx;
		background-color: #fff;
	}
	.kefu{
		width:60rpx;
		height:100%;
		text-align: center;
		margin-left:20rpx;
		margin-top:10rpx;
	}
	.kefu>image{
		width:50rpx;
		height:50rpx;
	}
	.k{
		font-size: 24rpx;
		color:#4CD964;
	}
	.gouwu{
		height: 100rpx;
		position: absolute;
		left:120rpx;
		top:0rpx;
	}
	.gouwu>image{
		width:60rpx;
		height:60rpx;
	}
	.info-gouwu{
		font-size: 24rpx;
	}
	.btns{
		position: absolute;
		left:200rpx;
		top:0rpx;
		width:550rpx;
		height:100rpx;
		display: flex;
		justify-content: space-between;
	}
	.add{
		width: 50%;
		background-color: #ff6700;
		text-align: center;
		line-height: 100rpx;
		color:#fff;
	}
	.buy{
		width: 50%;
		background-color: #f00;
		text-align: center;
		line-height: 100rpx;
		color:#fff;
	}
	.pop{
		width:100%;
		height:600rpx;
		background-color: #fff;
	}
	.pop-item{
		width:100%;
		height:100rpx;
		position: relative;
	}
	.pop-item>image{
		width:200rpx;
		height:200rpx;
		position: absolute;
		left:30rpx;
		top:-20rpx;
	}
	.pop-text{
		position: absolute;
		left:260rpx;
		top:40rpx;
		width:500rpx;
	}
	.pop-price{
		color:#f00;
	}
	.pop-icon{
		float: right;
		margin-right: 20rpx;
		font-size: 24rpx;
		margin-top:10rpx;
		color:#999;
	}
	.huohao{
		position: absolute;
		left:260rpx;
		top:120rpx;
		font-size: 30rpx;
	}
	.pop-x{
		width:96%;
		height:2rpx;
		background-color: #999;
		position: absolute;
		top:200rpx;
		left:20rpx;	
	}
	.pop-number{
		width:100%;
		position: absolute;
		top:250rpx;
		display: flex;
		justify-content: space-between;
		padding:0 30rpx;
		box-sizing: border-box;
	}
	.number-s{
		font-size: 30rpx;
	}
	.min{
		display: block;
		width:50rpx;
		height:50rpx;
		background-color: #eee;
		text-align: center;
		line-height: 50rpx;
		color:#999;
		display: inline-block;		
	}
	.number{
		width: 60rpx;
		height:60rpx;
		text-align: center;
		line-height: 50rpx;
		display: block;
		display: inline-block;
	}
	.pop-add{
		width: 50rpx;
		height:50rpx;
		text-align: center;
		line-height: 50rpx;
		display: block;
		display: inline-block;
		background-color: #666666;
	}
	.btn{
		position: fixed;
		bottom: 0rpx;
		left:0rpx;
		width:100%;
		height:80rpx;
		text-align: center;
		line-height: 80rpx;
		background-color: #f00;
		color:#fff;
	}
	.add-top{
		width:100%;
		height:100rpx;
		background-color: #fff;
		text-align: center;
		line-height: 100rpx;
	}
</style>
