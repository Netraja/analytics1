#modelling 
#linear regression-simple , multiple
#simple linear when y is dependent on singl x y~x1(SLR); y~x1+x2..(MLR)
#y- dependent variable , x- independent variable

head(women)
#here y-weight x-height 
cor(women$height, women$weight)
#corelation tells us strength and direction of relationship.1-highly strongly positively related. -1: strongly negatively and 0 to1 : moderately related
cov(women$height, women$weight)#here direction is positive,if height increases, weight increases
#covariance tells us the direction of the relationship, positive or negative
plot(women$height, women$weight)
#perform linear modelling
fit1= lm(weight ~ height, data=women)
summary(fit1)
#F stats Pvalue <<0.05: linear mode1 exist
#at least 1 indepenednt variable is significant in predicting dependent variable
#multiple Rsquare= .991 coeff of determination
#for one independent variable, we use multiple Rsquare otherwise adjusted Rsquare
#99% of variation in y is explained by x
#y=mx+c: y=-87+ 3.45 *height
range(women$height)
#only do interpolation and not extrapolation
women$weight
women$height
(y=-87+ 3.45*women$height)
#above are predicted weights for actual heights
fitted(fit1)
residuals(fit1)#difference between predicted and actual weights
summary(fit1)
summary(residuals(fit1))
summary(students$marks1)
(newdata1=data.frame(height=c(60.4,55.9)))
#here we have defined data frame and the values for which we need heights
(p1=predict(fit1, newdata=newdata1, type='response'))
#predicting the values of weight for the required weight
cbind(newdata1, p1)
#to bind the columns
?predict
#check for assumption of linear regression
plot(fit1)

