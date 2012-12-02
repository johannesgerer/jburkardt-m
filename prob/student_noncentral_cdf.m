function cdf = student_noncentral_cdf ( x, idf, d )

%*****************************************************************************80
%
%% STUDENT_NONCENTRAL_CDF evaluates the noncentral Student T CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Algorithm AS 5,
%    Applied Statistics,
%    Volume 17, 1968, page 193.
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Input, integer IDF, the number of degrees of freedom.
%
%    Input, real D, the noncentrality parameter.
%
%    Output, real CDF, the value of the CDF.
%
  a_max = 100;
  emin = 12.5;

  f = idf;

  if ( idf == 1 )

    a = x / sqrt ( f );
    b = f / ( f + x * x );
    drb = d * sqrt ( b );

    cdf2 = normal_01_cdf ( drb );
    cdf = 1.0 - cdf2 + 2.0 * tfn ( drb, a );

  elseif ( idf <= a_max )

    a = x / sqrt ( f );
    b = f / ( f + x * x );
    drb = d * sqrt ( b );
    sum2 = 0.0;

    fmkm2 = 0.0;
    if ( abs ( drb ) < emin )
      cdf2 = normal_01_cdf ( a * drb );
      fmkm2 = a * sqrt ( b ) * exp ( -0.5 * drb * drb ) * cdf2 / sqrt ( 2.0 * pi );
    end

    fmkm1 = b * d * a * fmkm2;
    if ( abs ( d ) < emin )
      fmkm1 = fmkm1 + 0.5 * b * a * exp ( - 0.5 * d * d ) / pi;
    end

    if ( mod ( idf, 2 ) == 0 )
      sum2 = fmkm2;
    else
      sum2 = fmkm1;
    end

    ak = 1.0;

    for k = 2 : 2 : idf - 2

      fk = k;

      fmkm2 = b * ( d * a * ak * fmkm1 + fmkm2 ) * ( fk - 1.0 ) / fk;

      ak = 1.0 / ( ak * ( fk - 1.0 ) );
      fmkm1 = b * ( d * a * ak * fmkm2 + fmkm1 ) * fk / ( fk + 1.0 );

      if ( mod ( idf, 2 ) == 0 )
        sum2 = sum2 + fmkm2;
      else
        sum2 = sum2 + fmkm1;
      end

      ak = 1.0 / ( ak * fk );

    end

    if ( mod ( idf, 2 ) == 0 )
      cdf2 = normal_01_cdf ( d );
      cdf = 1.0 - cdf2 + sum2 * sqrt ( 2.0 * pi );
    else
      cdf2 = normal_01_cdf ( drb );
      cdf = 1.0 - cdf2 + 2.0 * ( sum2 + tfn ( drb, a ) );
    end
%
%  Normal approximation.
%
  else

    a = sqrt ( 0.5 * f ) * exp ( gammaln ( 0.5 * ( f - 1.0 ) ) ...
      - gammaln ( 0.5 * f ) ) * d;

    temp = ( x - a ) / sqrt ( f * ( 1.0 + d * d ) / ( f - 2.0 ) - a * a );

    cdf2 = normal_01_cdf ( temp );
    cdf = cdf2;

  end

  return
end
