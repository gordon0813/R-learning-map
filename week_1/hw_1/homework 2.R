rm(list = ls())  
s=sample(0:9,size=4)
if(FALSE){
  'sample函數可以完成隨機抽樣處理，其基本形式為：
  sample（x, size, replace = FALSE）
  參數說明
  x整體數據，以向量形式給出
  size抽取樣本的數目
  replace如果為F（默認），則是不重複抽樣，此時size不能大於x的長度；
  如果為T ，則是重複抽樣，此時size允許大於x的長度'
}
a=0
s1=as.character(s)
while(a<4){
input=readline("input:  ")

vec=c()
for (i in 1:4){
  vec[i]=substr(input,i,i)
}

a=0
b=0
for (i in 1:4){
  for (j in 1:4){
    if(vec[i]==s1[j]){
      b=b+1
    }
    
  }
  if(s1[i]==vec[i]){
    a=a+1
    b=b-1
  }
}
s2=paste(a,"A",b,"B")
print(s2)
}

