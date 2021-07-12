## add variable from argument after filename https://linuxhint.com/pass-argument-bash-script/
comments="$1"
## add list of directories to variable https://stackoverflow.com/questions/18884992/how-do-i-assign-ls-to-an-array-in-linux-bash/18887210
programs=($(ls -d */))
count=0
while [ ${count} -lt ${#programs[@]} ]; do
    cd ${programs[count]}
    git checkout main
    git add .
    git commit -m "$comments"
    git push origin main
    cd ..
    count=$((count+1))
done
git add .
git commit -m "$comments"
git push origin main