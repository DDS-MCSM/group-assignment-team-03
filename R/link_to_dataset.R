library(stringr)
library(httr)

datos <- readLines("Desktop/new_legitimate.csv");

df <- data.frame(index=integer(), having_IPhaving_IP_Address=integer(), URLURL_Length=integer(), Shortining_Service=integer(), having_At_Symbol=integer(), double_slash_redirecting=integer(), Prefix_Suffix=integer(), having_Sub_Domain=integer(), HTTPS_token=integer())
de <- list()


#df = rbind(df,de, stringsAsFactors=FALSE)

write.csv(df, "Desktop/legitimate_links.csv")

#names(df)<-c("caca", "tua", "gosa", "pusa")


for(i in datos){
  de <- list()
  i2 <- toString(i)
  print(i2)
  mida <- nchar(i2)
  #mida <- 3
  url_lenght <- 1
  if(mida >= 54 && mida <= 75){
    url_lenght <- 0
  }
  else if(mida > 75){
    url_lenght <- -1
  }
  else {
    url_lenght <- 1
  }
  
  de <- c(de, URLURL_Length=url_lenght)
  #insertar el valor en la columna que toque del csv
  
  having_at <- str_detect(i, "@")
  having_aR <- 0
  if(having_at == TRUE){
    having_aR <- -1
  }
  else{
    having_aR <- 1
  }
  
  de <- c(de, having_At_Symbol=having_aR)
  
  #introducir having_aR en csv de resultados
 
  clean <- strsplit(i, "://")
  clean2 <- clean[[1]]
  double_slashB <- str_detect(clean2[2], "//")
  #print(clean2[2])
  double_slash <- 0
  if(double_slashB == TRUE){
    double_slash <- -1
  }
  else{
    double_slash <- 1
  }
  
  de <- c(de, double_slash_redirecting=double_slash)
  
  #introducir valor de double_slash en csv de resultados
  
  https_t <- str_detect(i, "https://")
  https <- -1
  if(https_t == TRUE){
    https <- 1
  }
  else{
    https <- -1
  }
  de <- c(de, HTTPS_token=https)
  #introducir https en csv de resultados
  
  main_domain <- strsplit(i, "/")
  print(main_domain)
  domain <- main_domain[[1]]
  #print(domain[3])
  prefixB <- str_detect(domain[3], "-")
  prefix <- 0
  if(prefixB == TRUE){
    prefix <- -1
  }
  else{
    prefix <- 1
  }
  
  de <- c(de, Prefix_Suffix=prefix)
  #introducir https en prefix de resultados
  
  subdomain <- strsplit(domain[3], "[.]")
  n_subdomains <- lengths(subdomain[1])-2
  having_sub_domain <- 1
  if(n_subdomains < 2) {
    having_sub_domain <- 1
  }
  else if (n_subdomains == 2){
    having_sub_domain <- 0
  }
  else {
    having_sub_domain <- -1
  }
  
  de <- c(de, having_Sub_Domain=having_sub_domain)
  #introducir having_sub_domain en csv de resultados
  
  having_ip_address <- 1
  if(n_subdomains > 5){
    having_ip_address <- 0
  }
  de <- c(de, having_IPhaving_IP_Address=having_ip_address)
  
  #introducir having_ip_address en csv de resultados
  
  flag <- 0
  if(str_detect(domain[3], "bit.ly")){flag <-1}
  if(str_detect(domain[3], "tinyurl")){flag <-1}
  if(str_detect(domain[3], "tiny.cc")){flag <-1}
  if(str_detect(domain[3], "lc.chat")){flag <-1}
  if(str_detect(domain[3], "is.gd")){flag <-1}
  if(str_detect(domain[3], "soo.gd")){flag <-1}
  if(str_detect(domain[3], "s2r.co")){flag <-1}
  if(str_detect(domain[3], "clicky.me")){flag <-1}
  if(str_detect(domain[3], "budurl.com")){flag <-1}
  if(str_detect(domain[3], "t.co")){flag <-1}
  if(str_detect(domain[3], "bit.ly")){flag <-1}
  
  shortened <- 1
  if (flag == 1){shortened <- -1}
  
  de <- c(de, Shortining_Service=shortened)
  #introducir shortened en csv de resultados
  
  df[nrow(df) + 1,] = de
  
}

write.csv(df, "Desktop/legitimate_links.csv")

