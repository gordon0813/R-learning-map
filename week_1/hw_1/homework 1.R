rm(list = ls()) 
#=====================================1
a=iris
dim(a)
tail(a)
summary(a)
print("2. ==============================")
for (i in c(1:9)){
  for(j in c(1:9)){
    print(paste(i,'x',j,'=',i*j))
  }
}
print("3. ==================================")
s=sample(1:100,size=10)
for(i in c(1:10)){
  if(s[i]==66){
    print("so 666666666666")
  }
  else if(s[i]>50&&s[i]%%2==0){
    print(paste("even and more than 50:",s[i]))
  }
  
}
print('4. ====================================')
year=readline("input year: ")
year=as.integer(year)
if(year%%4==0){
  if(year%%100==0){
    if(year%%400==0){
      print("yes")
    }else{
    print("no")
    }
  }else {
    print("yes")
  }
}else {
  print("no")
}