function [ value, ifault ] = gamain ( x, p )

%*****************************************************************************80
%
%% GAMAIN computes the incomplete gamma ratio.
%
%  Discussion:
%
%    A series expansion is used if P > X or X <= 1.  Otherwise, a
%    continued fraction approximation is used.
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
%    Original FORTRAN77 version by G Bhattacharjee.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    G Bhattacharjee,
%    Algorithm AS 32:
%    The Incomplete Gamma Integral,
%    Applied Statistics,
%    Volume 19, Number 3, 1970, pages 285-287.
%
%  Parameters:
%
%    Input, real X, P, the parameters of the incomplete 
%    gamma ratio.  0 <= X, and 0 < P.
%
%    Output, integer IFAULT, error flag.
%    0, no errors.
%    1, P <= 0.
%    2, X < 0.
%    3, underflow.
%    4, error return from the Log Gamma routine.
%
%    Output, real VALUE, the value of the incomplete
%    gamma ratio.
%
  acu = 1.0D-08;
  oflo = 1.0E+37;
  uflo = 1.0E-37;
%
%  Check the input.
%
  if ( p <= 0.0 )
    ifault = 1;
    value = 0.0;
    return
  end

  if ( x < 0.0 )
    ifault = 2;
    value = 0.0;
    return
  end

  if ( x == 0.0 )
    ifault = 0;
    value = 0.0;
    return
  end

  [ g, ifault ] = alngam ( p );

  if ( ifault ~= 0 )
    ifault = 4;
    value = 0.0;
    return
  end

  arg = p * log ( x ) - x - g;

  if ( arg < log ( uflo ) )
    ifault = 3;
    value = 0.0;
    return
  end

  ifault = 0;
  factor = exp ( arg );
%
%  Calculation by series expansion.
%
  if ( x <= 1.0 | x < p )

    gin = 1.0;
    term = 1.0;
    rn = p;

    while ( 1 )

      rn = rn + 1.0;
      term = term * x / rn;
      gin = gin + term;

      if ( term <= acu )
        break
      end

    end

    value = gin * factor / p;
    return

  end
%
%  Calculation by continued fraction.
%
  a = 1.0 - p;
  b = a + x + 1.0;
  term = 0.0;

  pn(1) = 1.0;
  pn(2) = x;
  pn(3) = x + 1.0;
  pn(4) = x * b;

  gin = pn(3) / pn(4);

  while ( 1 )

    a = a + 1.0;
    b = b + 2.0;
    term = term + 1.0;
    an = a * term;
    for i = 1 : 2
      pn(i+4) = b * pn(i+2) - an * pn(i);
    end

    if ( pn(6) ~= 0.0 )

      rn = pn(5) / pn(6);
      dif = abs ( gin - rn );
%
%  Absolute error tolerance satisfied?
%
      if ( dif <= acu )
%
%  Relative error tolerance satisfied?
%
        if ( dif <= acu * rn )
          value = 1.0 - factor * gin;
          break
        end

      end

      gin = rn;

    end

    for i = 1 : 4
      pn(i) = pn(i+2);
    end

    if ( oflo <= abs ( pn(5) ) )

      for i = 1 : 4
        pn(i) = pn(i) / oflo;
      end

    end

  end
 
  return
end
