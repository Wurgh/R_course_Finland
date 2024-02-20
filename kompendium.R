getwd()
#MyDirectory <- "C:/Users/Client/Desktop/Ostatn?/Skola/University of Turku/R"
#HomeDirectory <- "C:/Users/tkypt/Desktop/R_intro_course_turku_finland_2022/data1"
setwd(HomeDirectory)
#Reading from specific datafiles


#install.packages("devtools")
#install.packages("ggplot2")
#Some required packages

#!!!!!!!!!!!!!!!
#THE KOMPENDIUM
#!!!!!!!!!!!!!!!

print ("Hello world")
c(1:40)
1:40
#vytiskl jsem, vyvektoroval jsem

c(1:40)
#vektor neulozenej
myVector<-c(1,2,3,4,5,6)
myMatrix<-matrix(c(1,2,3,4),2)

#character vector
myCharacterVector<-c("a","b","c","d")

c("a",2)

#naming vektor
names(myCharacterVector)<-c("letter.1","letter.2","letter.3","letter.4")
myCharacterVector

#pojmenovani matrixu
colnames(myMatrix)<-c("col1","col2")
rownames(myMatrix)<-c("row1","row2")
myMatrix

myVector[1]
myVector[c(1,4)]
myMatrix["row2","col2"]

myMatrix[-2,]
#vymaze druhou radu
myMatrix[-2]
#vymaze dvojku

#Poc?t?me s Tomem
myVector*3
myMatrix*3
myVector/2
myVector^2
sqrt(myMatrix)
#kdyz to c?slo vyn?sob?m samo sebou, tak dostanu svuj v?sledek

mean(myVector)
mean(myMatrix)
#aritmatick? prumer

meanMyMatrix<-mean(myMatrix)
meanMyMatrix
#vytvoril jsem hodnotu t?m, ze jsem j? pripojil k objektu

class(myVector)
class(myCharacterVector)
class(myMatrix)
class(mean)
#tr?dy

vector.OneNA<-c(1,2,NA,4)
#chybej?c? hodnoty
vector.OneNA[2]*2
vector.OneNA[3]*2

sqrt (-1)
vector.OneNA>2

c(1,2,3,NA)
c(1,2,3,NULL)
#NA chyb? / null neexistuje?

names(myCharacterVector)
names(myVector)

#JAK SI R?CT O POMOC
?mean

example(mean)
mean(myVector)
vector.OneNA<-c(1,2,NA,4)
mean(vector.OneNA)

mean(vector.OneNA,na.rm=TRUE)
#r?k?m at ignoruje NA hodnotu, ale nedel?m to permanentne
mean(vector.OneNA)

#pouz?v?m read.csv2 protoze excel rozdeluje c?sla pomoc?
#stredn?ku ; zat?mco read.table je univerz?lnejs?, musel bych to vypsat
read.csv2("myData.csv")
myData<-read.csv2("myData.csv")

#kontrola
myData
summary(myData)
names(myData)
head(myData)
tail(myData)

myDataF<-read.csv2("myData.csv",stringsAsFactors = TRUE)
summary(myDataF)
str(myDataF)
#kontrola

str(myData)
myData$mass
myData$colour
boxplot(myData$mass~myData$colour)
#nev?m co del?m ale udelal jsem graf PYCO

hist(myData$length)
descriptive.stats<-hist(myData$length)
descriptive.stats
#del?m histogram. zjistuju frekvenci d?lky

plot(myData$mass)
plot(myData$mass~myData$length)

save.image("prvnikompendium.RData")
#ukladam
rm(list=ls())
#mazu workspace
load("prvnikompendium.RData")
#loadim workspace

save(myData, file="myData.RData")
load("myData.RData")
#ukladam specifickou polozku workspacu


#Exercise 1 
#a)	Create a suitably named object that is a vector consisting of 10 numbers
#b)	Perform all the basic arithmetic operations with your vector
#c)	Extract the fourth and seventh elements from your vector and store these in an object. What class does this second object have?
#d)	Calculate the mean value of your vector. Make a logical vector stating for each element whether it smaller than the vector's mean value or not. How many values are below the mean?
#e)	Construct a matrix out of your vector
#f)	Extract the values in the second row and the values in the second column of your matrix
#g)	Extract the value of the first row and second column of your matrix
#h)	Turn your matrix of values into a matrix of logicals stating for all values in your matrix whether they are larger than the mean value or not. How many values are below the mean?

#prirazuju objekt>nasobim>delim>odmocnuju>umocnuju 
vektor10<-c(10:19)
vektor10*2
vektor10/2  
sqrt(vektor10)
vektor10^2

#vytvarim objekt z ctvrte a sedme hodnoty vektoru
element47<-vektor10[c(4,7)]
class(element47)
#class: integer (cele cislo)

mean(vektor10)
#aritmeticky prumer je 15
vektor10<mean(vektor10)
#5 values are below, 5 are above

matrix((vektor10),2)
matrix10<-matrix((vektor10),2)
#vytvoril jsem matrix s 10 cisly

matrix10[nrow=2,ncol=2]
matrix10[nrow=1,ncol=2]
#exktraktuju hodnoty z matrixu

matrix10<mean(matrix10)
#5 values are below



#Exercise I.2 
#a)	Get help for the function sum() which we encountered in chapter 1. Review the sections of the help page and run the examples.
#b)	Use sum() to calculate the sum of the vector c(1,2,NA,4)
#c)	Use sum() to calculate the sum of myMatrix's first row and of its first column
#d)	Use the help page to find a related function that allows you to sum rows and columns of a matrix and use it for myMatrix

?sum()
sum(1:5)
sum(1,2,3,4,5)
sum(1:2,3:5)
sum(1:5,NA)
sum(1:5,NA,na.rm=TRUE)
#priklady z helpu

sum(c(1,2,NA,4))
sum(c(1,2,NA,4),na.rm=TRUE)
#pocitam soucet vektoru

myMatrix<-matrix(c(1,2,3,4),2)
sum(myMatrix[nrow=1,ncol=1])
#vytvarim matrix, extraktuju z nej specificke cislo
sum(myMatrix[1,])
sum(myMatrix[,2])
sum(myMatrix[1,],myMatrix[,2])

summary(myMatrix[nrow=1,ncol=1])
colSums(myMatrix)
rowSums(myMatrix)
#dalsi podobna funkce


#Exercise I.3 
#a)	Create and read in the MyData file (sections 3.2 and 3.3)
#b)	Calculate the mean mass and mean length over all individuals
#c)	Use logicals and indexing to calculate the mean mass of blue and of red individuals separately. 
#TIP. approach this problem in steps. First work out how to use logicals to get a vector where the blue individuals are TRUE, then how to use this logical vector and indexing to obtain a vector of mass of blue individuals and lastly to calculate the mean of this vector.

myData<-read.csv2("myData.csv")
mean(myData$mass)
mean(myData$length)
#prumery

#c
myData$colour == "blue"
modra<-myData$colour == "blue"
#vytvoril jsem vektor modr?
myData$mass[c(modra)] 
mean(myData$mass[c(modra)])

myData$colour == "red"
cervena<-myData$colour == "red"
myData$mass[c(cervena)]
mean(myData$mass[c(cervena)])
#to samy jina barva

#Exercise I.4 
#a) Copy-paste the following information to a Notepad file and save it in your working directory. Import the data into R without changing any of the text.
#b) Read the data into R in such a way that habitat is coded as a factor. Investigate the differences in how the variables are interpreted using some of the functions introduced in this part to explore your data.
ctyrka<-read.csv("ex_I_4_copied.txt", stringsAsFactors = TRUE)
str(ctyrka)
summary(ctyrka)
hist(ctyrka$count)
plot(ctyrka$count)
boxplot(ctyrka$count~ctyrka$Habitat)

head(ctyrka)
tail(ctyrka)

#Exercise I.5
#a)	Make two vectors, with one of these containing one or more NA, and plot a histogram of each. What happens to the NA values?
#b)	Plot one of your vectors against the other
#c)	Use the function plot() to plot a "histogram" of one of your vectors (study the help page). What does it do?
vec1<-c(1,2,NA,4,NA,6,7)
vec2<-c(1,2,3,4,5,6,7)
hist(vec1)
hist(vec2)
#NA values get ignored
plot(vec1~vec2)
plot(vec1, vec2)
#NA values from vec1 remove values from vec2
plot(vec1, type ="h")

hist(vec1, breaks = c(0.5,1.5,2.5,3.5,4.5,6.5,7.5))


#SECOND KOMPENDIUM
#!!!!!!!!!!!!!!!!!

x<-c(1,2,3,4)
x*2
#poc?t?me s vektorem

#myData<-read.csv2("myData.csv")
str(myData)
as.factor(c("a","b","c"))
as.factor(c(1,2,3))
#zmena vektoru do faktori?ln?ho vektoru

?levels()
myDataF<-read.csv2("myData.csv",stringsAsFactors = TRUE)
myDataF
as.character(myDataF$colour)
as.numeric(myDataF$colour)
#Cten? faktorov?ho vektoru jako charakterovej, numerickej

matrix(c(1,2,3,4),2,2)
matrix(c(1,2,3,4),2,3)
#error, zacne vyplnovat odznova
matrix(1,2,2)

#matrix vyplnuje odsloupcu, ne po rad?ch
matrix(c(1,2,3,4),2,2, byrow = TRUE)
#matrix vyplnuje odrad

?data.frame()
students<-c("Bill","Miranda")
ages<-c(22,21)
dfl<-data.frame(students,ages)
dfl
#data.frame udrz? c?slice i p?smena
str(dfl)

df2<-data.frame(students,ages,stringsAsFactors=TRUE)
df2
str(df2)
#men?m p?smena ve faktory

dfl[1]
dfl[,1]
dfl[,"students"]
dfl$students
#indexuju data.frame


?rbind
dfl<-rbind(dfl,data.frame(students="Laura",ages=19))
dfl
str(dfl)
#pridal jsem r?dek s Laurou


dfl$ageDiff<-dfl$ages-20
dfl
#prid?v?m pomoc? dolaru

ifelse(myData$colour=="blue","blue","not blue")
#FUNKCE IF, TRUE - MODR?, NOT TRUE - NEN? MODR?
myData$colour == "blue"
#v podstate tohle, akor?t prid? hl?sku nebo cinnost
3==3
3!=3

c(T,T,F,F)
!c(T,T,F,F)

myData$colour.recoded<-ifelse(myData$colour=="blue","blue","not blue")
myData$colour.recoded
#ted jsem z toho vytvoril objekt

ifelse(myData$mass>1.3,myData$mass,NA)
#VSECHNY pod 1.3 maj NA

myData$colour
ifelse(myDataF$colour=="blue","blue","not blue")
class(ifelse(myDataF$colour=="blue","blue","not blue"))
#charakterovej vektor, ne faktorovej vektor

myData[myData$colour=="blue",]
subset(myData,colour=="blue")
#to sam? skrze leps? funkci

subset(myData,colour=="blue",c(individual, mass, length))
#omez?m jen sloupce kter? chci

subset(myData,colour=="blue",individual)
myData[myData$colour=="blue","individual"]
#rozd?l. indexov?n? vrac? jen vektor

subset(myData,colour=="blue",individual, drop=TRUE)
#ted to vrac? vektor

myData[myData$colour=="blue","individual",drop=F]
#ted to vrac? jako subset i data.set (F jako false)

