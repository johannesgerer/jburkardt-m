function value = error_f ( x )

%*****************************************************************************80
%
%% ERROR_F computes the error function.
%
%  Discussion:
%
%    This function was renamed "ERROR_F" from "ERF", to avoid a conflict
%    with the name of a corresponding routine often, but not always,
%    supplied as part of the math support library.
%
%    The definition of the error function is:
%
%      ERF(X) = ( 2 / SQRT ( PI ) ) * Integral ( 0 <= T <= X ) EXP ( -T**2 ) dT
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2007
%
%  Author:
%
%    FORTRAN77 original version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real X, the argument of the error function.
%
%    Output, real VALUE, the value of the error function at X.
%
  persistent nterf;
  persistent sqeps;
  persistent xbig;

  erfcs = [ ...
    -0.049046121234691808, -0.14226120510371364, ...
     0.010035582187599796, -0.000576876469976748, ...
     0.000027419931252196, -0.000001104317550734, ...
     0.000000038488755420, -0.000000001180858253, ...
     0.000000000032334215, -0.000000000000799101, ...
     0.000000000000017990, -0.000000000000000371, ...
     0.000000000000000007 ];

  sqrtpi = 1.7724538509055160;
%
%  Initialize the Chebyshev series.
%
  if ( size ( nterf ) == 0 )
    nterf = inits ( erfcs, 13, 0.1 * eps );
    xbig = sqrt ( - log ( sqrtpi * eps ) );
    sqeps = sqrt ( 2.0 * eps );
  end

  y = abs ( x );

  if ( y <= sqeps )
    value = 2.0 * x / sqrtpi;
  elseif ( y <= 1.0 )
    value = x * ( 1.0 + csevl ( 2.0 * x * x - 1.0, erfcs, nterf ) );
  elseif ( y <= xbig )
    value = r8_sign ( x ) * ( 1.0 - error_fc ( y ) );
  else
    value = r8_sign ( x );
  end

  return
end
