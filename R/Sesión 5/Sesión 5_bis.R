

# 5. Nuevas características de R (wordcloud y Markdown)

# Objetivo: Introducir al usuario a las nuevas utilidades de R


#=================================================================================

# Indicaciones:

# Limpia el entorno de trabajo




# Las liberías que vamos a usar son:
# tm, SnowballC, wordcloud, RColorBrewer,dplyr, foreign, ggplot2, igraph



# Carga el archivo "universal.csv" 
# Debes especificar "," y header=TRUE



# Responde:

#1. ¿En qué año hubo más noticias?

#2. ¿En qué lugar hubo más noticias?





#
write.table(u[11], file = "u1.txt", row.names = FALSE, quote=FALSE)

#
wtd.table(u$año)

#
docs <- Corpus(VectorSource(readLines("paulina2.txt",encoding = "UTF-8")))

#
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))

#
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")

docs <- tm_map(docs, toSpace, ";")
docs <- tm_map(docs, toSpace, "¿")
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("spanish"))
inspect(docs)

# ****************************************
# Feminicidio
docs <- tm_map(docs, removeWords, c("feminicidio","mexico","personas","mas","mujer","den","dar","mil","dia","dos","solo",
                                    "tambien","años","pues","cada","sur","vez","dijo","pasado","despues","ahi","dio","ademas","segun","ser","asi","tres","habia","meses","luego","dias","tenia")) 
# ****************************************

#
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)


set.seed(1234)

#
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=400, random.order=FALSE, rot.per=0.5, 
          colors=brewer.pal(8, "Dark2"))



barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Palabras más frecuentes",
        ylab = "Frecuencias")


# Análisis de discurso

datalist = list()
ter<-c("violencia","muerte")
i<-1
for (t in ter){
  temp<-data.frame(findAssocs(dtm, terms = t, corlimit = 0.3))
  temp<-mutate(temp,word=t,termino=row.names(temp))
  names(temp)<-c("n","word","termino")
  datalist[[i]] <-temp
  i=i+1
}
base<-do.call(rbind, datalist)
write.table(base, file = "base.csv", row.names = FALSE, sep=",")
base2<- read.csv("base.csv", sep=",", header=TRUE)


s   <- c(base2[,2])
r   <- c(base2[,3])
w   <- c(base2[,1])
el  <- matrix(c(s,r,w), length(s), 3)

#
labels<- unique(c(as.character(base2[,2]),as.character(base2[,3])))
A<- matrix(0, length(labels), length(labels))
rownames(A) <- colnames(A) <- labels
A[el[,1:2]]<-as.numeric(el[,3])
m=as.matrix(A)
net=graph.adjacency(m,mode="directed",weighted=TRUE,diag=FALSE) #the only difference between this and the weighted network code is that mode="directed"
plot.igraph(net,vertex.label=V(net)$name,layout=layout.fruchterman.reingold, vertex.label.color="black",edge.color="black",edge.width=E(net)$weight/3, edge.arrow.size=0.05)






install.packages("rmarkdown")
install.packages("devtools")



install.packages('rmarkdown')

# Or if you want to test the development version,
# install from GitHub
if (!requireNamespace("devtools"))
  install.packages('devtools')
devtools::install_github('rstudio/rmarkdown')

