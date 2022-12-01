# ANALIZA REZULTATOV

#################################################
# popolnoma naključno, d = 1, n = N
#################################################

# uvoz podatkov
a_1000 <- read.csv("najvecja_zasedenost_1000_1000_1.csv")
a_1000 <- as.numeric(unlist(a_1000[1]))
a_10000 <- read.csv("najvecja_zasedenost_10000_10000_1.csv")
a_10000 <- as.numeric(unlist(a_10000[1]))
a_100000 <- read.csv("najvecja_zasedenost_100000_100000_1.csv")
a_100000 <- as.numeric(unlist(a_100000[1]))

# grafi
par(mfrow=c(2,2))

hist(a_1000, xlim = c(min(a_1000)-0.05, max(a_1000)+0.05),
     ylim = c(0,250), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = n = 1000")
abline(v = mean(a_1000), col = "red", lty = "dashed")
text(x = mean(a_1000), y = 240, label = round(mean(a_1000),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(a_10000, xlim = c(min(a_10000)-0.05, max(a_10000)+0.05),
     ylim = c(0,250), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = n = 10000")
abline(v = mean(a_10000), col = "red", lty = "dashed")
text(x = mean(a_10000), y = 240, label = round(mean(a_10000),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(a_100000, xlim = c(min(a_100000)-0.05, max(a_100000)+0.05),
     ylim = c(0,100), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = n = 100000")
abline(v = mean(a_100000), col = "red", lty = "dashed")
text(x = mean(a_100000), y = 90, label = round(mean(a_100000),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))


#################################################
# delno naključno, d > 1, n = N = 10000
#################################################

# uvoz podatkov
d_1 <- a_10000
d_2 <- as.numeric(unlist(read.csv("najvecja_zasedenost_10000_10000_2.csv")[1]))
d_3 <- as.numeric(unlist(read.csv("najvecja_zasedenost_10000_10000_3.csv")[1]))
d_4 <- as.numeric(unlist(read.csv("najvecja_zasedenost_10000_10000_4.csv")[1]))
d_5 <- as.numeric(unlist(read.csv("najvecja_zasedenost_10000_10000_5.csv")[1]))
d_10 <- as.numeric(unlist(read.csv("najvecja_zasedenost_10000_10000_10.csv")[1]))

# grafi
par(mfrow=c(1,1))

# hist(d_5, xlim = c(min(d_5)-0.05, max(d_5)+0.05),
#      ylim = c(0,500), xlab = "Največje število žog v košu",
#      main = "Delno naključno, d = 5")
# abline(v = mean(d_5), col = "red", lty = "dashed")
# text(x = mean(d_5), y = 140, label = round(mean(d_5),3), pos=2, col="red")
# legend('topright', legend = c("povprečje"),
#        col = c("red"), cex=0.6, lty=c("dashed"))
# 
# hist(d_3, xlim = c(min(d_3)-0.05, max(d_3)+0.05),
#      ylim = c(0,500), xlab = "Največje število žog v košu",
#      main = "Delno naključno, d = 3")
# abline(v = mean(d_3), col = "red", lty = "dashed")
# text(x = mean(d_3), y = 140, label = round(mean(d_3),3), pos=2, col="red")
# legend('topright', legend = c("povprečje"),
#        col = c("red"), cex=0.6, lty=c("dashed"))

par(mfrow=c(2,2))

hist(a_10000, xlim = c(min(a_10000)-0.05, max(a_10000)+0.05),
     ylim = c(0,250), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, d = 1")
abline(v = mean(a_10000), col = "red", lty = "dashed")
text(x = mean(a_10000), y = 240, label = round(mean(a_10000),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(d_2, xlim = c(min(d_2)-0.05, max(d_2)+0.05),
     ylim = c(0,200), xlab = "Največje število žog v košu",
     main = "Delno naključno, d = 2")
abline(v = mean(d_2), col = "red", lty = "dashed")
text(x = mean(d_2), y = 190, label = round(mean(d_2),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(d_4, xlim = c(min(d_4)-0.05, max(d_4)+0.05),
     ylim = c(0,150), xlab = "Največje število žog v košu",
     main = "Delno naključno, d = 4")
abline(v = mean(d_4), col = "red", lty = "dashed")
text(x = mean(d_4), y = 140, label = round(mean(d_4),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

#################################################
# N = 2n, 3n
#################################################

# uvoz podatokv
n1_1 <- a_1000
n2_1 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_2000_1.csv")[1]))
n3_1 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_3000_1.csv")[1]))
n10_1 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_10000_1.csv")[1]))

n1_2 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_1000_2.csv")[1]))
n2_2 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_2000_2.csv")[1]))
n3_2 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_3000_2.csv")[1]))
n10_2 <- as.numeric(unlist(read.csv("najvecja_zasedenost_1000_10000_2.csv")[1]))

# grafi

par(mfrow=c(1,1))
par(mfrow=c(1,3))

hist(n1_1, xlim = c(min(n1_1)-0.05, max(n1_1)+0.05),
     ylim = c(0,200), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = n")
abline(v = mean(n1_1), col = "red", lty = "dashed")
text(x = mean(n1_1), y = 190, label = round(mean(n1_1),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(n2_1, xlim = c(min(n2_1)-0.05, max(n2_1)+0.05),
     ylim = c(0,40), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = 2n")
abline(v = mean(n2_1), col = "red", lty = "dashed")
text(x = mean(n2_1), y = 35, label = round(mean(n2_1),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(n3_1, xlim = c(min(n3_1)-0.05, max(n3_1)+0.05),
     ylim = c(0,40), xlab = "Največje število žog v košu",
     main = "Popolnoma naključno, N = 3n")
abline(v = mean(n3_1), col = "red", lty = "dashed")
text(x = mean(n3_1), y = 35, label = round(mean(n3_1),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

# hist(n10_1, xlim = c(min(n10_1)-0.05, max(n10_1)+0.05),
#      ylim = c(0,40), xlab = "Največje število žog v košu",
#      main = "Popolnoma naključno, N = 3n")
# abline(v = mean(n10_1), col = "red", lty = "dashed")
# text(x = mean(n10_1), y = 35, label = round(mean(n10_1),3), pos=2, col="red")
# legend('topright', legend = c("povprečje"),
#        col = c("red"), cex=0.6, lty=c("dashed"))

##########

hist(n1_2, breaks = 6, xlim = c(min(n1_2)-0.05, max(n1_2)+0.05),
     ylim = c(0,60), xlab = "Največje število žog v košu",
     main = "Delno naključno, N = n")
abline(v = mean(n1_2), col = "red", lty = "dashed")
text(x = mean(n1_2), y = 55, label = round(mean(n1_2),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(n2_2, xlim = c(min(n2_2)-0.05, max(n2_2)+0.05),
     ylim = c(0,40), xlab = "Največje število žog v košu",
     main = "Delno naključno, N = 2n")
abline(v = mean(n2_2), col = "red", lty = "dashed")
text(x = mean(n2_2), y = 35, label = round(mean(n2_2),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

hist(n3_2, xlim = c(min(n3_2)-0.05, max(n3_2)+0.05),
     ylim = c(0,40), xlab = "Največje število žog v košu",
     main = "Delno naključno, N = 3n")
abline(v = mean(n3_2), col = "red", lty = "dashed")
text(x = mean(n3_2), y = 35, label = round(mean(n3_2),3), pos=2, col="red")
legend('topright', legend = c("povprečje"),
       col = c("red"), cex=0.6, lty=c("dashed"))

# hist(n10_2, xlim = c(min(n10_2)-0.05, max(n10_2)+0.05),
#      ylim = c(0,40), xlab = "Največje število žog v košu",
#      main = "Popolnoma naključno, N = 3n")
# abline(v = mean(n10_2), col = "red", lty = "dashed")
# text(x = mean(n10_2), y = 35, label = round(mean(n10_2),3), pos=2, col="red")
# legend('topright', legend = c("povprečje"),
#        col = c("red"), cex=0.6, lty=c("dashed"))

#################################################
# casovna analiza
#################################################
