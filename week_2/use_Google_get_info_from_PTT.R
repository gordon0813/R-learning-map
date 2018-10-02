#先使用google
library(rvest)
web1='https://www.google.com.tw/search?q='
webname='%e7%8e%8b%e5%82%91%e8%b3%a2'#要搜尋的(此處為:蔡爾成)
#'%E6%88%91%E7%9A%84%E8%8B%B1%E9%9B%84%E5%AD%B8%E9%99%A2'
web2='+ptt+site:www.ptt.cc&rlz=1C1GCEA_enTW762TW762&ei=njSjW5PDMIj08gWx8Je4DA&start='
webnum=''
webfinal='&sa=N&biw=1280&bih=653'
website=c()
long=1  # google 頁數
for(i in 0:long){
  webnum=as.character(i*10)
  web=paste(web1,webname,web2,webnum,webfinal,sep="")
  doc1 <- read_html(web)
  block=html_nodes(doc1,".r")
  text1=html_text(block)
  for (j in 1:10){
    website[j+i*10]=xml_attrs(xml_child(block[[j]], 1))[["href"]]#獲取網址
  }
  
}
print("down")
a=website  #診裡網址
a=strsplit(a,'&')

for (i in 1:(10*long+10)){
  a[[i]]=a[[i]][1]
  a[[i]]=strsplit(a[[i]],'=')
}
for (i in 1:(10*long+10)){
  a[[i]]=a[[i]][[1]][2]
}
website=a
#a=0
head(website)#整理完畢
#進入PTT
txtlist=list()
for (i in 1:(long*10)){
  doc1=read_html(website[[i]])
  
  txt=html_text(doc1)
  txt=strsplit(txt,'NTUcourse標題')#整理文章10篇
  txtlist[i] <- txt[[1]][2]
}
cat(txtlist[[2]])#顯示任一文章
cat(txtlist[[5]])#顯示任一文章