# Reading the file i want to Pre-process

Dataset = read.csv("kidney_disease.csv", stringsAsFactors = FALSE)


View(Dataset)

# Fixing proper formatting

Dataset$pcv <- as.numeric(Dataset$pcv) #changing Charter to integer/numbers

Dataset$wc <- as.numeric(Dataset$wc) #changing Charter to integer/numbers

Dataset$rc <- as.numeric(Dataset$rc) #changing Charter to integer/numbers

# Corrupted data / missing data for integer/numbers

mean_age<- as.integer(mean(Dataset$age, na.rm = TRUE)) #now replacing missing data with average of the column
Dataset$age[is.na(Dataset$age)] = mean_age #If NA accouter set it to average.

mean_bp <- as.integer(mean(Dataset$bp, na.rm = TRUE)) 
Dataset$bp[is.na(Dataset$bp)] = mean_bp 

mean_sg <- as.integer(mean(Dataset$sg, na.rm = TRUE)) 
Dataset$sg[is.na(Dataset$sg)] = mean_sg

mean_al <- as.integer(mean(Dataset$al, na.rm = TRUE)) 
Dataset$al[is.na(Dataset$al)] = mean_al

mean_su <- as.integer(mean(Dataset$su, na.rm = TRUE)) 
Dataset$su[is.na(Dataset$su)] = mean_su

mean_bgr <- as.integer(mean(Dataset$bgr, na.rm = TRUE)) 
Dataset$bgr[is.na(Dataset$bgr)] = mean_bgr

mean_bu <- as.integer(mean(Dataset$bu, na.rm = TRUE)) 
Dataset$bu[is.na(Dataset$bu)] = mean_bu

mean_sc <- as.integer(mean(Dataset$sc, na.rm = TRUE)) 
Dataset$sc[is.na(Dataset$sc)] = mean_sc

mean_sod <- as.integer(mean(Dataset$sod, na.rm = TRUE)) 
Dataset$sod[is.na(Dataset$sod)] = mean_sod

mean_pot <- as.integer(mean(Dataset$pot, na.rm = TRUE)) 
Dataset$pot[is.na(Dataset$pot)] = mean_pot

mean_hemo <- as.integer(mean(Dataset$hemo, na.rm = TRUE)) 
Dataset$hemo[is.na(Dataset$hemo)] = mean_hemo

mean_pcv <- as.integer(mean(Dataset$pcv, na.rm = TRUE)) 
Dataset$pcv[is.na(Dataset$pcv)] = mean_pcv

mean_wc <- as.integer(mean(Dataset$wc, na.rm = TRUE)) 
Dataset$wc[is.na(Dataset$wc)] = mean_wc

mean_rc <- as.integer(mean(Dataset$rc, na.rm = TRUE)) 
Dataset$rc[is.na(Dataset$rc)] = mean_rc

# Changing (yes/normal/present/good/ckd and no/abnormal/notpresent/poor/notckd) to 1 and 0 so it's easier for machine  to read.

Dataset$rbc = factor(Dataset$rbc, levels = c("normal", "abnormal"), labels = c(1, 0)) #changing yes or no to 1 and 0 so it's easier for machine  to read.
Dataset$rbc[is.na(Dataset$rbc)] <- 0 # has NA or NULL so fixing to 0

Dataset$pc = factor(Dataset$pc, levels = c("normal", "abnormal"), labels = c(1, 0)) 
Dataset$pc[is.na(Dataset$pc)] <- 0 # has NA or NULL so fixing to 0

Dataset$pcc = factor(Dataset$pcc, levels = c("present", "notpresent"), labels = c(1, 0)) 
Dataset$pcc[is.na(Dataset$pcc)] <- 0 # has NA or NULL so fixing to 0

Dataset$ba = factor(Dataset$ba, levels = c("present", "notpresent"), labels = c(1, 0)) 
Dataset$ba[is.na(Dataset$ba)] <- 0 # has NA or NULL so fixing to 0

Dataset$htn = factor(Dataset$htn, levels = c("yes", "no"), labels = c(1, 0))
Dataset$htn[is.na(Dataset$htn)] <- 0 # has NA or NULL so fixing to 0

Dataset$dm = factor(Dataset$dm, levels = c("yes", "no"), labels = c(1, 0))
Dataset$dm[is.na(Dataset$dm)] <- 0 # has NA or NULL so fixing to 0

Dataset$cad = factor(Dataset$cad, levels = c("yes", "no"), labels = c(1, 0))
Dataset$cad[is.na(Dataset$cad)] <- 0 # has NA or NULL so fixing to 0

Dataset$appet = factor(Dataset$appet, levels = c("good", "poor"), labels = c(1, 0))
Dataset$appet[is.na(Dataset$appet)] <- 0 # has NA or NULL so fixing to 0

Dataset$pe = factor(Dataset$pe, levels = c("yes", "no"), labels = c(1, 0))
Dataset$pe[is.na(Dataset$pe)] <- 0 # has NA or NULL so fixing to 0

Dataset$ane = factor(Dataset$ane, levels = c("yes", "no"), labels = c(1, 0)) 
Dataset$ane[is.na(Dataset$ane)] <- 0 # has NA or NULL so fixing to 0

Dataset$classification = factor(Dataset$classification, levels = c("ckd", "notckd"), labels = c(1, 0)) 
Dataset$classification[is.na(Dataset$classification)] <- 0



str(Dataset) #shows structure on this data.

head(Dataset, 30) #shows me 30 max from the 400 objects.

library(ggplot2) #launching ggplot


#Using GGPLOT2
g <- ggplot(Dataset, aes(x=sod, y=bp)) + geom_point(aes(col=age,size=su)) + coord_cartesian(xlim=c(0,163), ylim=c(0, 180)) + labs(title="sodium(sod) Vs Blood pressure(bp)", subtitle="Chronic Kidney Disease Data Set", y="Blood pressure", x="Sodium", col="Age", size="Suger 1-5", caption="Dr.P.Soundarapandian.M.D.,D.M")
plot(g)

