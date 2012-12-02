function [ b, ncalc ] = ribesl ( x, alpha, nb, ize )

%*****************************************************************************80
%
%% RIBESL calculates I Bessel function with non-integer orders.
%
%  Discussion:
%
%    This routine calculates Bessel functions I SUB(N+ALPHA) (X)
%    for non-negative argument X, and non-negative order N+ALPHA,
%    with or without exponential scaling.
%
%  Acknowledgement:
%
%    This program is based on a program written by David
%    Sookne that computes values of the Bessel functions J or
%    I of real argument and integer order.  Modifications include
%    the restriction of the computation to the I Bessel function
%    of non-negative real argument, the extension of the computation
%    to arbitrary positive order, the inclusion of optional
%    exponential scaling, and the elimination of most underflow.
%
%    In case of an error, NCALC will not equal NB, and not all I's are
%    calculated to the desired accuracy.
%
%    If NCALC < 0:  An argument is out of range. For example,
%    NB <= 0, IZE is not 1 or 2, or IZE = 1 and EXPARG <= ABS(X)
%    In this case, the B-vector is not calculated, and NCALC is
%    set to MIN(NB,0)-1 so that NCALC /= NB.
%
%    If 0 < NCALC < NB, then not all requested function values could
%    be calculated accurately.  This usually occurs because NB is
%    much larger than ABS(X).  In this case, B(N) is calculated
%    to the desired accuracy for N <= NCALC, but precision
%    is lost for NCALC < N <= NB.  If B(N) does not vanish
%    for NCALC < N (because it is too small to be represented),
%    and B(N)/B(NCALC) = 10**(-K), then only the first NSIG-K
%    significant figures of B(N) can be trusted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2007
%
%  Author:
%
%    Original FORTRAN77 version by William Cody.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Frank Olver, David Sookne,
%    A Note on Backward Recurrence Algorithms,
%    Mathematics of Computation,
%    Volume 26, 1972, pages 941-947.
%
%    David Sookne,
%    Bessel Functions of Real Argument and Integer Order,
%    NBS Journal of Research B,
%    Volume 77B, 1973, pages 125-132.
%
%    William Cody,
%    Algorithm 597:
%    Sequence of Modified Bessel Functions of the First Kind,
%    ACM Transactions of Mathematical Software,
%    Volume 9, Number 2, June 1983, pages 242-245.
%
%  Parameters:
%
%    Input, real X, the argument for which the functions
%    are to be calculated.
%
%    Input, real ALPHA,the fractional part of the order
%    for which the functions are to be calculated.
%    0 <= ALPHA < 1.0.
%
%    Input, integer NB, the number of functions to be calculated.
%    The first function calculated is of order ALPHA, and the
%    last is of order (NB - 1 + ALPHA).  1 <= NB.
%
%    Input, integer IZE, scaling option.
%    1, unscaled I's are to calculated,
%    2, exponentially scaled I's are to be calculated.
%
%    Output, real B(NB), the values of the functions
%    I(ALPHA,X) through I(NB-1+ALPHA,X), with scaling if requested.
%
%    Output, integer NCALC, error indicator.
%    If NCALC = NB, then all the requested values were calculated
%    to the desired accuracy.
%
%  Local Parameeters:
%
%    BETA, the radix for the floating-point system.
%
%    MINEXP, smallest representable power of BETA.
%
%    MAXEXP, smallest power of BETA that overflows
%
%    IT, number of bits in the mantissa of a working precision variable.
%
%    NSIG, decimal significance desired.  Should be set to
%    INT(LOG10(2)*IT+1).  Setting NSIG lower will result
%    in decreased accuracy while setting NSIG higher will
%    increase CPU time without increasing accuracy.  The
%    truncation error is limited to a relative error of
%    T=.5*10^(-NSIG).
%
%    ENTEN, 10.0^K, where K is the largest integer such that
%    ENTEN is machine-representable in working precision
%
%    ENSIG, 10.0^NSIG
%
%    RTNSIG, 10.0^(-K) for the smallest integer K such that
%    NSIG/4 <= K.
%
%    ENMTEN, smallest ABS(X) such that X/4 does not underflow
%
%    XLARGE, upper limit on the magnitude of X when IZE=2.  Bear
%    in mind that if ABS(X)=N, then at least N iterations
%    of the backward recursion will be executed.  The value
%    of 10.0^4 is used on every machine.
%
%    EXPARG, largest working precision argument that the library
%    EXP routine can handle and upper limit on the
%    magnitude of X when IZE=1; approximately log(BETA^MAXEXP).
%
%    Approximate values for some important machines are:
%
%                        beta       minexp      maxexp       it
%
%  CRAY-1        (S.P.)    2        -8193        8191        48
%  Cyber 180/855
%    under NOS   (S.P.)    2         -975        1070        48
%  IEEE (IBM/XT,
%    SUN, etc.)  (S.P.)    2         -126         128        24
%  IEEE (IBM/XT,
%    SUN, etc.)  (D.P.)    2        -1022        1024        53
%  IBM 3033      (D.P.)   16          -65          63        14
%  VAX           (S.P.)    2         -128         127        24
%  VAX D-Format  (D.P.)    2         -128         127        56
%  VAX G-Format  (D.P.)    2        -1024        1023        53
%
%
%                        NSIG       ENTEN       ENSIG      RTNSIG
%
% CRAY-1        (S.P.)    15       1.0E+2465   1.0E+15     1.0E-4
% Cyber 180/855
%   under NOS   (S.P.)    15       1.0E+322    1.0E+15     1.0E-4
% IEEE (IBM/XT,
%   SUN, etc.)  (S.P.)     8       1.0E+38     1.0E+8      1.0E-2
% IEEE (IBM/XT,
%   SUN, etc.)  (D.P.)    16       1.0D+308    1.0D+16     1.0D-4
% IBM 3033      (D.P.)     5       1.0D+75     1.0D+5      1.0D-2
% VAX           (S.P.)     8       1.0E+38     1.0E+8      1.0E-2
% VAX D-Format  (D.P.)    17       1.0D+38     1.0D+17     1.0D-5
% VAX G-Format  (D.P.)    16       1.0D+307    1.0D+16     1.0D-4
%
%
%                         ENMTEN      XLARGE   EXPARG
%
% CRAY-1        (S.P.)   1.84E-2466   1.0E+4    5677
% Cyber 180/855
%   under NOS   (S.P.)   1.25E-293    1.0E+4     741
% IEEE (IBM/XT,
%   SUN, etc.)  (S.P.)   4.70E-38     1.0E+4      88
% IEEE (IBM/XT,
%   SUN, etc.)  (D.P.)   8.90D-308    1.0D+4     709
% IBM 3033      (D.P.)   2.16D-78     1.0D+4     174
% VAX           (S.P.)   1.17E-38     1.0E+4      88
% VAX D-Format  (D.P.)   1.17D-38     1.0D+4      88
% VAX G-Format  (D.P.)   2.22D-308    1.0D+4     709
%
  const = 1.585;
  enmten = 8.9E-308;
  ensig = 1.0E+16;
  enten = 1.0E+308;
  exparg = 709.0;
  half = 0.5;
  nsig = 16;
  one = 1.0;
  rtnsig = 1.0E-04;
  two = 2.0;
  xlarge = 1.0E+04;
  zero = 0.0;
