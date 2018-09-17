rm(list = ls())  
a=rep(" ",9)
decision <- function(a,b,c,k) {
  if((k[a]==k[b])&(k[b]==k[c])&k[a]!=' '){
    return (1)
    }else{
    return (0)
    } 
}  
out1387<- function(a) {
  i=0
  while(TRUE){
    l1=paste(a[1+i],"|",a[2+i],"|",a[3+i],sep="")
    print(l1)
    i=i+3
    if(i>6){
      break
    }
    print("=======")
    
  }
  
}

flag=0
side=1
count=0
ox=c("o","x")
while(count<9){
  input=readline("input:  ")
  input=as.integer(input)
  if(input>9|input<1){
    print("¿é¤J¿ù»~")
    next
  }
  if(a[input]=="o"|a[input]=="x"){
    print("¿é¤J¿ù»~")
    next
  }
  
  a[input]=ox[side]
  
  flag=flag+decision(1,2,3,a)
  flag=flag+decision(4,5,6,a)
  flag=flag+decision(7,8,9,a)
  flag=flag+decision(1,4,7,a)
  flag=flag+decision(2,5,8,a)
  flag=flag+decision(3,6,9,a)
  flag=flag+decision(1,5,9,a)
  flag=flag+decision(3,5,7,a)
  out1387(a)
  if(flag>=1){
    break
  }
  
  side=side*-1
  count=count+1
} 
if(count==9){
  print("End in a draw!!! ")
}else{
  print(paste("winner:",ox[side]))
}

