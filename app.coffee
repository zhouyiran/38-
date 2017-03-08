# http://share.framerjs.com/uir4dh1zojbx/
# Framer.Device.screen.backgroundColor = "#fa6c6f"
bg = new BackgroundLayer
    backgroundColor: "#fa6c6f"

rightHouse = new Layer
	x: Align.center(100)
	y: Align.center()
	height: 362
	image: "images/heart-right.png"

leftHouse = new Layer
	x: Align.center(-100)
	y: Align.center()
	height: 362
	image: "images/heart-left.png"

flipHeart = new Layer
	x: Align.center(100)
	y: Align.center()
	height: 362
	originX: 0
	image: "images/heart-right.png"

flipHeart.states.add
	middle:
		rotationY: -90
		brightness: 140
	over:
		rotationY: -180
		brightness: 93

flipHeart.states.animationOptions =
	time: 0.4
	curve: "linear"

showLoveNames = new Layer
	x: 164
	y: 1301
	width: 1208
	height: 160
	html:"女神节快乐"
	style:
		textAlign:"center"
		fontSize:"40px"
		lineHeight:"160px"


showLove = new Layer
	x: 164
	y: 146
	backgroundColor:""
	width: 1208
	height: 160
	html:"love"
	style:
		textAlign:"center"
		fontSize:"100px"
		lineHeight:"160px"

showLove.center();

start = new Date(2015,7,8)
startSecond = start.getTime()/1000

handle = ()->
	flipHeart.states.switch("middle")
	Utils.delay 0.4,->
		flipHeart.states.switch("over")
	Utils.delay 0.9,->
		flipHeart.states.switchInstant("default")
	now = new Date()
	nowSecond = now.getTime()/1000
	diffDay = parseInt((nowSecond-startSecond )/3600/24)
	diffHour = parseInt((nowSecond-startSecond )/3600%24)
	diffMinute = parseInt((nowSecond-startSecond )/60%60)
	diffSecond = parseInt((nowSecond-startSecond )%60)
	name = "<br>慧慧、彩霞大人、张雪、盼盼、miss gao、来来"
	showLove.html = showLoveNames.html + name
	#showLove.html = showLoveNames.html + diffDay+"天"+diffHour+"小时"+diffMinute+"分"+diffSecond+"秒"

handle()
Utils.interval 1,->
	handle()
