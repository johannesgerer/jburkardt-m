function value = alnorm ( x, upper )

%*****************************************************************************80
%
%% ALNORM computes the cumulative density of the standard normal distribution.
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
%    Original FORTRAN77 version by David Hill.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Hill,
%    Algorithm AS 66:
%    The Normal Integral,
%    Applied Statistics,
%    Volume 22, Number 3, 1973, pages 424-427.
%
%  Parameters:
%
%    Input, real X, is one endpoint of the semi-infinite interval
%    over which the integration takes place.
%
%    Input, logical UPPER, determines whether the upper or lower
%    interval is to be integrated:
%    1 => integrate from X to + Infinity;
%    0 => integrate from - Infinity to X.
%
%    Output, real VALUE, the integral of the standard normal
%    distribution over the desired interval.
%
  a1 = 5.75885480458; 
  a2 = 2.62433121679; 
  a3 = 5.92885724438; 
  b1 = -29.8213557807; 
  b2 = 48.6959930692; 
  c1 = -0.000000038052; 
  c2 = 0.000398064794; 
  c3 = -0.151679116635; 
  c4 = 4.8385912808; 
  c5 = 0.742380924027; 
  c6 = 3.99019417011;
  con = 1.28;
  d1 = 1.00000615302;
  d2 = 1.98615381364;
  d3 = 5.29330324926;
  d4 = -15.1508972451;
  d5 = 30.789933034;
  ltone = 7.0;
  p = 0.39894228044; 
  q = 0.39990348504;
  r = 0.398942280385;
  utzero = 18.66;

  up = upper;
  z = x;

  if ( z < 0.0 )
    if ( up )
      up = 0;
    else
      up = 1;
    end
    z = - z;
  end

  if ( ltone < z & ( ( ~up ) | utzero < z ) )

    if ( up )
      value = 0.0;
    else
      value = 1.0;
    end

    return

  end

  y = 0.5  * z * z;

  if ( z <= con )

    value = 0.5  - z * ( p - q * y ...
      / ( y + a1 + b1 ...
      / ( y + a2 + b2 ...
      / ( y + a3 ))));

  else

    value = r * exp ( - y ) ...
      / ( z + c1 + d1 ...
      / ( z + c2 + d2 ...
      / ( z + c3 + d3 ...
      / ( z + c4 + d4 ...
      / ( z + c5 + d5 ...
      / ( z + c6 ))))));

  end

  if ( ~up )
    value = 1.0  - value;
  end

  return
end

