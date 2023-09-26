## BIO8514 ECOLOGICAL STATISTICS
## 25 March 2021

## Michael Greenacre and Raul Primicerio

## PCLAB DAY4                                           

## CA, CCA, RDA, Triplots, Permutation tests


# Open file

library(feather)

# Import data 
data <- read_feather("/Users/mbd/phd/ScatteringModels/SSL_density.feather")
data<- read_feather("/Users/mbd/phd/ScatteringModels/SSL_density_spec.feather")



# divide data in two tables, environmental (xyz) and species (abcde)

xyz<-data[,6:9]			# table of environmental data (explanatory variables)

abcde<-data[,1:5]		# table of species abundance data (response variables)


# plot Pollution vs Depth with symbols size proportional to species abundance

symbols(xyz[,1:2],circles=abcde[,1],fg="red",inches=0.2) # plot circles with diameter proportional to species 'a' abundance


# Computing step 1

library(vegan)		# install and load package 'vegan' (for analysis of ecological data)

# Compute and plot species richness (S), diversity (H), and evenness (J)

S<-specnumber(abcde)	# S is species richness (number of species per sample)
symbols(xyz[,1:2],circles=S,inches=0.2)

H<-diversity(abcde)	# H is Shannon's diversity index
symbols(xyz[,1:2],circles=H,inches=0.2)


# plot species richness and add a trend line showing the depth/pollution gradient

plot(xyz[,c(2,1)],xlab="lon",ylab="lat",tcl=0.5,las=1,type="n")
symbols(xyz[,c(2,1)],circles=S,bg="gray",fg="white",cex.lab=1.2,inches=0.2,add=T)
abline(lm(xyz[,2]~xyz[,1]),lwd=2,lty=2,col="red")		# add the trend line
text(xyz[,c(2,1)],labels=rownames(data),col="blue",cex=0.8)	# add samples (sites) labels


# Computing step 2

# Compute Bray-Curtis dissimilarity

abcde.BC<-vegdist(abcde)	# Bray-Curtis dissimilarity

# Clustering
abcde.clust<-hclust(abcde.BC,"complete")		# hierarchical clustering based on 'complete' linkage
plot(abcde.clust,ylab="Dissimilarity",xlab="",sub="")	# plot dendrogram

# nMDS
library(MASS)
abcde.mds<-isoMDS(abcde.BC)		# non-metric multidimensional scaling
ordiplot(abcde.mds,type="t")		# map of results
ordisurf(abcde.mds,xyz[,2],add=T)	# regression surface isolines for pollution


# Computing step 3

# INDIRECT ORDINATION - PCA, CA

# PCA of environmental data
xyz.pca<-rda(scale(xyz)) # rda() of a single table (environmental data) calculates PCA 
xyz.pca			 # summary PCA results
plot(xyz.pca)		 # PCA biplot (in vegan biplots are performed by 'plot' function)

# CA of species abundance data
abcde.ca<-cca(abcde)	 # CA is computed with cca() of a single table (species data)
abcde.ca		 # summary of CA results
plot(abcde.ca)		 # biplot of CA results

library(ca)		# for more advanced CA features use 'ca' package
abcde.ca1<-ca(abcde)	# calculate CA of species abundance data
plot(abcde.ca1)		# biplot of CA results


# plot biplots of environment and species in the same graphic window
par(mfrow=c(1,2))
plot(xyz.pca)
plot(abcde.ca)


# DIRECT ORDINATION - CANONICAL CORRESPONDENCE ANALYSIS (CCA)

# Computing step 4

# CCA of species abundance as function of environmental data
abcde.cca<-cca(abcde,xyz)		# calculate a CCA of species abundance as function of environmental variables
abcde.cca				# summary of CCA results


# Computing step 5

# parts of inertia (variation in species abundance)

var.tot<-abcde.cca$tot.chi	   # total inertia (total variation in species abundance data)

var.env<-sum(abcde.cca$CCA$eig)    # inertia accounted by environmental (explanatory) variables 
100*var.env/var.tot		   # inertia accounted by environmental variables (expressed as % of total)

var.res<-sum(abcde.cca$CA$eig)     # inertia NOT accounted by environmental (explanatory) variables
100*var.res/var.tot		   # inertia NOT accounted by environmental variables (expressed as % of total)

var.CCAaxis1<-abcde.cca$CCA$eig[1] # inertia accounted by first CCA axis
100*var.CCAaxis1/var.tot	   # expressed as % of total

var.CCAaxis2<-abcde.cca$CCA$eig[2] # inertia accounted by second CCA axis
100*var.CCAaxis2/var.tot	   # expressed as % of total


# Computing step 6

# plot CCA model and data 

plot(abcde.cca)					# triplot of CCA results (vegan default)

plot(abcde.cca, display = c("lc","sp","cn"))	# triplot of CCA results (standard configuration)
plot(abcde.cca, display = c("lc","sp","cn"), xlab="CCA I (36.7%)", ylab="CCA II (6.5%)") # display % variation accounted by axes I and II
plot(abcde.cca, display = c("wa","sp","cn"), xlab="CCA I (36.7%)", ylab="CCA II (6.5%)") # display % variation accounted by axes I and II

# superimpose isolines (GAM surface) on CCA plots

plot(abcde.cca, display = c("lc","sp","cn"))	  # triplot of CCA results (standard configuration)
ordisurf(abcde.cca,display="lc",xyz[,1],add=T)    # pollution isolines

