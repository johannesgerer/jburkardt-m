function cdf = normal_01_cdf ( x )

%*****************************************************************************80
%
%% NORMAL_01_CDF evaluates the Normal 01 CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    A G Adams,
%    Areas Under the Normal Curve,
%    Algorithm 39,
%    Computer j.,
%    Volume 12, pages 197-198, 1969.
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%
%    Output, real CDF, the value of the CDF.
%
  a1 = 0.398942280444E+00;
  a2 = 0.399903438504E+00;
  a3 = 5.75885480458E+00;
  a4 = 29.8213557808E+00;
  a5 = 2.62433121679E+00;
  a6 = 48.6959930692E+00;
  a7 = 5.92885724438E+00;
  b0 = 0.398942280385E+00;
  b1 = 3.8052E-08;
  b2 = 1.00000615302E+00;
  b3 = 3.98064794E-04;
  b4 = 1.98615381364E+00;
  b5 = 0.151679116635E+00;
  b6 = 5.29330324926E+00;
  b7 = 4.8385912808E+00;
  b8 = 15.1508972451E+00;
  b9 = 0.742380924027E+00;
  b10 = 30.789933034E+00;
  b11 = 3.99019417011E+00;
%
%  |X| <= 1.28.
%
  if ( abs ( x ) <= 1.28 )

    y = 0.5 * x * x;

    q = 0.5 - abs ( x ) * ( a1 - a2 * y / ( y + a3 ...
      - a4 / ( y + a5 ...
      + a6 / ( y + a7 ) ) ) );
%
%  1.28 < |X| <= 12.7
%
  elseif ( abs ( x ) <= 12.7 )

    y = 0.5 * x * x;

    q = exp ( - y ) ...
      * b0  / ( abs ( x ) - b1 ...
      + b2  / ( abs ( x ) + b3 ...
      + b4  / ( abs ( x ) - b5 ...
      + b6  / ( abs ( x ) + b7 ...
      - b8  / ( abs ( x ) + b9 ...
      + b10 / ( abs ( x ) + b11 ) ) ) ) ) );
%
%  12.7 < |X|
%
  else

    q = 0.0;

  end
%
%  Take account of negative X.
%
  if ( x < 0.0 )
    cdf = q;
  else
    cdf = 1.0 - q;
  end

  return
end
