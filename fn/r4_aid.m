function value = r4_aid ( x )

%*****************************************************************************80
%
%% R4_AID evaluates the derivative of the Airy function Ai of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
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
%    Output, real VALUE, the derivative of the Airy function Ai of X.
%
  persistent aifcs
  persistent aigcs
  persistent naif
  persistent naig
  persistent x2sml
  persistent x3sml

  if ( isempty ( naif ) )
    aifcs = [ ...
      0.10527461226531408809, ...
      0.01183613628152997844, ...
      0.00012328104173225664, ...
      0.00000062261225638140, ...
      0.00000000185298887844, ...
      0.00000000000363328873, ...
      0.00000000000000504622, ...
      0.00000000000000000522 ]';
    aigcs = [ ...
      0.021233878150918666852, ...
      0.086315930335214406752, ...
      0.001797594720383231358, ...
      0.000014265499875550693, ...
      0.000000059437995283683, ...
      0.000000000152403366479, ...
      0.000000000000264587660, ...
      0.000000000000000331562, ...
      0.000000000000000000314 ]';
    naif = r4_inits ( aifcs, 8, 0.1 * r4_mach ( 3 ) );
    naig = r4_inits ( aigcs, 9, 0.1 * r4_mach ( 3 ) );
    x3sml = r4_mach ( 3 )^0.3334;
    x2sml = sqrt ( r4_mach ( 3 ) );
  end

  if ( x < - 1.0 )
    [ xn, phi ] = r4_admp ( x );
    value = xn * cos ( phi );
  elseif ( abs ( x ) <= x2sml )
    x2 = 0.0;
    x3 = 0.0;
    value = ( x2 * ( 0.125 + r4_csevl ( x3, aifcs, naif ) ) ...
      - r4_csevl ( x3, aigcs, naig ) ) - 0.25;
  elseif ( abs ( x ) <= x3sml )
    x2 = x * x;
    x3 = 0.0;
    value = ( x2 * ( 0.125 + r4_csevl ( x3, aifcs, naif ) ) ...
      - r4_csevl ( x3, aigcs, naig ) ) - 0.25;
  elseif ( x <= 1.0 )
    x2 = x * x;
    x3 = x * x * x;
    value = ( x2 * ( 0.125 + r4_csevl ( x3, aifcs, naif ) ) ...
      - r4_csevl ( x3, aigcs, naig ) ) - 0.25;
  else
    value = r4_aide ( x ) * exp ( - 2.0 * x * sqrt ( x ) / 3.0 );
  end

  return
end
