library(xml2)
library(rvest)

#Specifying the url for desired website to be scraped
url <- 'https://www.imdb.com/search/title/?count=100&release_date=2018,2018&title_type=feature'

#Reading the HTML code from the website
webpage <- read_html(url)
webpage

#Using CSS selectors to scrape the runtime section
runtime_data_html <- html_nodes(webpage,'.runtime')
head(runtime_data_html)
#Converting the runtime data to text
runtime_data <- html_text(runtime_data_html)
#Let's have a look at the runtime
head(runtime_data)

runtime_data <- gsub(" min","",runtime_data)
runtime_data<-as.numeric(runtime_data)
head(runtime_data)

#Using CSS selectors to scrape the genre section
genre_data_html <- html_nodes(webpage,'.genre')
head(genre_data_html)
#Converting the genre data to text
genre_data <- html_text(genre_data_html)
#Let's have a look at the genre
head(genre_data)
#Data-Preprocessing: removing '\n' 
genre_data<-gsub("\n","",genre_data)
#Data-Preprocessing: removing excess spaces
genre_data<-gsub(" ","",genre_data)
#taking only the first genre of each movie
genre_data<-gsub(",.*","",genre_data)
head(genre_data)
#Convering each genre from text to factor
genre_data<-as.factor(genre_data)
#Let's have another look at the genre data
head(genre_data)

#Using CSS selectors to scrape the rating section
rating_data_html <- html_nodes(webpage,'.ratings-imdb-rating strong')
head(rating_data_html)
#Converting the rating data to text
rating_data <- html_text(rating_data_html)
head(rating_data)
#Converting the rating data to numeric
rating_data<-as.numeric(rating_data)
head(rating_data)

#Using CSS selectors to scrape the gross revenue section
gross_data_html <- html_nodes(webpage,'.ghost~ .text-muted+ span')
#Converting the gross revenue data to text
gross_data <- html_text(gross_data_html)
#Let's have a look at the gross revenue data
head(gross_data)
#Data-Preprocessing: removing '$' and 'M' signs
gross_data<-gsub("M","",gross_data)
gross_data<-gsub("[\\$,]","",gross_data)
head(gross_data)   
#Let's check the length of gross data
length(gross_data)

#Filling missing entries with NA based on realtime web data
for (i in c(1,19,29,37,41,50,51,58,59,62,79,80,87,94,96)){
  a<-gross_data[1:(i-1)]
  b<-gross_data[i:length(gross_data)]
  gross_data<-append(a,list("NA"))
  gross_data<-append(gross_data,b)
}
#Data-Preprocessing: converting gross to numerical
gross_data<-as.numeric(gross_data)
#Let's have another look at the length of gross data
length(gross_data)

gross_data=gross_data[2:101]
gross_data<-as.numeric(gross_data)
summary(gross_data)

#Combining all the lists to form a data frame
movies_df<-data.frame(Runtime = runtime_data,
                      Genre = genre_data,
                      Rating = rating_data,
                      Gross_Earning_in_Mil = gross_data)
#Structure of the data frame
str(movies_df)

library('ggplot2')

qplot(data = movies_df,Runtime,fill = Genre,bins = 30)
ggplot(movies_df,aes(x=Runtime,y=Gross_Earning_in_Mil))+
  geom_point(aes(size=Rating,col=Genre))

#Export dataframe to CSV file without row names/numbers
write.csv(movies_df ,"Dataimdb100RNF.csv",row.names = F)
getwd()