%
%  Check for X, NB, OR IZE out of range.
%
  if ( nb <= 0 )
    ncalc = min ( nb, 0 ) - 1;
    return
  end

  if ( x < 0.0 )
    ncalc = min ( nb, 0 ) - 1;
    return
  end

  if ( alpha < 0.0D+00 )
    ncalc = min ( nb, 0 ) - 1;
    return
  end

  if ( 1.0D+00 <= alpha )
    ncalc = min ( nb, 0 ) - 1;
    return
  end

  if ( ize == 1 & exparg < x )
    ncalc = min ( nb, 0 ) - 1;
    return
  end

  if ( ize == 2 & xlarge < x )
    ncalc = min ( nb, 0 ) - 1;
    return
  end
%
%  Use 2-term ascending series for small X.
%
  ncalc = nb;
  magx = floor ( x );
%
%  Initialize the forward sweep, the P-sequence of Olver.
%
  if ( rtnsig <= x )

    nbmx = nb - magx;
    n = magx + 1;
    en = ( n + n ) + ( alpha + alpha );
    plast = one;
    p = en / x;
%
%  Calculate general significance test.
%
    test = ensig + ensig;

    if ( 5 * nsig < 2 * magx )
      test = sqrt ( test * p );
    else
      test = test / const^magx;
    end
%
%  Calculate P-sequence until N = NB-1.  Check for possible overflow.
%
    flag = 0;

    if ( 3 <= nbmx )

      tover = enten / ensig;
      nstart = magx + 2;
      nend = nb - 1;

      for k = nstart : nend

        n = k;
        en = en + two;
        pold = plast;
        plast = p;
        p = en * plast / x + pold;
%
%  To avoid overflow, divide P-sequence by TOVER.  Calculate
%  P-sequence until 1 < ABS(P).
%
        if ( tover < p )

          tover = enten;
          p = p / tover;
          plast = plast / tover;
          psave = p;
          psavel = plast;
          nstart = n + 1;

          while ( 1 )

            n = n + 1;
            en = en + two;
            pold = plast;
            plast = p;
            p = en * plast / x + pold;

            if ( 1.0 < p )
              break
            end

          end

          tempb = en / x;
%
%  Calculate backward test, and find NCALC, the highest N
%  such that the test is passed.
%
          test = pold * plast / ensig;
          test = test * ( half - half / ( tempb * tempb ) );
          p = plast * tover;
          n = n - 1;
          en = en - two;
          nend = min ( nb, n );

          ncalc = nend + 1;

          for l = nstart : nend

            pold = psavel;
            psavel = psave;
            psave = en * psavel / x + pold;

            if ( test < psave * psavel )
              ncalc = l;
              break
            end

          end

          ncalc = ncalc - 1;
          flag = 1;
          break

        end

      end

      if ( ~flag )

        n = nend;
        en = ( n + n ) + ( alpha + alpha );
