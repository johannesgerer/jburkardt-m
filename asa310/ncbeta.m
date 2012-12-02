function [ value, ifault ] = ncbeta ( a, b, lambda, x, errmax )

%*****************************************************************************80
%
%% NCBETA computes the noncentral Beta CDF.
%
%  Discussion:
%
%    Three corrections needed to be made to the text of this routine.
%    They are noted in the comments below.
%
%    Two of these corrections were errors in transcription made when
%    producing the online copy distributed by APSTAT.
%
%    One error, an error of omission, occurred in the original printed
%    copy of the routine, and was carried over into the online copy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by R Chattamvelli, R Shanmugam
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    R Chattamvelli, R Shanmugam,
%    Algorithm AS 310:
%    Computing the Non-central Beta Distribution Function,
%    Applied Statistics,
%    Volume 46, Number 1, 1997, pages 146-156.
%
%  Parameters:
%
%    Input, real A, B, the shape parameters.
%    0 <= A, 0 <= B.
%
%    Input, real LAMBDA, the noncentrality parameter.
%    0 <= LAMBDA.
%
%    Input, real X, the value at which the CDF is desired.
%
%    Input, real ERRMAX, the precision tolerance.
%
%    Output, real VALUE, the value of the noncentral Beta CDF.
%
%    Output, integer ( kind = 4 ) IFAULT, error flag.
%    0, no error occurred.
%    1, X is 0 or 1.
%    2, X < 0 or 1 < X.
%    3, A, B or LAMBDA is less than 0.
%
  ifault = 0;
  value = x;
%
%  Check parameters.
%
  if ( lambda <= 0.0 )
    ifault = 3;
    return
  end

  if ( a <= 0.0 )
    ifault = 3;
    return
  end

  if ( b <= 0.0 )
    ifault = 3;
    return
  end

  if ( x <= 0.0 )
    value = 0.0;
    return
  end

  if ( 1.0 <= x )
    value = 1.0;
    return
  end

  c = 0.5 * lambda;
  xj = 0.0;
%
%  AS 226 as it stands is sufficient in this situation.
%
  if ( lambda < 54.0 )

    [ value, ifault ] = betanc ( x, a, b, lambda );
    return

  else

    m = floor ( c + 0.5 );
    mr = m;
    iterlo = m - floor ( 5.0 * sqrt ( mr ) );
    iterhi = m + floor ( 5.0 * sqrt ( mr ) );
    t = - c + mr * log ( c ) - alngam ( mr + 1.0 );
    q = exp ( t );
    r = q;
    psum = q;

    beta = alngam ( a + mr ) ...
         + alngam ( b ) ...
         - alngam ( a + mr + b );

    s1 = ( a + mr ) * log ( x ) ...
       + b * log ( 1.0 - x ) - log ( a + mr ) - beta;
    gx = exp ( s1 );
    fx = gx;
    [ temp, ifault ] = betain ( x, a + mr, b, beta );
    ftemp = temp;
    xj = xj + 1.0;
%
%  The online copy of AS 310 has "SUM = Q - TEMP" which is incorrect.
%
    sum = q * temp;
    iter1 = m;
%
%  The first set of iterations starts from M and goes downwards
%
    while ( 1 )

      if ( iter1 < iterlo )
        break
      end

      if ( q < errmax )
        break
      end
%
%  The online copy of AS 310 has "Q = Q - ITER1 / C" which is incorrect.
%
      q = q * iter1 / c;
      xj = xj + 1.0;
      gx = ( a + iter1 ) / ( x * ( a + b + iter1 - 1.0 ) ) * gx;
      iter1 = iter1 - 1;
      temp = temp + gx;
      psum = psum + q;
      sum = sum + q * temp;

    end

    t0 = alngam ( a + b ) ...
       - alngam ( a + 1.0 ) ...
       - alngam ( b );

    s0 = a * log ( x ) + b * log ( 1.0 - x );
%
%  Both the online copy of AS 310 and the text printed in the reference
%  did not initialize the variable S to zero, which is incorrect.
%  JVB, 12 January 2008.
%
    s = 0.0;
    for i = 1 : iter1
      j = i - 1;
      s = s + exp ( t0 + s0 + j * log ( x ) );
      t1 = log ( a + b + j ) - log ( a + 1.0 + j ) + t0;
      t0 = t1;
    end
%
%  Compute the first part of error bound.
%
    errbd = ( 1.0 - gammad ( c, iter1 ) ) * ( temp + s );

    q = r;
    temp = ftemp;
    gx = fx;
    iter2 = m;

    while ( 1 )

      ebd = errbd + ( 1.0 - psum ) * temp;

      if ( ebd < errmax | iterhi <= iter2 )
        break
      end

      iter2 = iter2 + 1;
      xj = xj + 1.0;
      q = q * c / iter2;
      psum = psum + q;
      temp = temp - gx;
      gx = x * ( a + b + iter2 - 1.0 ) / ( a + iter2 ) * gx;
      sum = sum + q * temp;

    end

  end

  value = sum;

  return
end