subset(myData,(colour=="blue")&(mass>1.3),c(individual, mass))
#kdyz je modr? AND/A nad 1.3, tak ukaz individual a mass

subset(myData,(colour=="blue")|(mass>1.3),c(individual,colour,mass))
#kdyz je modr? OR/NEBO nad 1.3 ukaz individual, mass, colour

T&T
T&F
c(T,T)&c(T,F)
#testov?n? AND
c(T,T)&&c(T,F)
#porovn? jen prvn? hodnoty

T|T
T|F
F|T|F
xor(T,T)
xor(F,F)
xor(T,F)
#testov?n? OR

mean(myData[,"mass"])
mean(myData$mass[c(myData$colour =="blue")])
#zkouska alternativy
mean(subset(myData,colour=="blue",mass)[,"mass"])
mean(subset(myData,colour=="red",mass)[,"mass"])
#poc?t?m prumer modr? a cerven? hmotnosti

mean(subset(myData,colour=="blue",mass,drop=TRUE))
mean(subset(myData,colour=="red",mass,drop=TRUE))
#vyindexov?no

aggregate(mass~colour,data=myData,FUN=mean)
aggregate(mass~colour,myData,mean)
#zopakuje funkce mean pro vsechny subsety dat
#prvn? je formule tzv.~, druh? je m?sto, tret? funkce

myData$habitat<-c(rep("sunny",5),rep("shady",5))
myData
#prid?v?m do dat habitat 5xslunecno, 5xst?n

aggregate(mass~colour+habitat,myData,mean)
#poc?t?m prumer barev rozdelen?ch podle habitatu

tapply(myData$mass, myData$colour,mean)
tapply(myData[,"mass"],myData$colour,mean)

means.per.colour<-tapply(myData[,"mass"],myData$colour,mean)
class(means.per.colour)
#tapply vytv?r? objekty class array

tapply(myData$mass, list(myData$colour,myData$habitat),mean)
#deskriptivn? statistika

?sd
sd.per.colour<-tapply(myData[,"mass"],myData$colour,sd)
sd.per.colour
#statistika s funkc? odmocnen?

n.per.colour<-tapply(myData[,"mass"],myData$colour,length)
n.per.colour

#EXERCISES 2

#EXERCISE 2.1
#a) Calculate the mean, SD and sample size of length for each colour in myData
#b) Use aggregate() to calculate the means of both mass and length in myData for each colour in one command line
#c) Code the construction of the following data.frame
#and use tapply() to calculate the mean, SD and sample size for each experimental group.

myData<-read.csv2("myData.csv")

tapply(myData$length,myData$colour,mean)
tapply(myData[,"length"],myData$colour,sd)
tapply(myData[,"length"],myData$colour,length)

aggregate(length~colour,myData,mean)
aggregate(mass~colour,myData,mean)
aggregate(cbind(length,mass)~colour,myData,mean)
?aggregate
#koukni na formulu v helpu

trial<-1:10
experiment<-c(rep("control",5),rep("treatment",5))
measure<-c(1,3,4,3,3,4,5,8,8,9)
pokusy<-data.frame(trial,experiment,measure)
#bez objektu: data.frame(trial=1:10,experiment=c(rep..
#vytvarim data.frame

tapply(pokusy$measure,pokusy$experiment,mean)
tapply(pokusy$measure,pokusy$experiment,sd)
tapply(pokusy$measure,pokusy$experiment,length)

#Exercise 2.2
#Exercise II.2 
#Write a script which 
#(a)	imports the datafile "ExperimentalData.txt" which you can find in Moodle
#(b)	Performs some checks the data import was successful
#(c)	Recodes the 4 groups to:
#  group	Feeding.treatment	Parasite.treatment
#1	not fed	removed
#2	not fed	retained
#3	fed	removed
#4	fed	retained
#(d)	Extracts all data where the parasite was removed
#(e)	Extracts data on all individuals which were "not fed" and parasite "retained" as well as "fed" and "removed" (one data.frame)
#(e)	Calculates the mean for "fed" and "not fed" treatment groups 
#(f)	Calculates the variance for all each feeding and parasite treatment using aggregate() 

?read.table
ExperimentalData<-read.csv("ExperimentalData.txt")
ExperimentalData
head(ExperimentalData)
tail(ExperimentalData)
str(ExperimentalData)


feeding.treatment<-c("fed","not fed")
parasite.treatment<-c("removed","retained")
ExperimentalDataRECODED<-data.frame(ExperimentalData,feeding.treatment,parasite.treatment)
#uploaduju nov? r?dky do dat

feeding.treatment<-ifelse(ExperimentalDataRECODED$group == 1 | (ExperimentalDataRECODED$group == 2),"not fed", "fed")
parasite.treatment<-ifelse(ExperimentalDataRECODED$group == 1|(ExperimentalDataRECODED$group == 3),"removed","retained")
#BETTER: ExperimentalDataRECODED$feeding.treatment<-ifelse(ExperimentalData$group==(1|2),"not fed","fed")

#prekodovani
ExperimentalDataRECODED<-data.frame(ExperimentalData,feeding.treatment,parasite.treatment)
#znovu naloadeni preformatovanejch dat

subset(ExperimentalData,parasite.treatment == "removed")
#(d) Extracts all data where the parasite was removed

#asi i takhle
#subset(ExperimentalDataRECODED,((Feeding.treatment=="not fed)&(Parasite.treatment=="retained))|(Feeding.treatment=="fed")&(Parasite.treatment=="removed")))

retnotfed<-data.frame(subset(ExperimentalDataRECODED,parasite.treatment == "retained"&feeding.treatment =="not fed"))
remfed<-data.frame(subset(ExperimentalDataRECODED,parasite.treatment == "removed"&feeding.treatment =="fed"))
parascomb<-rbind(retnotfed,remfed)
#Extracts data on all individuals which were "not fed" and parasite "retained" as well as "fed" and "removed" (one data.frame)

tapply(ExperimentalDataRECODED$size,ExperimentalDataRECODED$feeding.treatment,mean)
#Calculates the mean for "fed" and "not fed" treatment groups 
#NEBO: mean(subset(ExperimentalData, Feeding.treatment=="not fed", size, drop=TRUE))

variance<-aggregate(size~parasite.treatment+feeding.treatment,ExperimentalDataRECODED,var)
#???Calculates the variance for all each feeding and parasite treatment using aggregate()


#Exercise 2.3 
#Use the data in "Fruit_tasting_data_2018.txt" from Moodle
#Create four additional variables (i.e. "columns" in the data.frame holding the data) : score1.apples and score2.apples which hold score1 and score2 respectively only for apples, and score1.strawberies and score2.strawberries which contain score1 and score2 respectively but only for strawberries. 
#a)	Calculate the mean for each of these four variables
#b)	Use subset() to create two datasets. One for apples and one for strawberries, but without any NA values
#c)	Make an object of class numeric containing score1 values for apples
#d)	Make an additional variable containing the name of each fruit tasted in the dataset, but as factors 

ftdata<-read.table("Fruit_tasting_data_2018.txt")

#filling the vectors with N values
score1.apples<-ifelse(ftdata$Fruit == "apple",ftdata$Score1, NA)
score2.apples<-ifelse(ftdata$Fruit == "apple",ftdata$Score2, NA)
score1.strawberries<-ifelse(ftdata$Fruit == "strawberry",ftdata$Score1, NA)
score2.strawberries<-ifelse(ftdata$Fruit == "strawberry",ftdata$Score2, NA)
#sorting the vectors out
newftdata<-data.frame(ftdata,score1.apples,score2.apples,score1.strawberries,score2.strawberries)
#dataframe with new variables sorted out.
tapply(newftdata$score1.apples,newftdata$Fruit,mean, na.rm=T)
tapply(newftdata$score2.apples,newftdata$Fruit,mean, na.rm=T)
tapply(newftdata$score1.strawberries,newftdata$Fruit,mean, na.rm=T)
tapply(newftdata$score2.strawberries,newftdata$Fruit,mean, na.rm=T)
#slo to i nejak takhle: aggregate(cbind(Score1,Score2)~Fruit,data = ftdata, mean)


#Calculate the mean for each of these four variables
jabka<-subset(newftdata, Fruit=="apple", Score1|Score2)
jahody<-subset(newftdata, Fruit=="strawberry", Score1|Score2)
jabkanumericky<-as.numeric(newftdata$score1.apples)
class(jabkanumericky)
#Make an object of class numeric containing score1 values for apples

ffruit<-as.factor(newftdata$Fruit)
ffruitdata<-data.frame(newftdata,ffruit)
class(ffruit)
summary(ffruitdata)
#Make an additional variable containing the name of each fruit tasted in the dataset, but as factors 



#Exercise II.4
#Write a script which
#a)	defines an object that is a matrix with 10 columns containing the numbers 1 to 100
#b)	defines another object that is a matrix with 10 columns  containing the numbers 1 to 100 such that the numbers increment by 1 for each row across the column (i.e. row 1 is 1, 2, 3, etc)
#c)	names the rows and columns of these two objects
#d)	Extracts the third row of each object
#e)	Calculates the mean of each column in each object 

desetsto<-matrix(1:100,10)
desetstorad<-matrix(1:100,10,byrow = TRUE)

rady<-c("rada1","rada2","rada3","rada4","rada5","rada6","rada7","rada8","rada9","rada10")
sloupy<-c("sloup1","sloup2","sloup3","sloup4","sloup5","sloup6","sloup7","sloup8","sloup9","sloup10")
rownames(desetsto)<-rady
colnames(desetsto)<-sloupy
colnames(desetstorad)<-sloupy
rownames(desetstorad)<-rady
#prejmenovavam matrix

desetsto["rada3",]
desetstorad[3,]
#extraktuju 3radu

colMeans(desetsto)
colMeans(desetstorad)
#calculating means of columns

#Exercise II.5
#a)	Create the following data.frame
#Plot	Species	SoilType	CationValue
#P1	Acer	Wet	10
#P2.2	Acer	Wet	12
#P2.3	Quercus	Dry	4
#P3	Quercus	Dry	3
#P10	Acer	Dry	1
#P11	Quercus	Wet	7
#P12	Quercus	Unknown	2
#Use subset() to 
#b)	Make an object containing only information for Quercus
#c)	Make an object containing only information for Quercus in dry soil types
#d)	Make an object containing only information for Quercus in dry and wet soil types
#e)	Make an object containing only information for Quercus in dry and Acer in dry and wet soil types
#f)	Make an object containing only the soil type and cation values for Acer
#g)	Make a vector of cation values for dry soil type

?data.frame
CationValue<-c(10,12,4,3,1,7,2)
SoilType<-c("Wet","Wet","Dry","Dry","Dry","Wet","Unknown")
Species<-c("Acer","Acer","Quercus","Quercus","Acer","Quercus","Quercus")
Plot<-c("P1","P2.2","P2.3","P3","P10","P11","P12")
stromy<-data.frame(Plot,Species, SoilType,CationValue)
#vytvoril jsem dataframe stromy


