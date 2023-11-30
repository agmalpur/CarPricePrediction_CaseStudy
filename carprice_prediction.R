library(GGally)
library(tidyverse)
library(caret)
library(plotly)
library(data.table)
library(GGally)
library(tidymodels)
library(car)
library(scales)
library(lmtest)
predict_carprice <- read.csv("D:/CaseStudy/carprice.csv")
#range(predict_carprice$price)

#ggplot(data=predict_carprice,mapping = aes(x=enginesize,y=price))+geom_point(size=5)+geom_line(color="red")

#color=Treatment - this helps to mark treatments of the same type in same color
#alpha is used to makes the dots transparent
#geom_smooth- makes the plot smoother
#facet_wrap(~Type)- draws separate graphs based on the types
#labs- add labels ie gives title to our graphs
#ggplot(predict_carprice,aes(fuelsystem,horsepower,color=fueltype))+geom_point(size=3,alpha=0.5)+geom_smooth(method = lm,se=F)+facet_wrap(~fueltype)+labs(title = "Fuel type") +theme_bw()#add black and white theme

#coord_flip() - used to flip the boxplot
#ggplot(predict_carprice,aes(fuelsystem,horsepower))+geom_boxplot()+geom_point()+geom_point(alpha=0.5,aes(color=fueltype))+coord_flip()+theme_bw()+facet_wrap(~fueltype)

#ggplot(predict_carprice, aes(x="", y="", fill=carbody)) +geom_bar(stat="identity", width=2) +coord_polar("y", start=0)

#table(predict_carprice$CarName)
# dim(predict_carprice)
# 
# str(predict_carprice)

# summary(predict_carprice)
# install.packages("GGally")
#ggpairs(predict_carprice)
data<- data.frame(predict_carprice$price,predict_carprice$symboling,predict_carprice$wheelbase,predict_carprice$carlength,predict_carprice$carwidth,predict_carprice$carheight,predict_carprice$curbweight,predict_carprice$enginesize,predict_carprice$peakrpm,predict_carprice$citympg,predict_carprice$highwaympg)
# pairs(data)
#ggpairs(data)
#?heatmap
#install.packages("ROCR")
library(caTools)
library(ROCR)
# split <- sample.split(predict_carprice, SplitRatio=0.8)
# split
# s <- split(predict_carprice,predict_carprice$fueltype)
# print(s)
# range(data)
# head(predict_carprice)
library(tidyverse)
# ggplot(predict_carprice,aes(x=price))+geom_density()
#plot(density(predict_carprice$price))

# ggplot(predict_carprice,aes(x=symboling,y=mean(price)))+
#   geom_bar(fill="#0073C2FF",stat = "identity")+
#   geom_text(aes(label=price),vjust=-0.5)

#ggplot(predict_carprice,aes(symboling))+geom_bar(fill="#0073C2FF")

# company_name<- strsplit(predict_carprice$CarName," ")
# brand <-company_name[0]
# print(brand)


# #City Miles Per Gallon
# qplot(predict_carprice$citympg, xlab = 'Miles Per Gallon in city', ylab = 'Count', binwidth = 2, 
#       main='Frequency Histogram: Miles per Gallon')

# Wheelbase
# qplot(predict_carprice$horsepower, xlab = 'horsepower', ylab = 'Count', binwidth = 10,
#       main='Frequency Histogram:Horsepower')
# qplot(predict_carprice$curbweight, xlab = 'curbweight', ylab = 'Count', binwidth = 30,
#       main='Frequency Histogram:curbweight')

#ggplot(predict_carprice,aes(fueltype,mean(price),color=fueltype))+geom_bar(stat = 'identity')+labs(title = "Fuel type") 


# ggplot(predict_carprice, aes(x = predict_carprice$curbweight, y = citympg)) +
#   geom_point() +
#   geom_smooth(method='lm') +
#   xlab('citympg') +
#   ylab('carweight') +
#   ggtitle('city MPG vs. carWeight: Entire Sample')

# fit = lm(citympg ~ curbweight, predict_carprice)
# summary(fit)

# ggplot(predict_carprice, aes(x = curbweight, y = price)) +
#   geom_point() +
#   xlab('curbWeight') +
#   ylab('Price') +
#   ggtitle('Price vs. Weight')

# fit = lm(price ~enginesize, predict_carprice)
# summary(fit)

# ggplot(predict_carprice, aes(x =cylindernumber, y = price)) +
#   geom_point() +
#   xlab('Cyclinder number') +
#   ylab('Price') +
#   ggtitle('Price vs. No of Cyclinder')


# ggplot(predict_carprice, aes(x = carlength, y = price)) +
#   geom_boxplot() +
#   xlab('Length') +
#   ylab('Price') +
#   ggtitle('Price over Length')
# 
# ?heatmap

