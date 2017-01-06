#!/bin/bash
#author:zjs

demoFun() {

	echo "this is my first Shell function!"
}

echo "---- function start ----"

demoFun

echo "---- function end ----"

#return

funWithReturn() {

	echo "输入第一个数字："
	read aNum

	echo "输入第二个数字: "
	read anotherNum

	echo "两个数字分别为 $aNum 和 $anotherNum "
	return $(($aNum + $anotherNum))
}

funWithReturn
echo "输入的两个数字之和为 $? "

#函数参数
#略


