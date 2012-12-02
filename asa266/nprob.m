function [ p, q, pdf ] = nprob ( z )

%*****************************************************************************80
%
%% NPROB computes the cumulative density of the standard normal distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by AG Adams.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    AG Adams,
%    Algorithm 39:
%    Areas Under the Normal Curve,
%    Computer Journal,
%    Volume 12, Number 2, May 1969, pages 197-198.
%
%  Parameters:
%
%    Input, real Z, divides the real line into
%    two semi-infinite intervals, over each of which the standard normal
%    distribution is to be integrated.
%
%    Output, real P, Q, the integrals of the standard normal
%    distribution over the intervals ( - Infinity, Z] and
%    [Z, + Infinity ), respectively.
%
%    Output, real PDF, the value of the standard normal
%    distribution at Z.
%
  a0 = 0.5;
  a1 = 0.398942280444;
  a2 = 0.399903438504;
  a3 = 5.75885480458;
  a4 = 29.8213557808;
  a5 = 2.62433121679;
  a6 = 48.6959930692;
  a7 = 5.92885724438;
  b0 = 0.398942280385;
  b1 = 0.000000038052;
  b2 = 1.00000615302;
  b3 = 0.000398064794;
  b4 = 1.98615381364;
  b5 = 0.151679116635;
  b6 = 5.29330324926;
  b7 = 4.8385912808;
  b8 = 15.1508972451;
  b9 = 0.742380924027;
  b10 = 30.789933034;
  b11 = 3.99019417011;

  zabs = abs ( z );
%
%  |Z| between 0 and 1.28
%
  if ( abs ( z ) <= 1.28 )

    y = a0 * z * z;
    pdf = exp ( - y ) * b0;

    q = a0 - zabs * ( a1 - a2 * y ...
      / ( y + a3 - a4 ...
      / ( y + a5 + a6 ...
      / ( y + a7 ))));
%
%  |Z| between 1.28 and 12.7
%
  elseif ( abs ( z ) <= 12.7 )

    y = a0 * z * z;
    pdf = exp ( - y ) * b0;

    q = pdf ...
      / ( zabs - b1 + b2 ...
      / ( zabs + b3 + b4 ...
      / ( zabs - b5 + b6 ...
      / ( zabs + b7 - b8 ...
      / ( zabs + b9 + b10 ...
      / ( zabs + b11 ))))));
%
%  Z far out in tail.
%
  else

    q = 0.0;
    pdf = 0.0;

  end

  if ( z < 0.0 )
    p = q;
    q = 1.0 - p;
  else
    p = 1.0 - q;
  end

  return
end
