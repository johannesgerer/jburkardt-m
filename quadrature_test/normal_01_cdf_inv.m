function x = normal_01_cdf_inv ( cdf )

%*****************************************************************************80
%
%% NORMAL_01_CDF_INV inverts the Normal 01 CDF.
%
%  Discussion:
%
%    Modified to handle the case where R = 0 would result in evaluation
%    of LOG(0).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2007
%
%  Author:
%
%    FORTRAN77 original version by JD Beasley, SG Springer.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    JD Beasley, SG Springer,
%    Algorithm AS 111:
%    The Percentage Points of the Normal Distribution,
%    Applied Statistics,
%    Volume 26, 1977, pages 118-121.
%
%  Parameters:
%
%    Input, real CDF, the value of the CDF.
%    0.0 <= CDF <= 1.0.
%
%    Input, real X, the corresponding argument.
%
  a0 =   2.50662823884;
  a1 = -18.61500062529;
  a2 =  41.39119773534;
  a3 = -25.44106049637;
  b1 =  -8.47351093090;
  b2 =  23.08336743743;
  b3 = -21.06224101826;
  b4 =   3.13082909833;
  c0 =  -2.78718931138;
  c1 =  -2.29796479134;
  c2 =   4.85014127135;
  c3 =   2.32121276858;
  d1 =   3.54388924762;
  d2 =   1.63706781897;

  if ( cdf < 0.0 | 1.0 < cdf )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'NORMAL_01_CDF_INV - Fatal error!\n' );
    fprintf ( 1, '  CDF < 0 or 1 < CDF.\n' );
    error ( 'NORMAL_01_CDF_INV - Fatal error!' );
  end

  q = cdf - 0.5;

  q = min ( q, 0.5 );
  q = max ( q, -0.5 );
%
%  0.08 < CDF < 0.92
%
  if ( abs ( q ) <= 0.42 )

    r = q * q;

    x = q * ( ( ( ...
           a3   * r ...
         + a2 ) * r ...
         + a1 ) * r ...
         + a0 ) / ( ( ( ( ... 
           b4   * r ...
         + b3 ) * r ...
         + b2 ) * r ...
         + b1 ) * r + 1.0 );
%
%  CDF < 0.08 or 0.92 < CDF.
%
  else

    r = min ( cdf, 1.0 - cdf );
    r = max ( r, 0.0 );
    r = min ( r, 1.0 );

    if ( r <= 0.0 )
      x = r8_huge ( );
    else
      r = sqrt ( - log ( r ) );

      x = ( ( ( ...
             c3   * r ...
           + c2 ) * r ...
           + c1 ) * r ...
           + c0 ) / ( ( ...
             d2   * r ...
           + d1 ) * r + 1.0 );
    end

    if ( q < 0.0 )
      x = - x;
    end

  end

  return
end