plot(abcde.cca, display = c("lc","sp","cn"))	  # triplot of CCA results (standard configuration)
ordisurf(abcde.cca,display="lc",abcde[,2],add=T)  # species (a) abundance isolines


# Computing step 7
# test model by permutation

anova(abcde.cca)				# MonteCarlo permutation test of CCA model


# Summary of CCA (4 lines of code): computation, summary statistics, plot, permutation test

abcde.cca<-cca(abcde,xyz) 			# i. computation
abcde.cca		  			# ii. summary statistics
plot(abcde.cca, display = c("lc","sp","cn"))	# iii. plot (may add isolines with ordisurf())
anova(abcde.cca)				# iv. permutation test


# Explicit specification of CCA model

x<-data[,6]; y<-data[,7]; z<-data[,8]; sed<-data[,9] # label explanatory variables

abcde.cca1<-cca(abcde~x+y+z)		# as in abcde.cca model
plot(abcde.cca1,scaling=3)

abcde.cca2<-cca(abcde~x+y+z+sed)	# add categorical variable 'sediment'
plot(abcde.cca2,scaling=3)



# EXCERCIZE 1 - Dataset in file 'FishEcology.xls'
# Start a new R session

# Computing step 0

# Import data 
# diet<-read.table("clipboard")   # import from file 'FishEcology.xlw' table on Fish diet (PlankCop, PlankClad, etc.)
diet <- read.table("http://www.econ.upf.edu/~michael/BIO8514/PClabs/fishdiet.txt")

# check your data
summary(diet)
pairs(diet[,-c(1:2)])

attach(diet)

# Import fish morphometry data 
morph <- read.table("http://www.econ.upf.edu/~michael/BIO8514/PClabs/fishmorph.txt")

# morph<-read.table("clipboard",dec=",")	# import table on Fish morphometry from Excel file

Length<-c(245.00,223.00,242.00,248.00,251.00,231.00,222.00,240.00,200.00,225.00,232.00,
	  210.00, 216.00,211.00,236.00,232.00,222.00,200.00,233.00,211.00,222.00,226.00,
	  226.00,248.00,192.00,203.00,194.00,201.00,244.00,191.00,207.00,205.00,191.00,
	  216.00,218.00,231.00,219.00,189.00,224.00,210.00,246.00,197.00,204.00,198.00,
	  196.00,217.00,206.00,200.00,202.00,231.00,219.00,229.00,230.00,227.00,237.00,
	  232.00,240.00,222.00,238.00,232.00,235.00,240.00,232.00,194.00,215.00,202.00,
	  210.00,207.00,195.00,237.00,231.00,226.00,210.00,237.00,200.00)


# Computing step 1

# plot benthic prey vs planktonic prey, separating (colour coding) between habitats
plot(log(BenthCrust+1),log(PlankClad+1),pch=21,bg = c("red", "blue")[as.factor(Habitat)])
abline(lm(log(BenthCrust+1)~log(PlankClad+1)))


# PRINCIPAL COMPONENTS ANALYSIS (PCA)

# Computing step 2

# PCA of fish morphometry

morph.pca<-rda(morph) 	 	          # PCA of fish morphometry 
plot(morph.pca)          	          # biplot of morphometry - note that PCA1 relates to all variables (size)
ordisurf(morph.pca,Length,col="orange",add=T)  	  # PCA1 is a 'size' component, to look for shape see other PC axes

morph.pca$CA$u[,1]<--morph.pca$CA$u[,1]	  # flipping axis 1 - scores
morph.pca$CA$v[,1]<--morph.pca$CA$v[,1]	  # flipping axis 1 - factor loadings
plot(morph.pca)          	          # biplot of morphometry - note that PCA1 relates to all variables (size)
ordisurf(morph.pca,Length)  		  # PCA1 is a 'size' component, to look for shape see other PC axes

plot(morph.pca,choice=2:3,scaling=3)		  # plot PCA axes 2 and 3


# CORRESPONDENCE ANALYSIS (CA)

# Computing step 3

# CA of fish diet
library(ca)					# load package 'ca'
diet.ca<-ca(diet[,-c(1:2)])			# perform Correspondence Analysis, assign results to 'diet.ca'
summary(diet.ca)				# summary ca results
plot(diet.ca)					# biplot of CA results

# regular CA of all columns including "empty"
plot(ca(diet[,-c(1:2)]),labels=c(1,1))

# contribution biplot version
plot(ca(diet[,-c(1:2)]), labels=c(1,1), map="rowgreen")

# subset CA, ignoring "empty" (here I create ca object first)
# then regular map and contribution biplot version
diet.ca <- ca(diet[,-c(1:2)], subsetcol=1:7) 		# subset CA
plot(diet.ca, labels=c(1,1))			# regular CA biplot
plot(diet.ca, labels=c(1,1), map="rowgreen")	# contribution CA biplot


# CANONICAL CORRESPONDENCE ANALYSIS (CCA)
# Computing step 4

# CCA of fish diet as function of morphometry
library(vegan)					# load package 'vegan'

diet.ca<-cca(diet[,-c(1:2)])				# 'vegan' function cca() runs a CA if you only include one matrix in its argument
plot(diet.ca)					# ?plot.cca - plot() of a CA vegan object produces a biplot
 
diet.cca<-cca(diet[,-c(1:2)],morph[,c(2,7,26)])	# perform CCA of diet against morphology (variables BR2,Snkurv1,BukFettf)
diet.cca					# summary of CCA results
plot(diet.cca,scaling=3)			# triplot of CCA results
anova(diet.cca)					# permutation test of CCA model