#TAKY: Quercus<-subset(stromy,Species=="Quercus")
Quercus<-subset(stromy,Species=="Quercus",c(Plot,SoilType,CationValue))
QuercusDRY<-subset(stromy,Species=="Quercus"&SoilType=="Dry",c(Plot,SoilType,CationValue))
QuercusDRYWET<-subset(stromy,Species=="Quercus"&SoilType=="Dry"|SoilType=="Wet",c(Plot,SoilType,CationValue))
#taky muzu subset(stromy, Species=="Quercus"&SoilType!="Unknown",c(Plot, SoilType,CationValue))
QuercusDRYacerDRYWET<-subset(stromy,c(Species=="Quercus"&SoilType=="Dry")|c(Species=="Acer"&SoilType=="Dry")|c(Species=="Acer"&SoilType=="Wet"),c(Plot,Species,SoilType,CationValue))
AcerSOILCAT<-subset(stromy,Species=="Acer",c(SoilType,CationValue))
#vytvoril jsem subsety na zaklade instrukci
stromy[SoilType=="Dry","CationValue"]
subset(stromy,SoilType=="Dry",CationValue,drop=T)
#a vector of cation values for dry soil types




#!!!!!!!!!!!!!!!!!!!!!
#The Kompendium III
#!!!!!!!!!!!!!!!!!!!!!
windows(10,10)
#SUPERDULEZIT? PR?KAZ ABYCH MOHL VYKRESLOVAT!!!

barplot(means.per.colour)
barplot(means.per.colour, xlab=list("Colour", cex=1.5), ylab = list("Mass(g)",cex=1.5),cex.names=1.2,cex=1.2)
list("Colour", cex=1.5)
#vytvarim barploty barevne, object not found?
barplotx <- barplot(means.per.colour, xlab=list("Colour", cex=1.5), ylab = list("Mass(g)",cex=1.5),cex.names=1.2,cex=1.2)
barplotx <- barplot(means.per.colour,xlab=list("Colour",cex=1.5), ylab = list("Mass (g)",cex=1.5),cex.names=1.2,cex=1.2,ylim=c(0,2),col=c("lightblue","red"))
barplotx
segments( barplotx ,means.per.colour-sd.per.colour,barplotx,means.per.colour+sd.per.colour,lwd=2)
text(barplotx,0.1,n.per.colour)
#udelal jsem barploty bareploty se statistickou chybou a poctem

myData$colourF<-as.factor(myData$colour)
levels(myData$colourF)
#prid?v?m sloupec do myData, kterej je jako colour ale faktorovej
myData$colourF
as.numeric(myData$colourF)

c1<-c("lightblue","red")
c1[myData$colourF]  
#zjistil jsem jak? barva pouz?v? jak? c?slo, udelal jsem na z?klade toho vektor a barvama

plot(myData$mass~myData$length,col=c1[myData$colourF],pch=19,cex=1.3,xlab=list("Length",cex=1.5),ylab=list("Mass",cex=1.5))
?par()
par(cex=1.5,pch=19,bg="pink",col="blue",bty="n")
plot(myData$mass~myData$length)
#plotuju

windows(10,10)
#vytvarim si okynko do kteryho plotuju

pdf(file="Fig8_3.pdf", paper="a4")
plot(myData$mass~myData$length,col=c1[myData$colour],pch=19,cex=1.3,xlab=list("Length",cex=1.5),ylab=list("Mass",cex=1.5))
dev.off()
#vytvarim pdfko, umistuju do nej ploty, vypinam spojeni s pdfkem

Zstand<-function(x){
  mean.x<-mean(x)
  sd.x<-sd(x)
  z.x<-(x-mean.x)/sd.x
  return(z.x) #writing return is needed if an object is defined
}

Zstand(c(1,2,3,4))
z.x<-Zstand(c(1,2,3,4))

Zstand<-function(x){
  z.x<-(x-mean(x))/sd(x)
  return(z.x)
} #krats? n?hrada by byla

Zstand<-function(x){
  z.x<-(x-mean(x))/sd(x)
}#jeste krats?

minusValue<-function(x,myMinusValue=1){
  minus.x<-x-myMinusValue
  return(minus.x)
}

minusValue(2)
minusValue(2,2)

minusValue<-function(x,myMinusValue=1){
  x-myMinusValue
}#krats?

vec<-c(1,2,2,3,3,4,4,5,5,6,7,7,8,8,9,10)
unique(vec)

vec.s<-c("a","b","c","b","a","c")
unique(vec.s)
#kouk?m kolik jak? jsou unik?ty ve veci
length(vec)
length(unique(vec))
#kouk?m kolik je unik?tu ve veci

length(c(1,2,3))
length(c(1,NA,3))
#poc?taj? se i NA
length(na.omit(c(1,NA,3)))
#bez NA hodnot

complete.cases(c(1,NA,3))
sum(complete.cases(c(1,NA,3)))
#druhej zpusob
!is.na(c(1,NA,3))
sum(!is.na(c(1,NA,3)))
#tret? zpusob

is.na(c(1,NA,3))

sampleSize<-function(x){
  sum(complete.cases(x))
}#our own function to sample size of any vector whether it holds NA or not

sampleSize(c(1,2,NA,4))

df.withNA<-data.frame(Trial=1:10,Experiment=c(rep("control",5),rep("treatment",5)),Measure=c(1,3,4,NA,3,4,5,NA,8,9))
df.withNA
#vytvarim dataframe s NA
tapply(df.withNA$Measure,df.withNA$Experiment,sampleSize)
#zjistuju samplesize pomoci sampleSize
tapply(df.withNA$Measure,df.withNA$Experiment,length)
#zjistuju pomoci length - je chybnej
aggregate(Measure~Experiment,data=df.withNA,sampleSize)
#pomoci aggregate, spravnej
aggregate(Measure~Experiment,data=df.withNA,length)
#pomoci aggregate s length, spravnej
#with the formula method, aggregate() will by default have the argument na.action=na.omit
aggregate(df.withNA$Measure,list(df.withNA$Experiment),length)
#other methods will not strip NA values

tapply(df.withNA$Measure,df.withNA$Experiment,function(x) sum(complete.cases(x)))
#anonymous function with no brackets
tapply(df.withNA$Measure,df.withNA$Experiment,function(x) length(na.omit(x)))
#taky

descriptiveStats.df.withNA<-aggregate(Measure~Experiment,data=df.withNA,mean)
descriptiveStats.df.withNA

str(descriptiveStats.df.withNA)
descriptiveStats.df.withNA<-data.frame(descriptiveStats.df.withNA,n=aggregate(Measure~Experiment,data=df.withNA,length)$Measure)
#prid?v?m r?dek n(samplesize) pomoc? aggregatu

descriptiveStats.df.withNA<-data.frame(descriptiveStats.df.withNA,sd=aggregate(Measure~Experiment,data=df.withNA,sd)[,2])
#prid?v?m r?dek sd(prumer)
names(descriptiveStats.df.withNA)[2]<-"mean"
#prejmenov?v?m r?dek measure na mean

descriptiveStats.df.withNA.multi<-aggregate(Measure~Experiment, data=df.withNA,function(x)c(mean(x),length(x),sd(x)))
str(descriptiveStats.df.withNA.multi)
descriptiveStats.df.withNA.multi
#muzeme vytvorit statistiku i takhle

write.table(descriptiveStats.df.withNA,"DescriptiveStats.txt")
#vytvor?me z statistiky txt dokument
write.table(format(descriptiveStats.df.withNA,digits=3),"DescriptiveStats.txt",quote=F,row.names=F,sep=";")
#to sam? ale upravujeme s min destinima cislama

#EXERCISES III
#Exercise III.1
#Use the data in "Fruit_tasting_data_2018.txt" from Moodle
#a) Pimp your plot, step by step (one line of code for each addition; remember that you can copy-paste your line of code and then add the next step to it)
#.	Plot "score 2" as a function of "score 1" 
#.	Rename the axes
#.	Change the symbol plotted
#.	Increase point size of the symbol plotted
#.	Increase font size for the axes
#.	Change the y axis so that the minimum value is 0 and the maximum is 10
#.	Change the color of the points so that they are different for apples and for strawberries
#.	Add a text on top of the figure
#.	Add a legend
#b. You obtain the extra scores 2.2 and 4 for the apple Gyllenkroks Astrakan. Add this to the data object in R. Redraw the plot 
#c. Code the exporting of the final plot as a PDF. Also export the plot as a PDF using the R Studio "Export" option. Are these two options producing the same outcome?

ftdata<-read.table("Fruit_tasting_data_2018.txt")
plot(ftdata$Score1~ftdata$Score2)
plot(ftdata$Score1~ftdata$Score2,xlab="Score2",ylab="Score1")
plot(ftdata$Score1~ftdata$Score2,xlab="Score2",ylab="Score1",pch=11)
plot(ftdata$Score1~ftdata$Score2,xlab="Score2",ylab="Score1",pch=11,cex=0.7)
plot(ftdata$Score1~ftdata$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7)
plot(ftdata$Score1~ftdata$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7,ylim=c(0,10))
#vsechny kroky az do barev
ftdata$Fruit<-as.factor(ftdata$Fruit)
barvy1<-c("green2","red3")
plot(ftdata$Score1~ftdata$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7,ylim=c(0,10),col=barvy1[ftdata$Fruit])
#prebarvil jsem body
plot(ftdata$Score1~ftdata$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7,ylim=c(0,10),col=barvy1[ftdata$Fruit],main="X-Y plot of two scores given to apples and strawberries")
legend(x = "topright",pch=11,cex=1, col = c("red3","green2"), legend=unique(ftdata$Fruit))
#plot is finished
ftdatagyl<-rbind(ftdata,data.frame(Variety="Gyllenkroks Astrakan", Fruit="apple",Score1=2.2,Score2=4))
plot(ftdatagyl$Score1~ftdatagyl$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7,ylim=c(0,10),col=barvy1[ftdatagyl$Fruit],main="X-Y plot of two scores given to apples and strawberries")
legend(x = "topright",pch=11,cex=1, col = c("red3","green2"), legend=unique(ftdata$Fruit))
#redrawing the plot
pdf(file="ExportCODEFruit.pdf",paper="a4")
plot(ftdatagyl$Score1~ftdatagyl$Score2,xlab=list("Score2",cex=1.5),ylab=list("Score1",cex=1.5),pch=11,cex=0.7,ylim=c(0,10),col=barvy1[ftdatagyl$Fruit],main="X-Y plot of two scores given to apples and strawberries")
legend(x = "topright",pch=11,cex=1, col = c("red3","green2"), legend=unique(ftdata$Fruit))
dev.off()
#exportovano skrz R

#Exercise III.2
#Use the data in "Fruit_tasting_data_2018.txt" from Moodle 
#(a)	Calculate the mean and 95% quantile interval for score1 and score2 for apples and strawberries. The 95% quantile interval consists of 2 values. A lower and upper value. The 95% quantiles means that 95% of the data lies between these two values. The function quantile() is useful here (think carefully about which values to use as probability prob argument for this function). 
#(b)	Create a barplot of the mean score1 for apples and strawberries with a line indicating the 95% quantiles (i.e. the line goes from the lower value to the upper value, TIP: read carefully section 8.1 for this exercise). Make the plot look as good as you can.
#(c)	Use par() to plot two panels in one graph and make a 2-panel plot showing the average score1 and score2 of apples and strawberries with their 95% quantile interval respectively. That is, one panel with a barplot of score1 and score2 of apples and the second panel showing barplot of score1 and score2 of strawberries. Something like this:

ftdata<-read.table("Fruit_tasting_data_2018.txt")
#loaded up
means.per.fruit<-aggregate(cbind(Score1,Score2)~Fruit,data = ftdata, mean)
meanscore1<-means.per.fruit[,2]
meanapple<-(means.per.fruit[1,])[,-1]
meanstraw<-(means.per.fruit[2,])[,-1]
#means only numbers

