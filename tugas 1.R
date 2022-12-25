a = exp((-(seq(90,110)-101)^2)/2)
b = exp((-(seq(90,110)-97)^2)/2)
c = exp((-(seq(90,110)-99)^2)/2)
d = exp((-(seq(90,110)-104)^2)/2)
e = exp((-(seq(90,110)-103)^2)/2)
f = exp((-(seq(90,110)-94)^2)/2)
g = exp((-(seq(90,110)-102)^2)/2)
h = exp((-(seq(90,110)-94)^2)/2)
i = exp((-(seq(90,110)-102)^2)/2)
j = exp((-(seq(90,110)-106)^2)/2)

x = matrix(c(a,b,c,d,e,f,g,h,i,j),ncol=10,byrow=FALSE)
table <- as.table(x)
table

answer = table/(sqrt(6.28))
answer

rowSums(answer)/10

z = rowSums(answer)/10