%
%  Calculate special significance test for 2 < NBMX.
%
        test = max ( test, sqrt ( plast * ensig ) * sqrt ( p + p ) );

      end

    end
%
%  Calculate P-sequence until significance test passed.
%
    if ( ~flag )

      while ( 1 )

        n = n + 1;
        en = en + two;
        pold = plast;
        plast = p;
        p = en * plast / x + pold;

        if ( test <= p )
          break
        end

      end

    end
%
%  Initialize the backward recursion and the normalization sum.
%
    n = n + 1;
    en = en + two;
    tempb = zero;
    tempa = one / p;
    em = n - one;
    empal = em + alpha;
    emp2al = ( em - one ) + ( alpha + alpha );
    total = tempa * empal * emp2al / em;
    nend = n - nb;
%
%  N < NB, so store B(N) and set higher orders to zero.
%
    if ( nend < 0 )

      b(n) = tempa;
      nend = -nend;

      b(n+1:n+nend) = zero;

      nend = n - 2;
%
%  Calculate via difference equation and store B(N), until N = 2.
%
      if ( 0 < nend )

        for l = 1 : nend
          n = n - 1;
          en = en - two;
          b(n) = ( en * b(n+1) ) / x + b(n+2);
          em = em - one;
          emp2al = emp2al - one;
          if ( n == 2 )
            emp2al = one;
          end
          empal = empal - one;
          total = ( total + b(n) * empal ) * emp2al / em;
        end

      end
%
%  Calculate B(1).
%
      b(1) = two * empal * b(2) / x + b(3);

      total = ( total + total ) + b(1);
%
%  Recur backward via difference equation, calculating (but
%  not storing) B(N), until N = NB.
%
    else

      if ( 0 < nend )

        for l = 1 : nend

          n = n - 1;
          en = en - two;
          tempc = tempb;
          tempb = tempa;
          tempa = ( en * tempb ) / x + tempc;
          em = em - one;
          emp2al = emp2al - one;

          if ( n == 1 )
            break
          end

          if ( n == 2 )
            emp2al = one;
          end

          empal = empal - one;
          total = ( total + tempa * empal ) * emp2al / em;

        end

      end
%
%  Store B(NB).
%
      b(n) = tempa;

      if ( nb <= 1 )

        total = ( total + total ) + tempa;
%
%  Calculate and Store B(NB-1).
%
      else

        n = n - 1;
        en = en - two;
        b(n) = ( en * tempa ) / x + tempb;

        if ( 1 < n  )

          em = em - one;
          emp2al = emp2al - one;

          if ( n == 2 )
            emp2al = one;
          end

          empal = empal - one;
          total = ( total + b(n) * empal ) * emp2al / em;

          nend = n - 2;
%
%  Calculate via difference equation and store B(N), until N = 2.
%
          if ( 0 < nend )

            for l = 1 : nend
              n = n - 1;
              en = en - two;
              b(n) = ( en * b(n+1) ) / x + b(n+2);
              em = em - one;
              emp2al = emp2al - one;
              if ( n == 2 )
                emp2al = one;
              end
              empal = empal - one;
              total = ( total + b(n) * empal ) * emp2al / em;
            end

          end
%
%  Calculate B(1).
%
          b(1) = two * empal * b(2) / x + b(3);

        end

        total = ( total + total ) + b(1);

      end

    end
%
%  Normalize.  Divide all B(N) by TOTAL.
%
    if ( alpha ~= zero )
       total = total * gamma ( one + alpha ) * ( x * half )^( -alpha );
    end

    if ( ize == 1 )
      total = total * exp ( -x );
    end

    tempa = enmten;

    if ( 1.0 < total )
      tempa = tempa * total;
    end

    for n = 1 : nb
      if ( b(n) < tempa )
        b(n) = zero;
      end
      b(n) = b(n) / total;
    end

    return
%
%  Two-term ascending series for small X.
%
  else

    tempa = one;
    empal = one + alpha;
    halfx = zero;

    if ( enmten < x )
      halfx = half * x;
    end

    if ( alpha ~= zero )
      tempa = halfx^alpha / gamma ( empal );
    end

    if ( ize == 2 )
      tempa = tempa * exp ( - x );
    end

    tempb = zero;

    if ( one < x + one )
      tempb = halfx * halfx;
    end

    b(1) = tempa + tempa * tempb / empal;

    if ( x ~= zero & b(1) == zero )
      ncalc = 0;
    end

    if ( 1 < nb )

      if ( x == zero )

        b(2:nb) = zero;
%
%  Calculate higher-order functions.
%
      else

        tempc = halfx;
        tover = ( enmten + enmten ) / x;

        if ( tempb ~= zero )
          tover = enmten / tempb;
        end

        for n = 2 : nb

          tempa = tempa / empal;
          empal = empal + one;
          tempa = tempa * tempc;

          if ( tempa <= tover * empal )
            tempa = zero;
          end

          b(n) = tempa + tempa * tempb / empal;

          if ( b(n) == zero & n < ncalc )
            ncalc = n - 1;
          end

        end

      end

    end

  end

  return
end