subapp<-subset(ftdata,Fruit=="apple")
substraw<-subset(ftdata,Fruit=="strawberry")
kvantilapp1<-quantile(subapp$Score1,probs=c(0.025,0.975))
kvantilstraw1<-quantile(substraw$Score1,probs=c(0.025,0.975))
kvantilapp2<-quantile(subapp$Score2,probs=c(0.025,0.975))
kvantilstraw2<-quantile(substraw$Score2,probs=c(0.025,0.975))

#vytvoril jsem kvantil
kvantilapp1
windows(10,10)
barscore1<-barplot(meanscore1,col=c("green4","red4"),density=c(30,40),xlab=list("Fruit",cex=1.5),ylab=list("Scores",cex=1.5),ylim=c(0,10))
text(barscore1,0.5,means.per.fruit$Fruit)
segments(x0=0.7,y0=kvantilapp1[1],x1=0.7,y1=kvantilapp1[2],lwd=2)
barscore1
segments(x0=1.9,y0=kvantilstraw1[1],x1=1.9,y1=kvantilstraw1[2],lwd=2)
#mean Score 1s with their quantile segments

par(mfrow = c(1,2))
barapp<-barplot(as.numeric(meanapple),col=c("green4","lightgoldenrod2"),density=c(30,35),xlab=list("Apples",cex=1.5),ylab=list("Score",cex=1.5),ylim=c(0,7),names.arg = c('First','Second'),main = '(a)')
segments(x0=0.7,y0=kvantilapp1[1],x1=0.7,y1=kvantilapp1[2],lwd=2)
segments(x0=1.9,y0=kvantilapp2[1],x1=1.9,y1=kvantilapp2[2],lwd=2)
#apple barplot
barstraw<-barplot(as.numeric(meanstraw),col=c("red2","red4"),density=c(30,35),xlab=list("Strawberries",cex=1.5),ylab=list("Score",cex=1.5),ylim=c(0,7), names.arg = c('First','Second'),main = '(b)')
#segments(x0=0.7,y0=kvantilstraw1[1],x1=0.7,y1=kvantilstraw1[2],lwd=2)
#segments(x0=1.9,y0=kvantilstraw2[1],x1=1.9,y1=kvantilstraw2[2],lwd=2)
segments(x0=barstraw,y0=c(kvantilstraw1[1],kvantilstraw2[1]),x1=barstraw,y1=c(kvantilstraw1[2],kvantilstraw2[2]))
#strawberries barplot



#Exercise III.3
#You learn from Wikipedia (https://en.wikipedia.org/wiki/Standard_error) that the standard error is defined as the standard deviation divided by the square root of the sample size. 
calc.SE<-function(x) {sd(x)/sqrt(length(x))}
#TAKY?: function (x,na.rm=F){if(na.rm==TRUE){y<-na.omit(x) se<-sd(z)/length(y)}else{se<-sd(x)/sqrt(length(x))}return(se)}
calc.SE(1:10)
calc.SE(c(1:10,NA))
calc.SE(c(1:10,NA), na.rm=TRUE)
#function to calc Standard Error
df.year<-data.frame(Year=c(rep(1,5),rep(2,5)), Response=c(4.256898,  7.103097,  5.345175,  3.259264,  4.327387,  9.995211, 8.621862, 10.499859,10.032349,  8.821877))
aggregate(Response~Year,df.year,sd)
aggregate(Response~Year,df.year,mean)
aggregate(Response~Year,df.year,calc.SE)
tapply(df.year$Response,df.year$Year,sd)
tapply(df.year$Response,df.year$Year,mean)
tapply(df.year$Response,df.year$Year,calc.SE)
#b)Calculate the sample size, mean and SE of Response in both years in using both aggregate and tapply. 

df.year<-rbind(df.year, data.frame(Year=c(rep(1,2),rep(2,2)), Response=c(4.33,  NA,  10.1,  NA))) 
aggregate(Response~Year,df.year,sd)
extrojka1<-aggregate(Response~Year,df.year,length)
extrojka2<-aggregate(Response~Year,df.year,mean)
extrojka3<-aggregate(Response~Year,df.year,calc.SE)

tapply(df.year$Response,df.year$Year,function(x) sum(complete.cases(x)))
tapply(df.year$Response,df.year$Year,sd,na.rm = TRUE)
tapply(df.year$Response,df.year$Year,mean,na.rm = TRUE)
tapply(df.year$Response,df.year$Year,calc.SE,na.rm = TRUE)

extrojka.df<-data.frame(Year=unique(df.year$Year),n=extrojka1[,2],mean=round(extrojka2[,2],2),SE=round(extrojka3[,2],2))
write.table(extrojka.df, "extrojka.doc", quote=F, row.names = F, sep=";")

#Exercise III.4
ExperimentalData<-read.csv("ExperimentalData.txt")
feeding.treatment<-c("fed","not fed")
parasite.treatment<-c("removed","retained")
ExperimentalDataRECODED<-data.frame(ExperimentalData,feeding.treatment,parasite.treatment)
ExperimentalDataRECODED$feeding.treatment<-ifelse(ExperimentalData$group==1|(ExperimentalDataRECODED$group == 2),"not fed","fed")
ExperimentalDataRECODED$parasite.treatment<-ifelse(ExperimentalData$group==1|(ExperimentalDataRECODED$group == 3),"removed","retained")
#pripravuju experimentaldata
means.exp<-aggregate(size~group,data = ExperimentalDataRECODED, mean)

subremfed<-subset(ExperimentalDataRECODED,parasite.treatment == "removed"&feeding.treatment =="fed",na.rm=T)
subremnfed<-subset(ExperimentalDataRECODED,parasite.treatment == "removed"&feeding.treatment =="not fed",na.rm=T)
subretfed<-subset(ExperimentalDataRECODED,parasite.treatment == "retained"&feeding.treatment =="fed",na.rm=T)
subretnfed<-subset(ExperimentalDataRECODED,parasite.treatment == "retained"&feeding.treatment =="not fed",na.rm=T)
#pripravuju objekty
kvansubremfed<-quantile(subremfed$size,probs=c(0.025,0.975),na.rm = T)
kvansubremnfed<-quantile(subremnfed$size,probs=c(0.025,0.975),na.rm=T)
kvansubretfed<-quantile(subretfed$size,probs=c(0.025,0.975),na.rm = TRUE)
kvansubretnfed<-quantile(subretnfed$size,probs=c(0.025,0.975),na.rm=T)
#pripravuju kvantily
#TAKY: QuantLow<-tapply(ExperimentalDataRECODED,list(ExperimentalDataRECODED$Feeding.treatment,ExprerimentalData$Parasite.treatment),quantile,p=0.975)
#TAKY: QuantHigh......p=0.025)
barexp<-barplot(as.numeric(means.exp[,2]),xlab=list("Parasitic treatment",cex=1.5),ylab=list("Size",cex=1.5),ylim=c(0,20),col=c("grey65","grey60","grey55","grey50"),names.arg=c('removed','retained','removed','retained'))
text(barexp,0.5,c("not fed","not fed","fed","fed"))
#baruju
arrows(x0=0.7,y0=kvansubremnfed[1],x1=0.7,y1=kvansubremnfed[2],lwd=2,code=3,angle=90)
arrows(x0=1.9,y0=kvansubretnfed[1],x1=1.9,y1=kvansubretnfed[2],lwd=2,code=3,angle=90)
arrows(x0=3.1,y0=kvansubremfed[1],x1=3.1,y1=kvansubremfed[2],lwd=2,code=3,angle=90)
arrows(x0=4.3,y0=kvansubretfed[1],x1=4.3,y1=kvansubretfed[2],lwd=2,code=3,angle=90)
#sipky

#Exercise III.5
#(a)	Use one line of code with aggregate()to compute how many different blocks there were per experiment group. The correct answer is not 5 per group.
#(b)	Code the construction of a single data.frame that holds the descriptive statistics sample size, mean and standard deviation for "Measure" for each of the four possible combinations of "Experiment" and "block". The code should add each descriptive statistic one at a time.
#(c)	Code the construction of a single data.frame with the descriptive statistics sample size, mean and standard deviation for "Measure2" for each of the four possible combinations of "Experiment" and "block". The code should add each descriptive statistic one at a time.
#(d)	Code the construction of a single data.frame with the descriptive statistics sample size, mean and standard deviation for "Measure" and "Measure2". The code can add each descriptive statistic one at a time, but has to use a single call to aggregate() to calculate each statistic for each of the four possible combinations of "Experiment" and "block". Alternatively, you can code all in one line.
#(e)	Are there differences between what you get in a,b,c,d? If so, why is this? 	

df.withNA<-data.frame(Trial=1:10, Experiment=c(rep("control",5),rep("treatment",5)),Measure=c(1,3,4,NA,3,4,5,NA,8,9))
df.withNA<-data.frame(df.withNA,Measure2=c(2,3,2,3,4,5,4,5,6,6),block=rep(c("B1","B2"),5))
aggregate(df.withNA,block~Experiment,function (df.withNA) length(unique(df.withNA)))
#adding dataframe, how many blocks per experiment

descriptiveStats.df.withNA<-aggregate(Measure~Experiment+block,df.withNA,mean)
names(descriptiveStats.df.withNA)[3]<-'mean'
descriptiveStats.df.withNA<-data.frame(descriptiveStats.df.withNA, n=aggregate(Measure~Experiment+block,df.withNA,length)$Measure)
descriptiveStats.df.withNA<-data.frame(descriptiveStats.df.withNA, sd=aggregate(Measure~Experiment+block,df.withNA,sd)$Measure)
#b


descriptiveStats2.df.withNA<-aggregate(Measure2~Experiment+block,df.withNA,mean)
names(descriptiveStats2.df.withNA)[3]<-'mean'
descriptiveStats2.df.withNA<-data.frame(descriptiveStats2.df.withNA, n=aggregate(Measure2~Experiment+block,df.withNA,length)$Measure2)
descriptiveStats2.df.withNA<-data.frame(descriptiveStats2.df.withNA, sd=aggregate(Measure2~Experiment+block,df.withNA,sd)$Measure2)
#c


#descriptiveStats_comp<-aggregate(cbind(Measure,Measure2), function (x) c=mean(x),n=length(c))
#funkce1 <- function (x) {
#  m=mean(x)
#  n=length(x)
#  d=sd(x)}
#descriptiveStats_comp<-aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,funkce1)
#tried in one line: DOESNT WORK
descriptiveStats_comp<-aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,mean)
names(descriptiveStats_comp)[3]<-"mean1"
names(descriptiveStats_comp)[4]<-"mean2"
descriptiveStats_comp<-data.frame(descriptiveStats_comp, n1 = aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,length)$Measure)
descriptiveStats_comp<-data.frame(descriptiveStats_comp, n2 = aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,length)$Measure)
descriptiveStats_comp<-data.frame(descriptiveStats_comp, sd1 = aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,sd)$Measure1)
descriptiveStats_comp<-data.frame(descriptiveStats_comp, sd2 = aggregate(cbind(Measure,Measure2)~Experiment+block,df.withNA,sd)$Measure2)
#multiple lines
#d 


#KOMPENDIUM IV
d1<-data.frame(students=c("Jukka","Harald","Sven","Bitte"),nationality=c("F","N","S","D"))
d2<-data.frame(ages=c(22,22,41,25),students=c("Harald","Jukka","Sven","Bitte"))

merge(d1,d2)
#merge the dataframe

