function [ value, ifault ] = gammds ( x, p )

%*****************************************************************************80
%
%% GAMMDS computes the incomplete Gamma integral.
%
%  Discussion:
%
%    The parameters must be positive.  An infinite series is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Chi Leung Lau.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Chi Leung Lau,
%    Algorithm AS 147:
%    A Simple Series for the Incomplete Gamma Integral,
%    Applied Statistics,
%    Volume 29, Number 1, 1980, pages 113-114.
%
%  Parameters:
%
%    Input, real X, P, the arguments of the incomplete
%    Gamma integral.  X and P must be greater than 0.
%
%    Output, real VALUE, the value of the incomplete
%    Gamma integral.
%
%    Output, integer IFAULT, error flag.
%    0, no errors.
%    1, X <= 0 or P <= 0.
%    2, underflow during the computation.
%
  e = 1.0E-09;
  uflo = 1.0E-37;
%
%  Check the input.
%
  if ( x <= 0.0 )
    ifault = 1;
    value = 0.0;
    return
  end

  if ( p <= 0.0 )
    ifault = 1;
    value = 0.0;
    return
  end
%
%  ALNGAM is the natural logarithm of the gamma function.
%
  arg = p * log ( x ) - alngam ( p + 1.0 ) - x;

  if ( arg < log ( uflo ) )
    value = 0.0;
    ifault = 2;
    return
  end

  f = exp ( arg );

  if ( f == 0.0 )
    value = 0.0;
    ifault = 2;
    return
  end

  ifault = 0;
%
%  Series begins.
%
  c = 1.0;
  value = 1.0;
  a = p;

  while ( 1 )

    a = a + 1.0;
    c = c * x / a;
    value = value + c;

    if ( c <= e * value )
      break;
    end

  end

  value = value * f;

  return
end
