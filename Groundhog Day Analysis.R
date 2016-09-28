library(ggplot2)
gh<-read.csv("C:\\Users\\Matthew Scicluna\\Desktop\\Files\\TA work\\STA312 TA\\Bonus\\Groundhog Day.csv")
w<-read.csv("C:\\Users\\Matthew Scicluna\\Desktop\\Files\\TA work\\STA312 TA\\Bonus\\eng-monthly-011840-122006.csv",sep=',')
gh<-gh[-1,]
w[,2]<-as.numeric(as.vector(w[,2]),1:4) #Convert temp into number
w[,4]<-as.numeric(as.vector(w[,4]),1:4)
w<-w[19:length(w[,1]),]
w=w[w[,2]>1886,]
w1<-w[w[,3]==2,4]
w2<-w[w[,3]==3,4]
wavg<-w1+w2
wavg<-wavg/2
ghdata<-cbind(gh[1:117,],wavg[1:117])
levels(ghdata[,2])<-c('NA','NA','No Shadow','No Shadow',
'Saw Shadow','Saw Shadow','Saw Shadow',
'NA','No Shadow','No Shadow',
'Saw Shadow','Saw Shadow','Saw Shadow')
#Cleaned up the levels
ghdata[,1]<-as.numeric(as.vector(ghdata[,1]))
names(ghdata)<-c('Year','Shadow','Temp')
#rename names for ease of use
#str(ghdata) to make sure this works!
shadow<-ghdata[ghdata[,2]=='Saw Shadow',]
nshadow<-ghdata[ghdata[,2]=='No Shadow',]
mean(shadow[,3])
mean(nshadow[,3])
t.test(shadow[,3],nshadow[,3]) #Lets do a t test to find out if groundhogs are psychic!
qplot(Year,Temp,data=ghdata,color=Shadow, shape=Shadow)
qplot(Year,Temp,data=ghdata,facets=Shadow~.)
qplot(Year,Temp,data=ghdata,facets=Shadow~.,geom=c('point','smooth'), method='lm')