d3<-data.frame(ages=c(22,22,41,25),studs=c("Harald","Jukka","Sven","Bitte"))
merge(d1,d3, by.x="students",by.y="studs")
#merging different column names

d2.b<-rbind(d2,data.frame(ages=21,students="Harald"))
merge(d1,d2.b)
#merging different Haralds, nationality get assumed
#Haralds are in both datasets

d3.b<-d3[1:3,]
d3.b
merge(d1,d3.b,by.x="students",by.y="studs")
#merging Bitte, Bitte is mising in one dataset
#Bitte is therefore missing in merged dataset 

merge(d1,d3.b,by.x="students",by.y="studs",all.x=T)
#after all.x Bitte shows NA for her age instead

#we can check with dim(), nrow(), length() - number of columns

#Exercises IV
#Exercise I
census<-read.csv2("CensusData.txt",dec=".")
meadows<-read.csv2("MeadowsData.txt",dec=".")
visits<-read.csv2("VisitsData.txt",dec=".")
#vypoc?tat nejdr?v mean pro kazdou n?vstevu

meadows.visits<-merge(meadows,visits)
#merging for plot

meadows.temp<-aggregate(meadows.visits$Temperature~meadows.visits$Meadow.ID,meadows.visits,mean)
meadows.slope<-data.frame(unique(meadows.visits$Slope),unique(meadows.visits$Meadow.ID))
#calculating means of temp and seperating it with slope
#NEBO: aggregate(cbind(Temperature,Slope)~meadows.visits$Meadow.ID,meadows.visits,mean)
temp.slope<-merge(meadows.slope,meadows.temp,by.x="unique.meadows.visits.Meadow.ID.",by.y="meadows.visits$Meadow.ID")
names(temp.slope)<-c("Meadow.ID","Slope","MeanTemperature")
#merging slope and meantemp to make plot

plot(MeanTemperature~Slope,temp.slope,col="red",main="Temperature on slopes in visited meadows",ylab=list("Temperature",cex=1.5),xlab=list("Slope",cex=1.5),pch=20,cex=1.5,tck=0.02)
#v kompendiu asi prohozen?


#Exercise II
census<-read.csv2("CensusData.txt",dec=".")
meadows<-read.csv2("MeadowsData.txt",dec=".")
visits<-read.csv2("VisitsData.txt",dec=".")

meadows.visits<-merge(meadows,visits)
mvc.all<-merge(meadows.visits,census)

n.unique <- function(x){length(unique(x))}
#making function to count how many unique values there are in a column
occ.sq.per.data.n.visit<-aggregate(Square~Meadow.ID+Visit.ID,mvc.all,n.unique)

hist(occ.sq.per.data.n.visit$Square,col="white",xlab="squares per meadow visited",main="")
#a
meantemp.mead<-aggregate(meadows.visits$Temperature~meadows.visits$Meadow.ID,meadows.visits,mean)
#calculating mean temperature of meadows
colnames(meantemp.mead)=c("Meadow.ID","MeanTemperature")
div<-function(x){
  m<-x/30
  return(m)}
propSq<-c(sapply(occ.sq.per.data.n.visit$Square, div))
mead.prop<-data.frame(visits,propSq)

mean.mead.prop<-aggregate(mead.prop$propSq~mead.prop$Meadow.ID,mead.prop,mean)
colnames(mean.mead.prop)=c("Meadow.ID","Proportion")
mean.mead.prop<-merge(mean.mead.prop,meantemp.mead,by="Meadow.ID")
plot(mean.mead.prop$Proportion~mean.mead.prop$MeanTemperature, xlab=list("Mean Temperature",cex=1.5),ylab="proportion non-empty squares", pch=16,xgap.axis=8)
#b

#Exercise III
census<-read.csv2("CensusData.txt",dec=".")
meadows<-read.csv2("MeadowsData.txt",dec=".")
visitsNA<-read.csv2("VisitsDataWithNA.txt",dec=".")

meadows.visitsNA<-merge(meadows,visitsNA)
meadows.tempLEN<-aggregate(meadows.visitsNA$Temperature~meadows.visitsNA$Openness,meadows.visitsNA,length)
meadows.temp<-aggregate(meadows.visitsNA$Temperature~meadows.visitsNA$Openness,meadows.visitsNA,mean)
#a)	Calculate the average temperature per open and closed meadow and the sample size used to calculate this average

meadows.visitsNA$TemperatureFILL<-meadows.visitsNA$Temperature
meadows.visitsNA$TemperatureFILL[is.na(meadows.visitsNA$TemperatureFILL)] <- mean(meadows.visitsNA$TemperatureFILL, na.rm = TRUE)
FILLmeadows.tempLEN<-aggregate(meadows.visitsNA$TemperatureFILL~meadows.visitsNA$Openness,meadows.visitsNA,length)
FILLmeadows.temp<-aggregate(meadows.visitsNA$TemperatureFILL~meadows.visitsNA$Openness,meadows.visitsNA,mean)
#making new column, filling NA values with mean, counting closed/open mean and sample size again
#NEBO: ifelse(is.na(meadows.visits$Temperature),(meanvalue of temperatures),meadows.visits$Temperature)

observer.visit<-aggregate(meadows.visitsNA$Visit.ID~meadows.visitsNA$Observer,meadows.visitsNA,length)
sum.na<-function (x) {sum(is.na(x))}
observer.miss<-aggregate(meadows.visitsNA$Temperature~meadows.visitsNA$Observer,meadows.visitsNA,sum.na,na.action = na.pass)
#b
observers.eff<-merge(observer.visit,observer.miss)
names(observers.eff)<-c("Who","Nvisits","Nmissed")
observers.eff$Propmissed<-observers.eff[,"Nmissed"]/observers.eff[,"Nvisits"]
#c

ID.meadows.tempLEN<-aggregate(meadows.visitsNA$Temperature~meadows.visitsNA$Meadow.ID,meadows.visitsNA,length)
NA.meadows<-aggregate(meadows.visitsNA$Temperature~meadows.visitsNA$Meadow.ID,meadows.visitsNA,sum.na,na.action = na.pass)
colnames(NA.meadows)[2]<-"TempMiss"
LEN.meadows.temp<-merge(NA.meadows,ID.meadows.tempLEN)
names(LEN.meadows.temp)<-c("Meadow.ID","MissedTemparature","MeasuredTemperature")
#how many times were temps measured
LEN.meadows.temp$Propmissed<-LEN.meadows.temp[,2]/3
#making proportion of missed temps

hist(LEN.meadows.temp$Propmissed,xlab="proportion missing",axes=T,main=" ",col="white",breaks=c(-0.1,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9))
#axis(side=1,at=seq(0.0,0.8,by=0.2))
#axis(side=1,round(LEN.meadows.temp$Propmissed,2))
#AXIS to further customize it

#Exercise IV
meadowpaper<-read.table(file="pieceofpaper.txt", header = TRUE,dec = ".")
meadows<-read.csv2("MeadowsData.txt",dec=".")

newMeadowData<-merge(meadows,meadowpaper,by.x="Meadow.ID",by.y = "Mdw")
newMeadowData<-data.frame(newMeadowData,ifelse(newMeadowData$Closed.=="no"|(newMeadowData$Closed.=="No"),"Open","Closed"))
colnames(newMeadowData)[8] <-"Opennes20"

#NEBO JEDNODUSE: open.mead<-aggregate(Meadow.ID~Openness+Opennes20,newMeadowData,length)

meadow.entrance<-data.frame(newMeadowData$Meadow.ID,newMeadowData$Openness,newMeadowData$Opennes20)
names(meadow.entrance)<-c("Meadow.ID","Opennes","Opennes20")
#mus?m rozdelit na skupiny 

cc<-subset(meadow.entrance,Opennes == "Closed"&Opennes20 =="Closed")
co<-subset(meadow.entrance,Opennes == "Closed"&Opennes20 =="Open")
oc<-subset(meadow.entrance,Opennes == "Open"&Opennes20 =="Closed")
oo<-subset(meadow.entrance,Opennes == "Open"&Opennes20 =="Open")
#subseting combinations

sum(table(cc))
sum(table(co))
sum(table(oc))
sum(table(oo))
#counting how many of each combination is there

open.sums<-c(sum(table(cc)),sum(table(co)),sum(table(oc)),sum(table(oo)))
open.states<-c("Closed-Closed","Closed-Open","Open-Closed","Open-Open")
change.opennes<-data.frame(open.sums,open.states)

barplot(change.opennes[,1],names.arg=change.opennes[,2],xlab="Change in opennes (old-new)",ylab="Number",col=c("grey60","grey60","grey15","grey15"))


#Exercise V
alldata.ind<-read.csv2("AllDataIndividuals.txt",dec=".")
motherdata<-read.csv2("MotherData.txt",dec=".")

mother.mass<-merge(motherdata,alldata.ind,by.x="mother",by.y="individual")
mother.mass<-data.frame(mother.mass$mother,mother.mass$brood.x,mother.mass$body.mass)
names(mother.mass)<-c("mother","OGbrood","mothermass")
#seperating mother mass
mean.alldata.ind<-aggregate(alldata.ind$body.mass~alldata.ind$brood,alldata.ind,mean)
names(mean.alldata.ind)<-c("brood","broodmeanmass")
#mean of broods
broodmean.mothers<-merge(mother.mass,mean.alldata.ind,by.x="OGbrood",by.y="brood")
#merging mean of brood with mothers and their mean
plot(broodmeanmass~mothermass,broodmean.mothers)

#KOMPENDIUM V

dat$v1<-1

dat=data.frame()
dat<- rbind(dat, data.frame(number=c(1,2,3),name=c("Bob","Bob","Harriet")))
dat<- rbind(dat,data.frame(number = c(4,5,6),name=c("Jim","Alice","Bob")))

myList<-list(
  myVec=c(1,2,3)
  , myMat=matrix(c(1,2,3,4),2,2)
  , myDf=data.frame(students=c("Bill","Miranda","Laura"),ages=c(22,21,19)))
myList
str(myList)
myList$myMat
myList[["myMat"]]
myList[[2]]

#empty list
dat2=list(number=NULL, name=NULL)
dat2

#and add
dat2$number=c(1,2,3)
dat2$name=c("Bob","Bob","Harriet")
dat2

#and expand
dat2$number=c(dat2$number,c(4,5,6))
dat2$name=c(dat2$name,c("Jim","Alice","Bob"))
dat2


#make into data.frame
dat2<- data.frame(dat2)
dat2

dat.sites=data.frame(site=c("A1","A1","A2","A2","A2"),x=c(2,3,3,4,3),y=c(1,12,3,8,9))
dat.sites

sites<-c("A1","A2")
sites


MySubset<-subset(dat.sites,site==sites[1])
MySubset
mean(MySubset$x)
mean(MySubset$y)
data.frame(site=sites[1],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y))
#for A1
MySubset<-subset(dat.sites,site==sites[2])
MySubset
mean(MySubset$x)
mean(MySubset$y)
data.frame(site=sites[2],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y))
#for A2

for (i in 1:2){
  i=1
  MySubset<-subset(dat.sites,site==sites[i])
  data.frame(site=sites[i],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y))
  #first round of loop
  i=2
  MySubset<-subset(dat.sites,site==sites[i])
  data.frame(site=sites[i],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y))
}

