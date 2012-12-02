function value = r4_asin ( x )

%*****************************************************************************80
%
%% R4_ASIN evaluates the arc-sine of an R4 argument.
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
%    Output, real VALUE, the arc-sine of X.
%
  persistent asincs
  persistent nterms
  persistent sqeps

  if ( isempty ( nterms ) )
    asincs = [ ...
      0.10246391753227159, ...
      0.054946487221245833, ...
      0.004080630392544969, ...
      0.000407890068546044, ...
      0.000046985367432203, ...
      0.000005880975813970, ...
      0.000000777323124627, ...
      0.000000106774233400, ...
      0.000000015092399536, ...
      0.000000002180972408, ...
      0.000000000320759842, ...
      0.000000000047855369, ...
      0.000000000007225128, ...
      0.000000000001101833, ...
      0.000000000000169476, ...
      0.000000000000026261, ...
      0.000000000000004095, ...
      0.000000000000000642, ...
      0.000000000000000101, ...
      0.000000000000000016 ]';
    nterms = r4_inits ( asincs, 20, 0.1 * r4_mach ( 3 ) );
    sqeps = sqrt ( 6.0 * r4_mach ( 3 ) );
  end

  y = abs ( x );

  if ( x < - 1.0 - sqeps )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_ASIN - Fatal error!\n' );
    fprintf ( 1, '  X < - 1.0\n' );
    error ( 'R4_ASIN - Fatal error!' )

  elseif ( x < - 1.0 )

    value = - 0.5 * pi;

  elseif ( x < 1.0 )

    z = 0.0;
    if ( sqeps < y )
      z = y * y;
    end

    if ( z <= 0.5 )
      value = x * ( 1.0 + r4_csevl ( 4.0 * z - 1.0, asincs, nterms ) );
    else
      value = 0.5 * pi - sqrt ( 1.0 - z ) * ( 1.0 + ...
        r4_csevl ( 3.0 - 4.0 * z, asincs, nterms ) );
    end

    if ( x < 0.0 )
      value = - abs ( value );
    elseif ( 0.0 < x )
      value = + abs ( value );
    end

  elseif ( x < 1.0 + sqeps )

    value = 0.5 * pi;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_ASIN - Fatal error!\n' );
    fprintf ( 1, '  1.0 < X\n' );
    error ( 'R4_ASIN - Fatal error!' )

  end

  return
end
