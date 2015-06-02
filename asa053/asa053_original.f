      SUBROUTINE WSHRT(D, N, NP, NNP, SB, SA)
C
C     ALGORITHM AS 53  APPL. STATIST. (1972) VOL.21, NO.3
C
C     Wishart variate generator.  On output, SA is an upper-triangular
C     matrix of size NP * NP (written in linear form, column ordered)
C     whose elements have a Wishart(N, SIGMA) distribution.
C
C     D is an upper-triangular array such that SIGMA = D'D (see AS 6)
C
C     Auxiliary function required: a random no. generator called RAND.
C     The Wichmann & Hill generator is included here.   It should be
C     initialized in the calling program.
C
      INTEGER N, NP, NNP
      REAL D(NNP), SB(NNP), SA(NNP)
C
C     Local variables
C
      INTEGER K, NS, I, J, NR, IP, NQ, II
      REAL DF, U1, U2, RN, C
      REAL ZERO, ONE, TWO, NINE
      DATA ZERO /0.0/, ONE /1.0/, TWO /2.0/, NINE /9.0/
C
      K = 1
    1 CALL RNORM(U1, U2)
C
C     Load SB with independent normal (0, 1) variates
C
      SB(K) = U1
      K = K + 1
      IF (K .GT. NNP) GO TO 2
      SB(K) = U2
      K = K + 1
      IF (K .LE. NNP) GO TO 1
    2 NS = 0
C
C     Load diagonal elements with square root of chi-square variates
C
      DO 3 I = 1, NP
        DF = N - I + 1
        NS = NS + I
        U1 = TWO / (NINE * DF)
        U2 = ONE - U1
        U1 = SQRT(U1)
C
C     Wilson-Hilferty formula for approximating chi-square variates
C
        SB(NS) = SQRT(DF * (U2 + SB(NS) * U1)**3)
    3 CONTINUE
C
      RN = N
      NR = 1
      DO 5 I = 1, NP
        NR = NR + I - 1
        DO 5 J = I, NP
          IP = NR
          NQ = (J*J - J) / 2 + I - 1
          C = ZERO
          DO 4 K = I, J
            IP = IP + K - 1
	    NQ = NQ + 1
	    C = C + SB(IP) * D(NQ)
    4     CONTINUE
	  SA(IP) = C
    5 CONTINUE
C
      DO 7 I = 1, NP
	II = NP - I + 1
	NQ = NNP - NP
	DO 7 J = 1, I
	  IP = (II*II - II) / 2
	  C = ZERO
	  DO 6 K = I, NP
	    IP = IP + 1
	    NQ = NQ + 1
	    C = C + SA(IP) * SA(NQ)
    6     CONTINUE
	  SA(NQ) = C / RN
	  NQ = NQ - 2 * NP + I + J - 1
    7 CONTINUE
C
      RETURN
      END
C
C
      SUBROUTINE RNORM(U1, U2)
C
C     ALGORITHM AS 53.1  APPL. STATIST. (1972) VOL.21, NO.3
C
C     Sets U1 and U2 to two independent standardized random normal
C     deviates.   This is a Fortran version of the method given in
C     Knuth(1969).
C
C     Function RAND must give a result randomly and rectangularly
C     distributed between the limits 0 and 1 exclusive.
C
      REAL U1, U2
      REAL RAND
C
C     Local variables
C
      REAL X, Y, S, ONE, TWO
      DATA ONE /1.0/, TWO /2.0/
C
    1 X = RAND()
      Y = RAND()
      X = TWO * X - ONE
      Y = TWO * Y - ONE
      S = X * X + Y * Y
      IF (S .GT. ONE) GO TO 1
      S = SQRT(- TWO * LOG(S) / S)
      U1 = X * S
      U2 = Y * S
      RETURN
      END
