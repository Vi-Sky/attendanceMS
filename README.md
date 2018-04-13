# attendanceMS
学生考勤管理系统（SSM）


   git init //把这个目录变成Git可以管理的仓库
　　git add README.md //文件添加到仓库
　　git add . //不但可以跟单一文件，还可以跟通配符，更可以跟目录。一个点就把当前目录下所有未追踪的文件全部add了 
　　git commit -m "first commit" //把文件提交到仓库
　　git remote add origin git@github.com:wangjiax9/practice.git //关联远程仓库
　　git push -u origin master //把本地库的所有内容推送到远程库上



   原因：如果有未提交的更改，是不能git pull的

解决： 
先执行 git stash 
再执行 git pull --rebase origin master 

最后再执行  git push -u origin master



http://www.ruanyifeng.com/blog/2014/06/git_remote.html
