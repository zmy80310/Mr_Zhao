<template>
	<view class="login">
		<view class="login-logo">
			<image src="http://img.99danji.com/uploadfile/2015/1028/20151028115338199.png" mode=""></image>
		</view>
		<view class="login-name">怡康到家</view>
		<view class="login-item">
			<text class="item-text">短信登录</text>
			<text class="item-text1">密码登录</text>
		</view>
		
		<view class="inp">
			<input class="inp1" type="text" value="" v-model="inp1"  placeholder="请输入账号" />
			<view class="inp-x"></view>
			<input class="inp2" type="text" value="" v-model="inp2" placeholder="请输入密码"  password="true"/>
			<view class="inp-x"></view>
		</view>
		<view class="login">
			<view class="login1" @click="login">登录</view>
		</view>
		<view class="login">
			<view class="login1" style="background-color: #007AFF; margin-top: 20rpx;" @click="enroll">注册</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				inp1:'',
				inp2:''
			}
		},
		methods: {
			login(){
				if(this.inp1 && this.inp2 != ''){
					uni.request({
						url:'http://localhost/ykphp/login.php',
						data:{
							tel:this.inp1,
							pwo:this.inp2
						},
						success:res=>{
							 if(res.data === 1){
							    uni.showToast({
									title: '正在登陆',
							        icon: 'loading',
							        mask: true,
							        duration: 2000
							    })
							    uni.setStorage({
							        key: 'uname',
							        data: this.inp1,
							    })
							    setTimeout(() => {
							        uni.showToast({
										title: '登陆成功',
										icon: 'success'
									})
							    }, 2500)
							    setTimeout(() => {
							        uni.switchTab({
							            url: '/pages/index/index',
							        })
							    }, 3000)
							}else{
							    uni.showToast({
							         title: '账号或密码错误',
							        icon: 'loading',
							        duration: 2000
							      })
							}
						}
					})
				}else{
					 uni.showToast({
					    title: '输入内容为空',
					    icon: 'loading',
					    duration: 2000
					})
				}
			},
			enroll(){
				if(this.inp1 && this.inp2 != ''){
					let reg = /^1[3-9][0-9]{9}$/;
					if(reg.test(this.inp1)){
						uni.request({
							url:'http://localhost/ykphp/enroll.php',
							method:'POST',
							header:{
								 "content-type": 'application/x-www-form-urlencoded'
							},
							data:{
								tel:this.inp1,
								pwo:this.inp2
							},
							success:res=>{
								console.log(res.data);
								 if (res.data === 0) {
								    uni.showToast({
										title: '手机号已注册',
										icon: 'loading',
								        duration: 2000
										})
								    } else if (res.data === 2) {
										uni.showToast({
								        title: '注册成功',
								        icon: 'success',
								        duration: 2000
								    })
								} 
							}
						})
					}
				}else{
					uni.showToast({
					   title: '输入内容为空',
					    icon: 'loading',
					    duration: 2000
					 })
				}
			}
		}
	}
</script>

<style>
	.login{
		width:100%;
	}
	.login-logo{
		width:100%;
		height:300rpx;
		text-align: center;
		line-height: 400rpx;
	}
	.login-logo>image{
		width:130rpx;
		height:130rpx;
	}
	.login-name{
		width:100%;
		text-align: center;
		margin-top:-20rpx;
	}
	.login-item{
		width:100%;
		height: 80rpx;
		margin-top:20rpx;
		line-height: 80rpx;
		display: flex;
		justify-content: space-between;
		padding:0 120rpx;
		box-sizing: border-box;
	}
	.item-text1{
		color:#4CD964;
		
	}
	.inp{
		width: 100%;
		padding: 40rpx 80rpx;
		box-sizing: border-box;
	}
	.inp1{
		width:400rpx;
		margin-bottom: 20rpx;
		text-align: left;
	}
	.inp-x{
		width:100%;
		height:2rpx;
		background-color: #999;
		margin-bottom: 20rpx;
	}
	.inp2{
		width:400rpx;
		margin-bottom: 20rpx;
		text-align: left;
	}
	.login{
		width:100%;
		height:100rpx;
		text-align: center;
	}
	.login1{
		width:500rpx;
		height:80rpx;
		background-color: #4CD964;
		margin: 0 auto;
		text-align: center;
		line-height: 80rpx;
		color:#fff;
		border-radius: 10rpx;
	}
	
</style>
