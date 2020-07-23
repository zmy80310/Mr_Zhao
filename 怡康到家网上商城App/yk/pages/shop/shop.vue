<template>
	<view class="shop">
		<!-- 自定义导航 -->
		<uni-nav-bar fixed="true" status-bar="true" backgroundColor="#3CB371" color="#fff">
			<view class="navbar">购物车</view>
		</uni-nav-bar>
		<view class="shop-k" v-if="list == ''">
			<view class="shop-k1">
				<image src="../../static/icon-cart.png" mode=""></image>
			</view>
			<view class="shop-tit">
				购物车快饿扁了T.T
			</view>
			<view class="shop-tit1">
				你的购物车空空如也！
			</view>
			<view class="shop-btn" @click="home">
				去添加
			</view>
		</view>
		<view v-if="list != ''">
			<view class="shp">普通商品</view>
			<!-- 商品渲染 -->
			<view class="zhan">
				<view class="shop-item"  v-for="(x,y) in list" :key="y">
					<view class="item-shop">
						<icon v-if="x.selected" type="success" color="red" size="30" @click="selectList(y)" />
						<icon v-else type="circle" @click="selectList(y)"  size="30"/>
						<view class="item-img">
							<image  :src="x.src"></image>
						</view>
						<view class="shop-name">{{x.name}}</view>
						<view class="shop-number">x1</view>
						<view class="shop-price">¥{{x.price}}</view>
						<view class="shop-add">
							<view class="min" @click="min(y,x.id)">-</view>
							<view class="number">{{x.number}}</view>
							<view class="add" @click="add(y,x.id)">+</view>
						</view>
						<view class="shop-move" @click="move(x.id)">删除</view>
					</view>
				</view>
				<!-- 全选 -->
				<view class="shop-q">
					      <icon v-if="selectAllStatus" type="success_circle" color="#ff6700" size="30" @click="selectAll" />
					      <icon v-else type="circle" color="#999" @click="selectAll" size="30" />
						  <text class="shop-q1">合计:<text class="shop-q2">{{numberAll}}元</text></text>
							<view class="jiesuan">立即结算</view>
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
				list:[
					
				],
				selectAllStatus: false,
				 dele_goods: '',
				 numberAll:0,
				 arr:[],
				 number:1
			}
		},
		methods: {
			home(){
				uni.switchTab({
					url:'../index/index'
				})
			},
			add(y,i){
				this.list[y].number++;
				wx.request({
				      url: 'http://localhost/ykphp/add.php',
				      data: {
				        id: i,
				        number: this.list[y].number
				      },
				      success: res => {
						this.list = res.data;
				      }
				    })
			},
			min(y,i){
				if(this.list[y].number > 1){
					this.list[y].number--;
				}
				wx.request({
				      url: 'http://localhost/ykphp/add.php',
				      data: {
				        id: i,
				        number: this.list[y].number
				      },
				      success: res => {
						this.list = res.data;
				      }
				    })
			},
			selectAll(){
				let dele_goods = this.dele_goods;
				    let selectAllStatus = this.selectAllStatus;
				    selectAllStatus = !selectAllStatus;
				    let list = this.list;
				    dele_goods = !dele_goods;
				    for (let i = 0; i < list.length; i++) {
				      list[i].selected = selectAllStatus;
				    }
				      this.selectAllStatus = selectAllStatus;
				      this.list = list;
				      this.dele_goods = dele_goods;
					  this.getTotalPrice();
			},
			move(id){
				let i = id
				uni.showModal({
				      title: '提示',
				      content: '是否确定删除此商品',
				      cancelText: '取消',
				      confirmText: '确定',
				      success: res => {
				        if (res.confirm) {
				          wx.request({
				            url: 'http://localhost/ykphp/gwmove.php',
				            method: 'POST',
				            header: {
				              "content-type": 'application/x-www-form-urlencoded'
				            },
				            data: {
				              id: i,
				            },
				            success: res => {
								 if(typeof res.data === 'object'){
									 this.list = res.data;
								 }else{
									this.list = []
								 }
				                wx.showToast({
				                  title: '删除成功',
				                  icon: 'success',
				                  duration: 2000
				                })
				              }
				            
				          })
				        }
				      }
				    })
			},
			selectList(y){
				let list = this.list;
				this.selectAllStatus = true;
				const selected = list[y].selected;
				list[y].selected = !selected;
				for(var i = list.length-1;i>=0;i--){
					if(!list[i].selected){
						this.selectAllStatus = false;
						break;
					}
				}
				this.list = list;
				this.selectAllStatus = this.selectAllStatus;
				this.getTotalPrice();
				
			},
			getTotalPrice(){
				let list = this.list;
				let total = 0;
				for(let i = 0; i < list.length;i++){
					if(list[i].selected){
						total += list[i].number * list[i].price;     // 所有价格加起来
					}
				}
				this.list = list;
				this.numberAll = total.toFixed(2);
			}
		},
		onShow() {
			uni.request({
				url:'http://localhost/ykphp/shop.php',
				success: res => {
					this.list = typeof res.data === 'object' ? res.data : [];
				}
			})
		}
	}
