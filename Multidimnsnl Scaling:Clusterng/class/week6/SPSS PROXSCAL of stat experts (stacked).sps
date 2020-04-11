﻿* Encoding: UTF-8.
TITLE SPSS PROXSCAL of Corter & Carroll (1990) statistical techniques similarities.
DATA LIST 
    /1 MANOVA 1 multRegr 3 PCA  5 factor  7 canCorr 9 discrim 10 cluster 11 MDS 12 ANOVA 13 logLin 14 logRegr 15. 
BEGIN DATA 
 
2 
2 2 
2 2 8 
6 7 4 4 
8 6 3 2 3 
3 4 7 8 5 3 
3 4 8 8 5 3 8 
5 3 1 1 2 1 1 1 
6 8 1 2 4 5 3 2 8 
6 8 1 3 5 8 1 2 8 8 
 
7 
4 2 
2 3 9 
8 4 5 4 
8 6 3 4 8 
1 2 5 7 3 4 
1 2 8 8 3 2 6 
7 7 1 1 4 3 2 1 
5 2 1 1 4 2 1 1 6 
4 7 2 2 4 6 3 1 6 8 
 
9 
3 1 
1 1 8 
9 3 1 1 
9 5 1 1 9 
1 1 5 5 1 1 
1 1 5 7 1 1 7 
9 9 1 1 2 7 1 1 
2 2 1 1 3 3 1 1 2 
6 6 1 1 6 6 1 1 7 8 
END DATA.


PROXSCAL VARIABLES=MANOVA multRegr PCA factor canCorr discrim cluster MDS ANOVA logLin logRegr
  /SHAPE=LOWER
  /INITIAL=SIMPLEX
  /CONDITION=MATRIX
  /TRANSFORMATION=INTERVAL
  /PROXIMITIES=SIMILARITIES
  /MODEL=WEIGHTED
  /CRITERIA=DIMENSIONS(2,2) MAXITER(100) DIFFSTRESS(.0001) MINSTRESS(.0001)
  /PRINT=COMMON WEIGHTS STRESS 
  /PLOT=COMMON WEIGHTS.


PROXSCAL VARIABLES=MANOVA multRegr PCA factor canCorr discrim cluster MDS ANOVA logLin logRegr
  /SHAPE=LOWER
  /INITIAL=SIMPLEX
  /CONDITION=MATRIX
  /TRANSFORMATION=INTERVAL
  /PROXIMITIES=SIMILARITIES
  /MODEL=WEIGHTED
  /CRITERIA=DIMENSIONS(3,3) MAXITER(100) DIFFSTRESS(.0001) MINSTRESS(.0001)
  /PRINT=COMMON WEIGHTS STRESS 
  /PLOT=COMMON WEIGHTS.


PROXSCAL VARIABLES=MANOVA multRegr PCA factor canCorr discrim cluster MDS ANOVA logLin logRegr
  /SHAPE=LOWER
  /INITIAL=SIMPLEX
  /CONDITION=MATRIX
  /TRANSFORMATION=INTERVAL
  /PROXIMITIES=SIMILARITIES
  /MODEL=WEIGHTED
  /CRITERIA=DIMENSIONS(4,4) MAXITER(100) DIFFSTRESS(.0001) MINSTRESS(.0001)
  /PRINT=COMMON WEIGHTS STRESS 
  /PLOT=COMMON WEIGHTS.

PROXSCAL VARIABLES=MANOVA multRegr PCA factor canCorr discrim cluster MDS ANOVA logLin logRegr
  /SHAPE=LOWER
  /INITIAL=SIMPLEX
  /CONDITION=MATRIX
  /TRANSFORMATION=INTERVAL
  /PROXIMITIES=SIMILARITIES
  /MODEL=WEIGHTED
  /CRITERIA=DIMENSIONS(4,4) MAXITER(100) DIFFSTRESS(.0001) MINSTRESS(.0001)
  /PRINT=COMMON WEIGHTS STRESS 
  /PLOT=COMMON WEIGHTS.

PROXSCAL VARIABLES=MANOVA multRegr PCA factor canCorr discrim cluster MDS ANOVA logLin logRegr
  /SHAPE=LOWER
  /INITIAL=TORGERSON
  /CONDITION=MATRIX
  /TRANSFORMATION=INTERVAL
  /PROXIMITIES=SIMILARITIES
  /MODEL=WEIGHTED
  /CRITERIA=DIMENSIONS(2,4) MAXITER(100) DIFFSTRESS(.0001) MINSTRESS(.0001)
  /PRINT=COMMON WEIGHTS STRESS 
  /PLOT=COMMON WEIGHTS.

=====================================================
DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=dwk_gen_1 dwk_gen_2 dwk_gen_3 dwk_m_1 dwk_m_2 dwk_m_3 dwk_la_1 dwk_la_2 
    dwk_la_3
  /ORDER=ANALYSIS.