# x<- as.matrix(data)
# rc <- rainbow(nrow(x),start=0,end=0.3)
# cc <- rainbow(ncol(x),start = 0,end = 0.3)
# heatmap(x,col= cm.colors(254),scale= "column",
#               RowSideColors = rc, ColSideColors = cc,margins = c(20,20),
#               xlab = "specification variables", ylab = "Car Prices",
#               main = "heatmap(<Predict car price data>,...,scale=\"column\")")
#ggplot(predict_carprice,aes(carbody,price))+geom_boxplot(fill="#FFDB6D",color="#C4961A")
#data<- data.frame(predict_carprice$price,predict_carprice$symboling,predict_carprice$wheelbase,predict_carprice$carlength,predict_carprice$carwidth,predict_carprice$carheight,predict_carprice$curbweight,predict_carprice$enginesize,predict_carprice$peakrpm,predict_carprice$citympg,predict_carprice$highwaympg)

# install.packages("corrplot")
# library(corrplot)
# most_significant <- data.frame(predict_carprice$price,predict_carprice$wheelbase,predict_carprice$carlength,predict_carprice$carwidth,predict_carprice$curbweight,predict_carprice$enginesize,predict_carprice$citympg,predict_carprice$highwaympg)
# pairs(most_significant)
# cor_plot <-cor(most_significant,use = "complete.obs")
# corrplot(cor_plot,method="ellipse")

# ggplot(predict_carprice,aes(enginelocation,price))+geom_boxplot(fill="#FFDB6D",color="#C4961A")






#options(scipen = 100, max.print = 1e+06)

# remove unused variables
car_data <- predict_carprice %>% select(-c(car_ID, CarName))

# remove cylinder number with only 1 instance
cylinder <- predict_carprice %>% count(cylindernumber) %>% filter(n > 3)
car_data <- car_data[predict_carprice$cylindernumber %in% cylinder$cylindernumber, ]
car_data$cylindernumber <- factor(car_data$cylindernumber, unique(car_data$cylindernumber))

# remove fueltype with only 1 instance
fuel <- predict_carprice %>% count(fuelsystem) %>% filter(n > 3)
car_data <- car_data[car_data$fuelsystem %in% fuel$fuelsystem, ]
car_data$fuelsystem <- factor(car_data$fuelsystem, unique(car_data$fuelsystem))

# remove engine type with 1 instance
engine <- car_data %>% count(enginetype) %>% filter(n > 3)
car_data <- car_data[car_data$enginetype %in% engine$enginetype, ]
car_data$enginetype <- factor(car_data$enginetype, unique(car_data$enginetype))

# transform character into factor
car_data <- car_data %>% mutate_if(~is.character(.), ~as.factor(.))

ggcorr(car_data, label = TRUE, label_size = 2.9, hjust = 1, layout.exp = 2)

set.seed(123)
samplesize <- round(0.7 * nrow(car_data), 0)
index <- sample(seq_len(nrow(car_data)), size = samplesize)

data_train <- car_data[index, ]
data_test <- car_data[-index, ]

set.seed(123)
car_lm <- lm(price ~ ., data = data_train)

summary(car_lm)


car2 <- car_data %>% select(aspiration, carbody, enginelocation, carwidth, curbweight, 
                            enginetype, cylindernumber, enginesize, stroke, peakrpm, price)

data_train2 <- car2[index, ]
data_test2 <- car2[-index, ]

set.seed(123)
car_lm2 <- lm(price ~ ., data = data_train2)

summary(car_lm2)

lm_pred <- predict(car_lm, newdata = data_test %>% select(-price))

# RMSE of train dataset
RMSE(pred = car_lm$fitted.values, obs = data_train$price)
# RMSE of test dataset
RMSE(pred = lm_pred, obs = data_test$price)


lm_pred2 <- predict(car_lm2, newdata = data_test2 %>% select(-price))

# RMSE of train dataset
RMSE(pred = car_lm2$fitted.values, obs = data_train2$price)
# RMSE of test dataset
RMSE(pred = lm_pred2, obs = data_test2$price)

ggcorr(car2, label = TRUE, label_size = 2.9, hjust = 1, layout.exp = 2)

car3 <- car2 %>% select(-c(enginesize, carbody))
car3 <- car3 %>% mutate_if(~is.numeric(.), ~log10(.))
head(car3)

set.seed(123)
data_train3 <- car3[index, ]
data_test3 <- car3[-index, ]

# train the model
set.seed(123)
car_lm3 <- lm(price ~ ., data = data_train3)
summary(car_lm3)

lm_pred3 <- predict(car_lm3, newdata = data_test3 %>% select(-price))

# RMSE of train dataset
RMSE(pred = 10^(car_lm3$fitted.values), obs = 10^(data_train3$price))
# RMSE of test dataset
RMSE(pred = 10^(lm_pred3), obs = 10^(data_test3$price))

model <- lm(price ~ enginesize+curbweight,data=predict_carprice)
coeff=coefficients(model)
print(coeff)
intercept=coeff[1]
slope=coeff[2]
c=coeff[3]
enginesize=130
curbweight=2548
result=intercept+slope*enginesize+c*curbweight
print(result)

# model <- lm(price ~ enginesize+curbweight+cyclindernumber,data=predict_carprice)
# coeff=coefficients(model)
# print(coeff)
# intercept=coeff[1]
# slope=coeff[2]
# c=coeff[3]
# cycnum=coeff[4]
# enginesize=130
# curbweight=2548
# cyclindernumber=4
# result=intercept+slope*enginesize+c*curbweight+cycnum*cyclindernumber
# print(result)

View(predict_carprice)