</script>

<style>
	.shop{
		width:100%;
		height:100%;
		background-color: #eee;
	}
	.zhan{
		width:100%;
		background-color: #F5F5F5;
		margin-top:20rpx;
	}
	.navbar{
		width:100%;
		text-align: center;
	}
	.shop-k{
		width:100%;
		height:100%;
		background-color: #fff;
		position: relative;
	}
	.shop-k1{
		width:200rpx;
		height:200rpx;
		background-color: #eee;
		border-radius: 50%;
		position: absolute;
		top:100rpx;
		left: calc(50% - 100rpx);
		text-align: center;
	}
	.shop-k1>image{
		width:70%;
		height:70%;
		margin-top:40rpx;
	}
	.shop-tit{
		width:100%;
		text-align: center;
		position: absolute;
		left:0rpx;
		top:320rpx;
	}
	.shop-tit1{
		width:100%;
		text-align: center;
		font-size: 30rpx;
		position: absolute;
		left:0rpx;
		top:400rpx;
	}
	.shop-btn{
		width:300rpx;
		height:100rpx;
		text-align: center;
		line-height: 100rpx;
		background-color: #3CB371;
		border-radius: 20rpx;
		position: absolute;
		left: calc(50% - 150rpx);
		top:480rpx;
		color:#FFFFFF;
	}
	.shop-item{
		width:96%;
		height:350rpx;
		background-color: #fff;
		margin: 0 auto;
		border:2rpx solid #fff;
		border-bottom: 2rpx solid #000;
	}
	.item-shop{
		width:100%;
		position: relative;
		margin-top:20rpx;
		margin-left:30rpx;
	}
	.item-shop>icon{
		position: absolute;
		left:0;
		top:calc(50% - 30rpx);
	}
	.item-img{
		width:200rpx;
		height:200rpx;
		border:2rpx solid #eee;
		text-align: center;
		margin-left:70rpx;
		
	}
	.item-img>image{
		width:80%;
		height:80%;
		margin-top:calc(50% - 80rpx);
		
	}
	.shop-name{
		position: absolute;
		top:0rpx;
		left:300rpx;
		font-size: 26rpx;
	}
	.shop-number{
		position: absolute;
		top:170rpx;
		left:330rpx;
		font-size: 28rpx;
	}
	.shop-price{
		position: absolute;
		right: 80rpx;
		top:170rpx;
		font-size: 28rpx;
		color:#f00;
	}
	.shop-add{
		width:350rpx;
		height:50rpx;
		border:2rpx solid #eee;
		position: absolute;
		top:240rpx;
		left:70rpx;
	}
	.min{
		display: inline-block;
		width: 100rpx;
		height: 100%;
		text-align: center;
		background-color: #eee;
		color: #666;
	}
	.number{
		display: inline-block;
		width:150rpx;
		height: 100%;
		text-align: center;
		font-size: 30rpx;;
	}
	.add{
		display: inline-block;
		width: 100rpx;
		height: 100%;
		text-align: center;
		background-color: #eee;
		color: #666;
		float: right;
	}
	.shop-move{
		width:200rpx;
		height:50rpx;
		text-align: center;
		line-height: 50rpx;
		font-size: 28rpx;
		color: #999;
		border: 2rpx solid #eee;
		border-radius: 10rpx;
		position: absolute;
		right: 40rpx;
		top:240rpx;
	}
	.shp{
		width: 100%;
		color:#666;
		margin-top:30rpx;
		margin-left:50rpx;
	}
	.shop-q{
		width:96%;
		height:150rpx;
		background-color: #F5F5F5;
		margin:0 auto;
		border-radius: 10rpx;
		position: relative;
	}
	.shop-q>icon{
		margin-left:30rpx;
		margin-top:40rpx;
		display: inline-block;
	}
	.shop-q1{
		font-size: 28rpx;
		position: absolute;
		top:55rpx;
		left:130rpx;
	}
	.shop-q2{
		font-size: 28rpx;
		color:#f00;
		margin-left: 10rpx;
	}
	.jiesuan{
		font-size: 30rpx;
		color:#fff;
		width: 200rpx;
		height: 80rpx;
		background-color: #f00;
		text-align: center;
		line-height: 80rpx;
		border-radius: 10rpx;
		float: right;
		margin-top: 30rpx;
		margin-right: 20rpx;
	}
</style>
