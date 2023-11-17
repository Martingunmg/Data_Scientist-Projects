
#input by user for 3 different days in a month for 10 cities

var1 <- readline(prompt = "input temperature for Stockholm:");
var1_2 <- readline(prompt = "input temperature for Stockholm:")
var1_3 <- readline(prompt = "input temperature for Stockholm:")
var2 <- readline(prompt = "input temperature for Oslo:");
var2_2 <- readline(prompt = "input temperature for Oslo:");
var2_3 <- readline(prompt = "input temperature for Oslo:");
var3 <- readline(prompt = "input temperature for Amsterdam:");
var3_2 <- readline(prompt = "input temperature for Amsterdam:");
var3_3 <- readline(prompt = "input temperature for Amsterdam:");
var4 <- readline(prompt = "input temperature for London:");
var4_2 <- readline(prompt = "input temperature for London:");
var4_3 <- readline(prompt = "input temperature for London:");
var5 <- readline(prompt = "input temperature for Paris:");
var5_2 <- readline(prompt = "input temperature for Paris:");
var5_3 <- readline(prompt = "input temperature for Paris:");
var6 <- readline(prompt = "input temperature for Berlin:");
var6_2 <- readline(prompt = "input temperature for Berlin:");
var6_3 <- readline(prompt = "input temperature for Berlin:");
var7 <- readline(prompt = "input temperature for Madrid:");
var7_2 <- readline(prompt = "input temperature for Madrid:")
var7_3 <- readline(prompt = "input temperature for Madrid:")
var8 <- readline(prompt = "input temperature for Miami:");
var8_2 <- readline(prompt = "input temperature for Miami:");
var8_3 <- readline(prompt = "input temperature for Miami:");
var9 <- readline(prompt = "input temperature for New York:");
var9_2 <- readline(prompt = "input temperature for New York:");
var9_3 <- readline(prompt = "input temperature for New York:");
var10 <- readline(prompt = "input temperature for Los Angeles:");
var10_2 <- readline(prompt = "input temperature for Los Angeles:");
var10_3 <- readline(prompt = "input temperature for Los Angeles:");

# making it to numeric so it can work with numbers.
My_Stockholm <-c(var1,var1_2,var1_3)
a <- as.numeric(My_Stockholm)

My_Oslo <-c(var2,var2_2,var2_3)
b <- as.numeric(My_Oslo)

My_Amsterdam <-c(var3,var3_2,var3_3)
c <- as.numeric(My_Amsterdam)

My_London <-c(var4,var4_2,var4_3)
d <- as.numeric(My_London)

My_Paris <-c(var5,var5_2,var5_3)
e <- as.numeric(My_Paris)

My_Berlin <-c(var6,var6_2,var6_3)
f <- as.numeric(My_Berlin)

My_Madrid <-c(var7,var7_2,var7_3)
g <- as.numeric(My_Madrid)

My_Miami <-c(var8,var8_2,var8_3)
h <- as.numeric(My_Miami)

My_New_York <-c(var9,var9_2,var9_3)
j <- as.numeric(My_New_York)

My_Los_Angeles <-c(var10,var10_2,var10_3)
k <- as.numeric(My_Los_Angeles)

 #Part A)  By using manual calculations did this only with Stockholm
#if else if else statement to see witch of them 3 is minimum the prints if the statement filed
if (var1 < var1_2 && var1 < var1_3) { 
  cat(var1, " Minimum Temperature for Stockholm\n")
} else if (var1_2 < var1 && var1_2 < var1_3) {
  cat(var1_2, " Minimum Temperature for Stockholm\n")
} else {
  cat(var1_3, " Minimum Temperature for Stockholm\n")
}

#if else if else Maximum to see witch of them 3 is minimum the prints if the statement filed

if (var1 > var1_2 && var1 > var1_3) {
  cat(var1, " Maximum Temperature for Stockholm\n")
} else if (var1_2 > var1 && var1_2 > var1_3) {
  cat(var1_2, " Maximum Temperature for Stockholm\n")
} else {
  cat(var1_3, " Maximum Temperature for Stockholm\n")
}

 #Average
b <- 3
avg = a/b
print(paste("average Temperature for Stockhom\n:", avg))


 # Part B) By using the in-built functions in R

print(paste("Minimum Temperature for Stockholm:", min(a)))
print(paste("Maximum Temperature for Stockholm:", max(a)))
print(paste("average Temperature for Stockholm:", mean(a)))

print(paste("Minimum Temperature for Oslo:", min(b)))
print(paste("Maximum Temperature for Oslo:", max(b)))
print(paste("average Temperature for Oslo:", mean(b)))

print(paste("Minimum Temperature for Amsterdam:", min(c)))
print(paste("Maximum Temperature for Amsterdam:", max(c)))
print(paste("average Temperature for Amsterdam:", mean(c)))

print(paste("Minimum Temperature for London:", min(d)))
print(paste("Maximum Temperature for London:", max(d)))
print(paste("average Temperature for London:", mean(d)))

print(paste("Minimum Temperature for Paris:", min(e)))
print(paste("Maximum Temperature for Paris:", max(e)))
print(paste("average Temperature for Paris:", mean(e)))

print(paste("Minimum Temperature for Berlin:", min(f)))
print(paste("Maximum Temperature for Berlin:", max(f)))
print(paste("average Temperature for Berlin:", mean(f)))

print(paste("Minimum Temperature for Madrid:", min(g)))
print(paste("Maximum Temperature for Madrid:", max(g)))
print(paste("average Temperature for Madrid:", mean(g)))

print(paste("Minimum Temperature for Miami:", min(h)))
print(paste("Maximum Temperature for Miami:", max(h)))
print(paste("average Temperature for Miami:", mean(h)))

print(paste("Minimum Temperature for New York:", min(j)))
print(paste("Maximum Temperature for New York:", max(j)))
print(paste("average Temperature for New York:", mean(j)))

print(paste("Minimum Temperature for Los Angeles:", min(k)))
print(paste("Maximum Temperature for Los Angeles:", max(k)))
print(paste("average Temperature for Los Angeles:", mean(k)))