for (i in 1:2){ sites.means=data.frame()
#empty dataframe to fill
i=1
MySubset<-subset(dat.sites,site==sites[i])
sites.means<-rbind(sites.means,data.frame(site=sites[i],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y)))
#first round of loop
i=2
MySubset<-subset(dat.sites,site==sites[i])
sites.means<-rbind(sites.means,data.frame(site=sites[i],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y)))
sites.mean
}

sites<-unique(dat.sites$site)
#creating vector based on values in dat.sites
sites.means=data.frame()
#creating empty dataframe
for (i in 1:length (sites)) {
  MySubset<-subset(dat.sites,site==sites[i])
  sites.means<-rbind(sites.means,data.frame(site=sites[i],mean.x=mean(MySubset$x),mean.y=mean(MySubset$y)))
}
sites.means

sites.means=data.frame()
for (s in sites) {
  MySubset<-subset(dat.sites,site==s)
  sites.means<-rbind(sites.means, data.frame(site=s, mean.x=mean(MySubset$x), mean.y=mean(MySubset$y)))
} #using vector directly
sites.means

layout(matrix(c(1,2),1,2))
for(s in unique(dat.sites$site)){
  plot(y~x,data=subset(dat.sites,site==s),ylim=c(0,15),xlim=c(0,15),main=paste("site",s))
}

dat  
unique.names<-unique(dat$name)
unique.names
index=which(dat$name==unique.names[1])
index
min(dat$number[index])
#the minimum value in dat$number belonging to unique name

minimum.values<-data.frame()
for(n in unique.names){
  index=which(dat$name==n)
  minimum.values<-rbind(minimum.values,data.frame(u.name=n,min.val=min(dat$number[index])))
}
minimum.values

aggregate(number~name, dat,min)
#nebo aggregatem

array(NA, dim=c(2,2,2,2))
myArray<-array(NA, dim=c(2,3,2))
myArray[,,1]<-matrix(c(1,2,3,4,5,6),2,3,byrow=T)
myArray[,,2]<-matrix(6+c(1,2,3,4,5,6),2,3,byrow=T)
myArray


myArray<-array(NA, dim=c(2,3,4))
myArray[,,1]<-matrix(c(1,2,3,4,5,6),2,3,byrow=TRUE)
myArray[,,2]<-matrix(2+c(1,2,3,4,5,6),2,3,byrow=TRUE)
myArray[,,3]<-matrix(4+c(1,2,3,4,5,6),2,3,byrow=TRUE)
myArray[,,4]<-matrix(6+c(1,2,3,4,5,6),2,3,byrow=TRUE)
myArray

myArray>3
apply(myArray>3,1,sum)
apply(myArray>3,2,sum)
apply(myArray>3,3,sum)
#total of each row across 

df3<-data.frame(individual=c("ID1","ID1","ID2","ID2","ID3"),col=c("blue","blue","blue","green","green"),habitat=c("bush","field","field","bush","field"))
df3

df3.tab<-table(df3)
df3.tab
class(df3.tab)
#summed count of the number of cases

table(subset(df3,select=c(habitat,col)))
colSums(df3.tab)

xtabs(~habitat+col,df3)
xtabs(~individual+habitat,data=df3)

tapply(df3$individual,list(df3$col,df3$habitat),length)
aggregate(individual~habitat+col,df3,length)
#NEBO pomoc? tapply a aggregate

df3$parasites<-c(1,2,5,0,6)
xtabs(parasites~col+habitat,data=df3)

tapply(df3$parasites,list(df3$individual,df3$col,df3$habitat),sum)
xtabs(parasites~individual+col+habitat,df3,addNA=T)
#tapply uk?ze NA hodnoty, xtabs uk?ze nulu

aggregate(parasites~individual+col+habitat,data=df3,sum)
#aggregate udel? dataframe s nulama

df.ticks.char<-data.frame(ind=c(rep("ind1",2),rep("ind2",2),rep("ind3",2)),patch=rep(c(1,2),3),n.ticks=c(1,1,2,NA,NA,NA),stringsAsFactors=F)
df.ticks.char
xtabs(n.ticks~ind+patch,df.ticks.char)

df.ticks.fac<-data.frame(ind=c(rep("ind1",2),rep("ind2",2),rep("ind3",2)),patch=rep(c(1,2),3),n.ticks=c(1,1,2,NA,NA,NA),stringsAsFactors=T)
df.ticks.fac
xtabs(n.ticks~ind+patch,df.ticks.fac)
#kdyz je objekt faktor, xtabs uvede i ind3 jako nulu

xtabs(n.ticks~ind+patch,df.ticks.char,na.action=na.pass)
#s napass uk?ze kolonku ind3 ale bez hodnot

#Exercises V
#Exercise V.1
dynamics<-read.table("dynamics.txt",dec=".")
#a
#test<-aggregate(dynamics[1:100],dynamics,mean)
#nev?m co to del?
dynamic.mean<-sapply(dynamics,mean)
#NEBO: dynamic.mean<-colMeans(dynamics)
#b
plot(dynamic.mean, ylim=c(0,150),xlab="Time",ylab="Expected population size",cex=0.5)
#c
dynam.quantile<-list()
dynam.quantile<-lapply (dynamics,function(t) {
  dynam.quantile[[length(dynam.quantile)+1]] <- quantile(t,c(0.025,0.975))})
dynam.quantile<-as.data.frame(dynam.quantile)
#d
plot(dynamic.mean, ylim=c(0,150),xlab="Time",ylab="Expected population size",cex=0.5)
polygon(c(1:100,100:1),c(dynam.quantile[1,], rev(dynam.quantile[2,])), col = "light gray", border = NA)
lines(dynamic.mean, type = "l", lwd = 2, col = "red")
#e

#Exercise V.2
PopData<-read.csv2("PopData.csv")
xtabs(N~Municipality,PopData)
hist(xtabs(N~Municipality,PopData))
#a
plot(N[order(year)]~sort(year),subset(PopData, Municipality == "Virrat"), type="b",main="Virrat")
#b
layout(matrix(c(1,2,3,4,5,6), 3, 2,byrow=T))
six.mun<-c("Asikkala", "Paltamo", "Padasjoki", "Jyvaskyla", "Loppi", "Kannonkoski") 
for (y in six.mun){plot(N[order(year)]~sort(year),subset(PopData, Municipality == y), type="b",main=y)}
#c

#Exercise V.3
OutputData<-dir("C:\\Users\\Client\\Desktop\\Ostatn?\\Skola\\University of Turku\\R\\OutputData")
#reading all names of the files

site.data <- data.frame(matrix(ncol = 3, nrow=0))
colnames(site.data) <- c("site", "meanValue", "n")
#creating empty data.frame with proper header

#site.data<-rbind(site.data,data.frame(site=OutputData[1],meanValue=sapply(read.table(OutputData[1]),mean),n=sapply(read.table(OutputData[1]),length)))
setwd("C:\\Users\\Client\\Desktop\\Ostatn?\\Skola\\University of Turku\\R\\OutputData")
for(o in 1:length(OutputData)){
  site.data<-rbind(site.data,data.frame(site=OutputData[o]
                                        ,meanValue=sapply(read.table(OutputData[o]),mean)
                                        ,n=sapply(read.table(OutputData[o]),length)))}
setwd("C:/Users/Client/Desktop/Ostatn?/Skola/University of Turku/R")
#loop to count each row

layout(matrix(c(1,2),1,2))
hist(site.data$meanValue,xlab="mean value",main="",col="white")
hist(site.data$n,xlab="sample size", main="",col="white")



#Exercise V.4
DataBlueTits<-read.csv2("DataBlueTits.csv",dec=".")
?read.csv
class(DataBlueTits$Ring)
class(DataBlueTits$Year)
class(DataBlueTits$Tarsus)
head(DataBlueTits)
tail(DataBlueTits)
#a 
df.bt<-as.data.frame.matrix(xtabs(~Ring+Year,DataBlueTits))
df.bt[df.bt>0]<-1
#making it into dataframe of 0 or 1 values
#NEBO: df.bt<-as.data.frame.matrix(ifelse(table(subset(DataBlueTits,select=c(Ring,Year))),1,0))

binary<-data.frame(rowSums(df.bt))
colnames(binary)<-"Sum"
#making total by year
freq.year<-data.frame(n.years=c(1:7),frequency=rep(NA,7))
for (y in c(1:7)){
  freq.year[y,2]<-length(binary$Sum[binary$Sum == y])}
#put the length of binary to 1:7 
hist(binary$Sum, breaks=c(-0.5:8.5),main="(a)",xlab="Number of times observed",ylab="Frequency",xlim=c(0,8),ylim=c(0,1200))

#EXERCISE V.5:
DataBlueTits<-read.csv2("DataBlueTits.csv",dec=".",stringsAsFactors = TRUE)
#stringasfactor!!! otherwise no NA values
df.try<-as.data.frame.matrix(xtabs(Tarsus~Ring+Year, DataBlueTits))
df.try[df.try>0]<-1
more.binary<-data.frame(rowSums(df.try))
colnames(more.binary)<-"Sum"
freq.year.time<-data.frame(times=c(0:7), frequency=rep(NA,8))

for (y in c(0:7)){
  freq.year.time[y+1,2]<-length(more.binary$Sum[more.binary$Sum == y])}

layout(matrix(c(1,2),1,2))
hist(binary$Sum, breaks=c(-0.5:8.5),main="(a)",xlab="Number of times observed",ylab="Frequency",xlim=c(0,8),ylim=c(0,1200),col="gray40")
hist(more.binary$Sum, breaks=c(-0.5:8.5),main="(b)",xlab="Number of times measured",ylab="Frequency",xlim=c(0,8),ylim=c(0,1200))

#KOMPENDIUM 6
#chi-square test
data.windturbine<-data.frame(trial=1:40, substrate=c(rep("gravel",20),rep("billberry",20))
                             ,found=c("yes","yes","yes","yes","yes","yes","no","yes","yes","yes","yes","no","yes","yes","yes","yes","yes","no","yes","yes"
                                      ,"yes","no","no","yes","no","no","no","yes","yes","no","yes","no","no","yes","no","no","yes","no","yes","no"))
data.windturbine
xtabs(~found+substrate,data.windturbine)

data.table<-xtabs(~found+substrate,data.windturbine)
mids<-barplot(data.table,beside=T,ylab=list("count",cex=1.5),cex.names=1.5,col=c("grey50","red"))
text(mids,1,rownames(data.table))

chisq.test(data.table)
chisq.result<-chisq.test(data.table)
str(chisq.result)
chisq.result$statistic
chisq.result$parameter
chisq.result$p.value

mtext(paste("X-sq =",format(chisq.result$statistic,digits=2),"df =",chisq.result$parameter,
            "p =",format(chisq.result$p.value,digits=2)))

chisq.result$observed
chisq.result$expected
chisq.result$residuals

#ttest
massData<-data.frame(individual=c("A","B","C","D","E","F","G","H","I","J")
                     , colour= c("blue", "blue", "blue", "blue", "blue", "red", "red", "red", "red", "red")
                     , mass=c(1.0, 1.2, 1.6, 1.4, 1.5, 2.1, 1.9, 1.8, 1.9, 2.2) )
massData
boxplot(mass~colour,massData,col=c("blue","red"))
stripchart(mass~colour,massData,col=c("blue","red"))
stripchart(mass~colour,massData,col=c("blue","red"),method="jitter")
t.test(mass~colour,massData)

