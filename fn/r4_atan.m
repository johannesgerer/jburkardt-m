function value = r4_atan ( x )

%*****************************************************************************80
%
%% R4_ATAN evaluates the arc-tangent of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the arc-tangent of X.
%
  persistent atancs;
  persistent conpi8;
  persistent nterms;
  persistent pi8;
  persistent sqeps;
  persistent tanp8;
  persistent xbig;
  persistent xbnd1;
  persistent xbnd2;
  persistent xbnd3;
  persistent xbnd4;

  if ( isempty ( nterms ) )
    atancs = [ ...
     0.48690110349241406E+00, ...
    -0.006510831636717464E+00, ...
     0.000038345828265245E+00, ...
    -0.000000268722128762E+00, ...
     0.000000002050093098E+00, ...
    -0.000000000016450717E+00, ...
     0.000000000000136509E+00, ...
    -0.000000000000001160E+00, ...
     0.000000000000000010E+00 ]';
    conpi8 = [ ...
      0.375E+00, ...
      0.75E+00, ...
      1.125E+00, ...
      1.5E+00 ]';
    pi8 = [ ...
    0.176990816987241548E-01, ...
    0.353981633974483096E-01, ...
    0.530972450961724644E-01, ...
    0.0707963267948966192E+00 ]';
    tanp8 = [ ...
    0.414213562373095048E+00, ...
    1.0E+00, ...
    2.41421356237309504E+00 ]';
    nterms = r4_inits ( atancs, 9, 0.1 * r4_mach ( 3 ) );
    sqeps = sqrt ( 6.0 * r4_mach ( 3 ) );
    xbig = 1.0 / r4_mach ( 3 );
    xbnd1 = +0.198912367379658006E+00;
    xbnd2 = +0.668178637919298919E+00;
    xbnd3 = +1.49660576266548901E+00;
    xbnd4 = +5.02733949212584810E+00;
  end

  y = abs ( x );

  if ( y <= xbnd1 )

    value = x;
    if ( sqeps < y )
      value = x * ( 0.75 + r4_csevl ( ...
        50.0 * y * y - 1.0, atancs, nterms ) );
    end

  elseif ( y <= xbnd4 )

    if ( xbnd3 < y )
      n = 3;
    elseif ( xbnd2 < y )
      n = 2;
    else
      n = 1;
    end

    t = ( y - tanp8(n) ) / ( 1.0 + y * tanp8(n) );

    value = conpi8(n) + ( pi8(n) + t * ( 0.75 + ...
      r4_csevl ( 50.0 * t * t - 1.0, atancs, nterms ) ) );

  else

    value = conpi8(4) + pi8(4);

    if ( y < xbig )
      value = conpi8(4) + ( pi8(4) - ( 0.75 + ...
        r4_csevl ( 50.0 / y / y - 1.0, atancs, nterms ) ) / y );
    end

  end

  if ( x < 0.0 )
    value = - abs ( value );
  else
    value = + abs ( value );
  end

  return
end
