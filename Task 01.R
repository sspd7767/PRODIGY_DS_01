#Selecting Population dataset
data<-read.csv("D:/Prodigy Internship/world_population.csv")
head(data)
str(data)
summary(data)
colnames(data)
dim(data)

#BARCHARTS
par(mfrow=c(2,2))
#top 5 countries with least population in 1970
data1<-data[order(data$X1970.Population),]
x<-head(data1,5)$X1970.Population
names<-head(data1,5)$CCA3
barplot(x,names.arg=names,horiz = TRUE, ylab="Country", xlab="Population",main="Top 5 least populated countries in 1970",col="yellow")

#top 5 countries with least population in 2022
data2<-data[order(data$X2022.Population),]
x1<-head(data2,5)$X2022.Population
names1<-head(data2,5)$CCA3
barplot(x1,names.arg=names1,horiz = TRUE,ylab="Country", xlab="Population",main="Top 5 least populated countries in 2022",col="yellow")

#top 5 countries highest population in 1970
data3<-data[order(data$X1970.Population),]
x2<-tail(data3,5)$X1970.Population
names2<-tail(data3,5)$CCA3
barplot(x2,names.arg=names2,horiz = TRUE,ylab="Country",xlab="Population",main="Top 5 Highest populated countries in 1970",col="light pink")

#top 5 countries with highest population in 2022
data4<-data[order(data$X2022.Population),]
x3<-tail(data4,5)$X2022.Population
names3<-tail(data4,5)$CCA3
barplot(x3,names.arg=names3,horiz = TRUE,ylab="Country", xlab="Population",main="Top 5 Highest populated countries in 2022",col="light pink")

#Stacked Bar Chart
library(ggplot2)
data4<-data[order(data$X2022.Population),]
X2010<-tail(data4,5)$X2010.Population
X2015<-tail(data4,5)$X2015.Population
X2020<-tail(data4,5)$X2020.Population
d<-stack(list("2010"=X2010,"2015"=X2015,"2020"=X2020))
df<-data.frame(rep(tail(data4,5)$Country.Territory,3),d)
colnames(df)<-c("Country","Population","Year")
ggplot(df, aes(fill=Year, y=Population, x=Country)) + 
    geom_bar(position="stack", stat="identity")

#PIECHART
cont<-table(data$Continent)
pie(cont)
pie_percent<- round(100 * cont / sum(cont), 1)
pie(cont, labels = pie_percent,main = "Continents distribution", col = rainbow(length(cont)))
legend("topright", c("Africa", "Asia", "Europe", "North America", "Oceania", "South America"),cex = 0.5, fill = rainbow(length(cont)))




