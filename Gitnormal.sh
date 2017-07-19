
echo "第一个参数为:$1";
echo "第二个参数为:$2";

Path=$1
Push=$2


echo $Path

cd $Path

git add .
git commit -m"updata"

if [[ $Push == push ]]; then
  git push origin master; #push to github
fi
