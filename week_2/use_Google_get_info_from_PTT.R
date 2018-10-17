#先使用google
library(rvest)
library(xml2)
web1='https://www.google.com.tw/search?q='
webname='%E5%9C%8B%E6%85%B6'#要搜尋的
#'%E6%88%91%E7%9A%84%E8%8B%B1%E9%9B%84%E5%AD%B8%E9%99%A2'
web2='&rlz=1C1GCEA_enTW762TW762&tbm=nws&ei=t72-W4GfH4qY8wXnuJdI&start='
webfinal='&sa=N&biw=1280&bih=579&dpr=1.5'

website=c()
long=1 # google 頁數


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

is_udn=grepl("udn.com",website) 
is_yahoo=grepl("yahoo.com",website)
is_chinatimes=grepl("chinatimes.com",website)
#進入PTT
txtudn=c()
txtyahoo=c()
txtchinatimes=list()
for (i in 1:(long*10)){
  doc1=read_html(website[[i]])
  if(is_udn[i]==TRUE){
    doc1 <- read_html(website[[i]])
    block=html_nodes(doc1,"#story_body_content")
    txtudn=append(txtudn,html_text(block))
  }
  if(is_chinatimes[i]==TRUE){
    doc1 <- read_html(website[[i]])
    block=html_nodes(doc1,".arttext morbotm clear-fix")
    txtchinatimes=append(txtchinatimes,html_text(block))
  }
  # txt=html_text(doc1)
  # txt=strsplit(txt,'NTUcourse標題')#整理文章10篇
  # txtlist[i] <- txt[[1]][2]
}
#cat(txtlist[[2]])#顯示任一文章
cat(txtudn[[2]])#顯示任一文章