ttest.stats<-t.test(mass~colour,massData)
str(ttest.stats)
boxplot(mass~colour,massData,col=c("blue","red"))
mtext(paste("t =",format(ttest.stats$statistic,digits=2)
            ,"; d.f. =",format(ttest.stats$parameter,digits=2)
            ,"p =", format(ttest.stats$p.value,digits=2)))

#linear
data.lm<-data.frame(
  final.length=c(10.2,10.1,12.3,9.8,7.9,8.5,9.9,11.8, 10.3,8.4,11.1,10.7,9.9,12.1)
  , exp=c("treated", "treated", "treated", "control", "control", "control", "control"
          ,"treated", "treated", "control", "treated", "control", "control", "treated")
  , orig.length= c(1.8,2.1,2.3,1.8,1.9,1.6,1.9,1.8,1.9,1.7,2.1,2.0,1.9,2.0))

par(mfrow=c(2,1))
stripchart(orig.length~exp,data=data.lm,method="jitter",col=c("red","blue"))
stripchart(final.length~exp,data=data.lm,method="jitter",col=c("red","blue"))

t.test(orig.length~exp,data.lm)
plot(final.length~orig.length
     ,col=c("red","blue")[as.factor(data.lm$exp)]
     ,pch=19,cex=1.2
     ,xlab=list("Length before experiment",cex=1.3)
     ,ylab=list("Length after experiment",cex=1.3)
     ,data.lm)

m1.exp<-lm(final.length~exp+orig.length,data.lm)
summary(m1.exp)
plot(m1.exp)

#analysis of variance
anova(m1.exp)

plot(final.length~orig.length
     , col=c("red","blue")[as.factor(data.lm$exp)]
     , pch=19, cex=1.2
     , xlab=list("Length before experiment",cex=1.3)
     , ylab=list("Length after experiment",cex=1.3)
     , data=data.lm)

data.lm$predictions<-predict(m1.exp)
lines(predictions~orig.length,data = subset(data.lm,exp=="control"),col="red")
lines(predictions~orig.length,data = subset(data.lm,exp=="treated"),col="blue")


#standardisation of effect sizes
mass.dat<-c(70,80,90)
mean(mass.dat)
sd(mass.dat)
scale(mass.dat)

data.lm$orig.length.stand<-scale(data.lm$orig.length)[,1]
summary(data.lm)

m1.exp.stand<-lm(final.length~exp+orig.length.stand,data.lm)
summary(m1.exp.stand)
anova(m1.exp.stand)

plot(final.length~orig.length.stand
     , col=c("red","blue")[as.factor(data.lm$exp)]
     , pch=19, cex=1.2
     , xlab=list("Length before experiment (Z-score)",cex=1.3)
     , ylab=list("Length after experiment",cex=1.3)
     , data=data.lm)
data.lm$predictions.stand<-predict(m1.exp.stand)
lines(predictions.stand~orig.length.stand,data = subset(data.lm,exp=="control"),col="red")
lines(predictions.stand~orig.length.stand,data = subset(data.lm,exp=="treated"),col="blue")
abline(v=0,lty="dashed")

m1.exp.stand.no.intercept<-lm(formula = final.length ~ -1 + exp + orig.length.stand, data = data.lm)
summary(m1.exp.stand.no.intercept)


#EXERCISES 6
#EXERCISE 6.1
Offspring<-read.table("OffspringData.csv",sep=",",header=T)
Adults<-read.table("AdultData.csv",sep=",",header=T)
# reading in the data and check it
meanwing.offspring<-aggregate(wing.offspring~BroodID,Offspring,mean)
# compute the mean wing.length for offspring in each brood
wings.club<-merge(Offspring,Adults)
wings.club<-merge(wings.club,meanwing.offspring,by.x="BroodID",by.y="BroodID")
colnames(wings.club)[6]<-"mean.wing.offspring"
# merge the two datasets of offspring and parents

scale(wings.club$mean.wing.parent)
wings.club$scaled.parent<-scale(wings.club$mean.wing.parent)[,1]
wings.club$scaled.offspring<-scale(wings.club$mean.wing.offspring)[,1]
# transform the data on mean wing length of offspring and parents to Z-scores

plot(wings.club$scaled.parent,wings.club$scaled.offspring)
# graphically explore your data

lm.wings.scaled<-lm(scaled.parent~scaled.offspring,wings.club)
summary(lm.wings.scaled)$coefficients
str(lm.wings.scaled)
# implement the linear model and check the analysis is done properly

abline(lm.wings.scaled$coefficients)
legend("topleft", legend = paste("h2 =",format(lm.wings.scaled$coefficients[2],digits=2),format(lm.wings.scaled$coefficients[1],digits=2)),bty="n")
# plot the data that went into the analysis as well as the results of the analysis. 
#Use the function abline() where the arguments for abline() are the value of the intercept (argument a) and the slope (argument b). 
#Both these values you can extract from the summary output of the linear model by coding (use str() to see where they are)

#Should be:
#h2=0.83 +/- 0.018
#h2=8.272e-01 +- 1.778e-02

#EXERCISE 6.2
owls.in.ghillie<-read.table("Koskenpato_etal_data_citizen_science.csv",sep=",",header=T)
str(owls.in.ghillie)

owls.in.snow <- subset(owls.in.ghillie, Snow=="TRUE")
#just owls in snow

owl.table<-xtabs(~Found+Colour,owls.in.snow)
owl.table
#making a table

chisq.test(owl.table)
owl.chisq.result<-chisq.test(owl.table)
str(owl.chisq.result)
owl.chisq.result$statistic
owl.chisq.result$parameter
owl.chisq.result$p.value
#using the table for the chisq test and extracting values

owl.plot <- barplot(owl.table,beside=T,ylab="Number found or not found",xlab="Morph",ylim=c(0,10000),col=c("red4","red4","Grey40","Grey40"))
text(owl.plot,1,rownames(owl.table),col=c("White","White","Black","Black"))
mtext(paste("X-sq =",format(owl.chisq.result$statistic,digits=2),"df =",owl.chisq.result$parameter,
            "p =",format(owl.chisq.result$p.value,digits=2)))
#plotting the table, putting the extracted chisq test values in writing

owl.chisq.result$observed
owl.chisq.result$expected
owl.chisq.result$residuals
#just some checks

#In snowy environment there is statistical probability
#of grey owl being less likely to be spotted and
#of brown owl being more likely to be spotted
#therefore based on these result grey morph of the owl has
#better chance of masking itself in snowy environment
#I deduce this on the fact that p-value is very close
#to zero/under 5%
#null hypothesis that there is a equal chance to spot both morhps
#is close to O%, therefore the isnt equal chance to spot both


#Exercise 6.3
growth.data<-read.table("Growthdata.csv",sep=",",header=T)
str(growth.data)
summary(growth.data)
#import and check
boxplot(growth~treat, growth.data)
stripchart(growth~treat, growth.data,method="jitter")
#graphical check
ttest.growth<-t.test(growth~treat,growth.data)
#ttest
boxplot(growth~treat, growth.data,ylab="Growth",xlab="Treatment",col=c("lightblue","green3"))
mtext(paste("t =",format(ttest.growth$statistic,digits=2)
            ,"df =",format(ttest.growth$parameter,digits=2)
            ,"p =",format(ttest.growth$p.value,digits=2)))
stripchart(growth~treat, growth.data,method="jitter",ylab="Treatment",xlab="Growth",col=c("lightblue","green3"))
mtext(paste("t =",format(ttest.growth$statistic,digits=2)
            ,"df =",format(ttest.growth$parameter,digits=2)
            ,"p =",format(ttest.growth$p.value,digits=2)))
#nice graphical plotting
barplot(growth.data$growth,axes=F)
#art

#probability of the difference between control/treated is
#above 5% therefore I reject alternative hypothesis that
#the groups are not equal

#Did the growth differ between these groups? 
#the growth did not differ because the groups are equal



#EXERCISE 6.4
data("ChickWeight")
str(ChickWeight)
finalweight<-subset(ChickWeight,Time==21)
#importing and extracting relevant data

stripchart(weight~Diet,finalweight,method="jitter",col=c("yellow4","blue","red","green3"))

chick.lm<-lm(weight~Diet,finalweight)
summary(chick.lm)
plot(chick.lm)
anova.chick<-anova(chick.lm)


plot(weight~Diet,finalweight)
mtext(paste("f =",format(anova.chick[1,4],digits=2)
            ,"df1 =",format(anova.chick[1,1],digits=2)
            ,"df2 =",format(anova.chick[2,1],digits=2)
            ,"p =",format(anova.chick[1,5],digits=2)))

#chci oboje df, fvalue a p value
#ftest v line?rn?m modelu 
# v ttest t df p

#EXERCISE 6.5
tree.data<-read.table("TreeData.csv",sep=",",header=T)
str(tree.data)

stripchart(Volume~habitat,data=tree.data,method="jitter",col=c("yellow2","grey40"))
boxplot(Volume~habitat,data=tree.data,method="jitter",col=c("yellow2","grey40"))

t.test(Volume~habitat,tree.data)

lm.tree<-lm(Volume~habitat+Girth,tree.data)
summary(lm.tree)
plot(lm.tree)
lm.tree.anova<-anova(lm.tree)
str(lm.tree.anova)
summary(lm.tree.anova)

plot(Volume~Girth,tree.data,col=c("grey40","yellow3")[as.factor(tree.data$habitat)],pch=18,ylim=c(0,80),xlim=c(5,25))
tree.data$predictions<-predict(lm.tree)
lines(predictions~Girth,data = subset(tree.data,habitat=="shady"),col="grey40")
lines(predictions~Girth,data = subset(tree.data,habitat=="sunny"),col="yellow3")
abline(v=mean(tree.data$Girth),lty="dashed")

mtext(paste("f =",format(lm.tree.anova[1,4],digits=2)
            ,"df1 =",format(lm.tree.anova[1,1],digits=2)
            ,"df2 =",format(lm.tree.anova[3,1],digits=2)
            ,"p =",format(lm.tree.anova[1,5],digits=2)))




#KOMPENDIUM 7
#THE RECKONING
#install.packages("devtools")
#install.packages("ggplot2")
library(ggplot2)
library(devtools)
#install_github("Gibbsdavidl/CatterPlots")
#install.packages("asreml_3.0.zip", repos = NULL, type = "win.binary")
library(sommer)
update.packages(ask=FALSE, checkBuilt = TRUE)
#remove.packages("ggplot2")

citation()
citation("ggplot2")

#install.packages("tidyverse")
#install.packages("readxl")
library(readxl)

garden<-read_excel("garden.xlsx")
summary(garden)

#install.packages("ggplot2")
library(ggplot2)


ggplot(data=garden, aes(x=sp_box,y=econ_box)) + geom_point()
plot1<-ggplot(garden, aes(x=sp_box,y=econ_box))
plot1+geom_smooth()

plot1+geom_point(shape=22,fill="red",alpha=.35)
plot1+geom_point(shape="square filled",fill="red",alpha=.35)
#different points - jsou stejný

garden$start_yearF<-as.factor(garden$start_year)
#přidávám jako faktor do dat
ggplot(garden, aes(sp_box, econ_box, col=start_yearF)) +geom_point()
#vytřídený podle let kterejm to přidělilo barvu
#totálně hustý!

scatter1<-ggplot(garden, aes(sp_box, econ_box))
scatter1+
  geom_point(shape=19,size=4,col="seagreen")+
  theme_bw()+
  labs(x="species number per box",y="economic value per box"
  ,title = "Relation between the economic value and species number")+
  theme(plot.title=element_text(hjust=0.5,size=21),
        axis.text=element_text(size=18),
        axis.title.y=element_text(size=17),
        axis.title.x=element_text(size=17))
