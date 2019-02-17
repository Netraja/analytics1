women
sample(x=1:nrow(women), size=0.7*nrow(women))
index=sample(1:nrow(women), size=0.7*nrow(women))
index
women[1 ,]
women[index ,]
train=women[index ,]
#ithe 2 types che data create kele test and training. training overall asato while test ha subset asato
test= women[-index ,]
fit1= lm(weight ~ height, data=train)
summary(fit1)
p4=predict(fit1, newdata = test, type='response')
cbind(predicted=p4, actual=test$weight, height=test$height)
