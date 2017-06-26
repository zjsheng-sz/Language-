#!/bin/bash

echo "svn up....."
#svn up 

#export BUILD_NUMBER="V03.06.02"
#echo "android Vision:$BUILD_NUMBER"

PRO=`basename $PWD`
#echo "PRO=$PRO"
case "$PRO" in
		My905|my905|MY905)
			PRO=my905	
			SEC_PRODUCT=my905			
			;;			
		My908|my908|MY908)
			PRO=my908
			SEC_PRODUCT=my908v11	
			;;
		MS908_BSRO)
			PRO=MS908_BSRO
			SEC_PRODUCT=MS908_BSRO	
			;;	
		My908_CV|my908_CV|My908_cv|my908_cv|MY908_CV)
			PRO=my908_cv
			SEC_PRODUCT=my908v11_cv	
			;;
		My908_MXC|my908_MXC|My908_MXC|my908_MXC|MY908_MXC)
			PRO=my908_MXC
			SEC_PRODUCT=my908v11_MXC
			;;
		*)
			PRO=unknow			
esac


if [ $PRO = "unknow" ]  
then
	echo '1.My905 user'
	echo '2.My908 user'
	echo '3.MS908_BSRO user'
	echo '4.My908 CV user'
	echo '5.My908 MXC user'
	echo "you had not select PRODUCT,please select product num to starting make SDK"
	
	while read -p "Input Num to select :" NUM
	do
	if ((("$NUM" >= 1))&&(("$NUM" <= 5)))
		then
		echo "num:$NUM"
	  break
	else
		echo "please input the num shall be 1 to 3!!!!!"	
	fi	
	done
	
	case "$NUM" in
			1)
				PRO=my905	
				SEC_PRODUCT=my905		
				;;			
			2)
				PRO=my908
				SEC_PRODUCT=my908v11	
				;;
			3)
				PRO=MS908_BSRO
				SEC_PRODUCT=MS908_BSRO	
				;;	
			4)
			PRO=my908_cv
			SEC_PRODUCT=my908v11_cv	
				;;		
			5)
			PRO=my908_MXC
			SEC_PRODUCT=my908v11_MXC	
				;;			
	esac
fi

echo "PRO = $PRO"

source "./version_$PRO.sh"
export JAVA_HOME=/opt/jdk1.6.0
export CLASSPATH=$JAVA_HOME/lib/:$JAVA_HOME/jre/lib/
export PATH=/opt/arm-2010q1/bin/:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

export BUILD_NUMBER="$BUILD_NUMBER"
echo "android Vision:'$BUILD_NUMBER'"


case "$1" in
	clean)
		CLEAN=clean
		echo "yes $CLEAN"		
	;; 
	"")
		MYFILE=".pro.txt"
		LASTPRO=$(cat $MYFILE)
		echo "LASTPRO=$LASTPRO"		
		if [ ! -f "$MYFILE" ]; then
			CLEAN=clean
			echo "Fist make SDK ,yes project shell $CLEAN "	
			echo "$PRO"	> $MYFILE
		else
			if [ "$PRO" != "$LASTPRO" ]; then
				CLEAN=clean
				echo "The last pro is not this one ,yes project shell $CLEAN"
				echo "$PRO"	> $MYFILE
			else			
				echo "no ,project not need clean"
			fi	
		fi 		
		;;
		
			not_clean)
		MYFILE=".pro.txt"
		LASTPRO=$(cat $MYFILE)
		echo "LASTPRO=$LASTPRO"		
		if [ ! -f "$MYFILE" ]; then
			CLEAN=clean
			echo "Fist make SDK ,yes project shell $CLEAN "	
			echo "$PRO"	> $MYFILE
		else
			if [ "$PRO" != "$LASTPRO" ]; then
				CLEAN=clean
				echo "The last pro is not this one ,yes project shell $CLEAN"
				echo "$PRO"	> $MYFILE
			else			
				echo "no ,project not need clean"
			fi	
		fi 		
		;;
	*)
		echo "you args invalid, verify please!!!!!"
		exit 0
		;;
esac


function check_exit()
{
	if [ $? != 0 ]
	then
		#echo "$2"	
		#echo "==========$?"
		exit 1
	fi
}

echo '[[[[[[[ Make image for u-boot ]]]]]]]'
cd ./uboot/trunk/
echo "$PWD"
echo "./build$PRO.sh"
./build$PRO.sh $CLEAN
check_exit
cd -

echo '[[[[[[[ Make image for kernel ]]]]]]]'
cd ./kernel/trunk/
echo "$PWD"
echo "./build$PRO.sh"
./build$PRO.sh $CLEAN
check_exit
cd -

echo '[[[[[[[ Make image for android ]]]]]]]'
cd ./android/trunk/
echo "$PWD"
#my908_group_burn_files.sh
echo "./group_burn_files_$PRO.sh"
source build/envsetup.sh  
echo "=========SEC_PRODUCT=$SEC_PRODUCT========="
if [ "$SEC_PRODUCT" = "my908v11_MXC" ]
then
	echo "TARGET_PRODUCT=$SEC_PRODUCT"
	export TARGET_PRODUCT=$SEC_PRODUCT
else
	export TARGET_PRODUCT=autel_$SEC_PRODUCT
fi	

export TARGET_BUILD_VARIANT=user
echo "==+====./group_burn_files_$PRO.sh===+==="
./group_burn_files_$PRO.sh $CLEAN
make otapackage
check_exit
cd -

MYDATE=`date +%Y%m%d`
FOLDER_NAME=$MYDATE-$BUILD_NUMBER-$SEC_PRODUCT
if [ ! -d "$FOLDER_NAME" ]; then
mkdir $FOLDER_NAME
fi
cd $FOLDER_NAME
if [ ! -d "autel_factory" ]; then
mkdir autel_factory
fi
cd -


cp .amend_$PRO.txt $FOLDER_NAME/autel_factory/$FOLDER_NAME.txt
cp scp_4412_$PRO/* $FOLDER_NAME/autel_factory/
if [ "$SEC_PRODUCT" = "my908v11_MXC" ]
then
cp android/trunk/out/target/product/$SEC_PRODUCT/$SEC_PRODUCT-ota-$BUILD_NUMBER.zip $FOLDER_NAME/$SEC_PRODUCT-ota-$BUILD_NUMBER-$MYDATE.zip
else
cp android/trunk/out/target/product/$SEC_PRODUCT/autel_$SEC_PRODUCT-ota-$BUILD_NUMBER.zip $FOLDER_NAME/autel_$SEC_PRODUCT-ota-$BUILD_NUMBER-$MYDATE.zip
fi
echo "[[[[[[[ imgs ok success in scp_4412_$PRO ]]]]]]]"
echo 
exit 0