#geom chooses the points, theme_bw chooses background, labs chooses labels,
#theme customizes the text further

scatter1+
  geom_point(shape=19,size=4,col="seagreen")+
  theme_bw()+
  labs(x="species number per box",y="economic value per box"
       ,title = "Relation between the economic value and species number")+
  theme(plot.title=element_text(hjust=0.5,size=21),
        axis.text=element_text(size=18),
        axis.title.y=element_text(size=17),
        axis.title.x=element_text(size=17))+
  stat_smooth(method="lm",formula=y~x,se=TRUE)
#added regression line 
ggsave("scatter1.png",width=5,height=5)


garden$start_yearF<-as.factor(garden$start_year)
table1<-aggregate(econ_box~start_yearF,garden, mean)
ggplot(table1,aes(x=start_yearF, econ_box))+geom_col()

#lightblue bars on dark background: add fill argument to geom_col() + theme_dark()
ggplot(data = table1, aes(x = start_yearF, y = econ_box)) + geom_col(fill="lightblue") + theme_dark() 

# different colouration categorized by year: add "fill" argument to aes() with X variable
ggplot(data = table1, aes(x = start_yearF, y = econ_box, fill=start_yearF))+geom_col() 

# fill the bars with specific colours: add fill argument to aes() and use scale_fill_manual
ggplot(data = table1, aes(x = start_yearF, y = econ_box,fill = start_yearF)) + geom_col() + theme_dark() + scale_fill_manual(values=c("coral", "khaki", "coral4", "tan1", "gold", "tomato"))

# fill the bars with automatically determined colours: add fill argument to aes() and use scale_fill_brewer
ggplot(data = table1, aes(x = start_yearF, y = econ_box,fill=start_yearF)) + geom_col() + theme_dark() + scale_fill_brewer()

# same as previous line but reverses direction (from dark to light)
ggplot(data = table1, aes(x = start_yearF, y = econ_box,fill=start_yearF)) + geom_col() + theme_dark() + scale_fill_brewer(direction = -1)


# A barplot with labels and information printed
ggplot(data = table1, aes(x = start_yearF, y = econ_box,fill=start_yearF)) + 
  geom_col() + theme_classic() + scale_fill_brewer(direction = -1, guide="none") +
  geom_text(aes(label = round(econ_box)), size = 5, color="black", position = position_nudge(y=1)) +  
  labs(x = "starting year", y = "economic value per box", title = "Mean 	economic value and starting year of gardening")  +   
  theme(plot.title = element_text(hjust = 0.5, size = 21), axis.text = element_text(size = 18), axis.title.y = element_text(size = 17), axis.title.x = element_text(size = 17))

table1<-cbind(table1,n=aggregate(econ_box~start_year,garden,length)[,2])
#sample size
table1<-cbind(table1,SD=aggregate(econ_box~start_year,garden,sd)[,2])
#standard deviation
table1$SE<-table1$SD/sqrt(table1$n)
#standard error
table1

ggplot(data = table1, aes(x = start_yearF, y = econ_box)) + 
  geom_col(fill="grey50") + theme_classic() +
  labs(x = "starting year", y = "economic value per box", title = "Mean 	economic value and starting year of gardening")  +   
  theme(plot.title = element_text(hjust = 0.5, size = 21), axis.text = element_text(size = 18), axis.title.y = element_text(size = 17), axis.title.x = element_text(size = 17))+
  geom_errorbar(aes(ymin=econ_box-SE,ymax=econ_box+SE),width=.2,size=1.1)



garden$start_yearF<-as.factor(garden$start_year)
bpl<-ggplot(garden, aes(x=start_yearF,y=econ_box))+geom_boxplot(fill="grey80")+
  theme_classic()
bpl
bpl+coord_flip()
#turning the plot
ggplot(garden, aes(y=start_yearF,x=econ_box))+
  geom_boxplot(fill="grey80",outlier.colour="red",outlier.shape=8,
  outlier.size=4)+ theme_classic()+xlab("Economic value")+
  ylab("Starting year")
#changing outliers
ggplot(garden, aes(y=start_yearF,x=econ_box))+
  geom_boxplot(fill="grey80",outlier.colour="red",outlier.shape=8,
  outlier.size=2)+ theme_classic()+xlab("Economic value")+
  ylab("Starting year")+geom_jitter(shape=16)
#showing with all jittered values
ggplot(garden, aes(y=start_yearF,x=econ_box))+
  geom_boxplot(fill="grey80",outlier.colour="red",outlier.shape=8,
               outlier.size=2)+ theme_classic()+xlab("Economic value")+
  ylab("Starting year")+stat_summary(fun=mean,geom="point",shape=23,size=4)
#adding mean

#EXERCISES 7
#Exercise 7.1
library(readxl)
garden<-read_excel("garden.xlsx")
garden$start_yearF<-as.factor(garden$start_year)
ggplot(garden, aes(y=quality,x=weed_area,col=start_yearF))+geom_point()
ggsave("scatterex1.png", width = 5, height = 5)
#Add first the basic components and save the plot
ggplot(garden, aes(y=quality,x=weed_area,col=start_yearF))+geom_point(size=2)
#Make a scatter plot but change the size of the points larger  
ggplot(garden, aes(y=quality,x=weed_area,col=start_yearF))+geom_point(size=2)+
theme_minimal()
#Modify the background theme to be sure that it is white
ggplot(garden, aes(y=quality,x=weed_area, colour=start_yearF))+geom_point(size=2)+
theme_minimal()+scale_colour_brewer(palette="Spectral")+guides(colour=guide_legend(title="Starting year"))
#Change the coloration of the points to your taste and add a legend title
ggplot(garden, aes(y=quality,x=weed_area, colour=start_yearF))+geom_point(size=2)+
  theme_minimal()+scale_colour_brewer(palette="Spectral")+
  guides(colour=guide_legend(title="Starting year"))+
  labs(x="area of weeds",y="average quality of the produce",title = "Relation between the quality of the produce and area of weeds")
#Change the x & y -axis labels and add a title for your plot
ggplot(garden, aes(y=quality,x=weed_area, colour=start_yearF))+geom_point(size=2)+
  theme_minimal()+scale_colour_brewer(palette="Spectral")+
  guides(colour=guide_legend(title="Starting year"))+
  labs(x="area of weeds",y="average quality of the produce",title = "Relation between the quality of the produce and area of weeds")+
  theme(plot.title=element_text(size=20),
        axis.title.y=element_text(size=15),
        axis.title.x=element_text(size=15))
#Change the label sizes to be larger
ggplot(garden, aes(y=quality,x=weed_area, colour=start_yearF))+geom_point(size=2)+
  theme_minimal()+scale_colour_brewer(palette="Spectral")+
  guides(colour=guide_legend(title="Starting year"))+
  labs(x="area of weeds",y="average quality of the produce",title = "Relation between the quality of the produce and area of weeds")+
  theme(plot.title=element_text(size=20),
        axis.title.y=element_text(size=15),
        axis.title.x=element_text(size=15))+
  stat_smooth(method="lm",formula=y~x,se=FALSE)
#Add regression lines for the plot, but don`t include the standard error (se) in the lines this time
ggsave("scatterex1fin.png", width = 5, height = 5)
#Export the plot as a png file

#the closer to zero the area is, more quality it has
#weeds that grew in 2021 grew mostly in 0 areas 
#most unsuccesful year of quality was the 2018
#Describe the plot by writing a short paragraph under your Figure


#Exercise 7.2
library(readxl)
garden<-read_excel("garden.xlsx")
garden$locationF<-as.factor(garden$location)

ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot()
ggsave("boxplotex2.png", width = 5, height = 5)
#•	First add the basic components and save the plot
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)
#•	Make a boxplot but remove the outliers from the plot
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+xlim(0,50)
#•	Change that the axis for economic value ranges from 0 to 50
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+xlim(0,50)+theme_bw()
#•	Modify the background theme so that it is white
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+xlim(0,50)+theme_bw()+
  scale_fill_manual(values=c("brown","orange","yellow"),name = "Location")
#•	Change the coloration of the bars to your taste and add a legend title
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+xlim(0,50)+theme_bw()+
  scale_fill_manual(values=c("brown","orange","yellow"),name = "Location")+
  coord_flip()
#•	Flip the plot so that the location is on y-axis and economic value is on x-axis
ggplot(garden, aes(y=locationF,x=econ_box,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+xlim(0,50)+theme_bw()+
  scale_fill_manual(values=c("brown","orange","yellow"),name = "Location")+
  coord_flip()+labs(x="economic value per box (€)",y="Location", title="Mean economic value and gardening location")
#•	Change the x & y -axis labels and add a title for your plot
ggplot(garden, aes(y=econ_box,x=locationF,fill=locationF))+
  geom_boxplot(outlier.shape=NA)+ylim(0,50)+theme_bw()+
  scale_fill_manual(values=c("brown","orange","yellow"),name = "Location")+
  coord_flip()+labs(x="Location",y="economic value per box (€)", title="Mean economic value and gardening location")+
  theme(plot.title=element_text(size=20),
        axis.title.y=element_text(size=15),
        axis.title.x=element_text(size=15),
        legend.title =element_text(size=15))
#•	Change the label and title sizes larger. Here you can also modify the legend title and legend text in a similar way as the other texts: make them also larger if you can.

#Exercise 7.3
install.packages('cowplot')
library(tidyverse)
library(cowplot)
data(ChickWeight)

plot_list <- vector("list", length = 4)
for (i in 1:4) {
  g <- ggplot(data=subset(ChickWeight,Diet==i), aes(y=weight,x=Time))+geom_smooth()+
    ylim(0,300)+labs(title="Diet")+theme_bw()
  plot_list[[i]] <- g}
cowplot::plot_grid(plotlist = plot_list, ncol = 4)


#Exercise 7.4
library(readxl)
DataT<-read_excel("DataT.xlsx")
str(DataT)
#barplot(DataT.mean$measure,DataT.mean$treatment)

DataT.mean<-aggregate(measure~treatment,DataT,mean)
subcon<-subset(DataT,treatment=="control")
subtreat<-subset(DataT,treatment=="treatment")
kvantil.con<-quantile(subcon$measure,probs=c(0.025,0.975))
kvantil.treat<-quantile(subtreat$measure,probs=c(0.025,0.975))

hm<-ggplot(DataT.mean,aes(y=measure,x=treatment))+geom_bar(stat='identity')+
  ylim(0,8)+theme_classic()+geom_segment(aes(x1=x1,y1=kvantil.con[1],xend=x1,yend=kvantil.con[2]), arrow = "arrow")

str(hm)
segments(x0=0.7,y0=kvantil.con[1],x1=0.7,y1=kvantil.con[2],lwd=2)
segments(x0=1.9,y0=kvantil.treat[1],x1=1.9,y1=kvantil.treat[2],lwd=2)


#Exercise 7.5
fruit.taste<-read_excel("Fruit_tasting_data_2018.xlsx")
str(fruit.taste)

zkouska<-lm(Score2~Score1+Fruit,fruit.taste)
summary(zkouska)

ggplot(fruit.taste, aes(y=Score2,x=Score1,col=Fruit))+
  geom_point(size=2)+stat_smooth(method="lm",formula=y~x,se=TRUE)+
  theme_bw()

