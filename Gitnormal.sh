
echo "第一个参数为:$1";

git add .;
git commit -m"updata";

if [[ $1 == push ]]; then
  git push origin master;
fi
