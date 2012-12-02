function value = r8_aid ( x )

%*****************************************************************************80
%
%% R8_AID evaluates the derivative of the Airy function Ai of an R8 argument.
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
%    Output, real VALUE, the derivative of the Airy function
%    Ai of X.
%
  persistent aifcs
  persistent aigcs
  persistent naif
  persistent naig
  persistent x2sml
  persistent x3sml

  if ( isempty ( naif ) )
    aifcs = [ ...
       0.105274612265314088088970057325134114, ...
       0.011836136281529978442889292583980840, ...
       0.000123281041732256643051689242469164, ...
       0.000000622612256381399016825658693579, ...
       0.000000001852988878441452950548140821, ...
       0.000000000003633288725904357915995625, ...
       0.000000000000005046217040440664768330, ...
       0.000000000000000005223816555471480985, ...
       0.000000000000000000004185745090748989, ...
       0.000000000000000000000002672887324883, ...
       0.000000000000000000000000001392128006, ...
       0.000000000000000000000000000000602653, ...
       0.000000000000000000000000000000000220 ]';
    aigcs = [ ...
       0.0212338781509186668523122276848937, ...
       0.0863159303352144067524942809461604, ...
       0.0017975947203832313578033963225230, ...
       0.0000142654998755506932526620687495, ...
       0.0000000594379952836832010488787064, ...
       0.0000000001524033664794478945214786, ...
       0.0000000000002645876603490435305100, ...
       0.0000000000000003315624296815020591, ...
       0.0000000000000000003139789757594792, ...
       0.0000000000000000000002325767379040, ...
       0.0000000000000000000000001384384231, ...
       0.0000000000000000000000000000676629, ...
       0.0000000000000000000000000000000276 ]';
    eta = 0.1 * r8_mach ( 3 );
    naif = r8_inits ( aifcs, 13, eta );
    naig = r8_inits ( aigcs, 13, eta );
    x3sml = r8_mach ( 3 )^0.3334;
    x2sml = sqrt ( r8_mach ( 3 ) );
  end

  if ( x < - 1.0 )
    [ xn, phi ] = r8_admp ( x );
    value = xn * cos ( phi );
  elseif ( abs ( x ) <= x2sml )
    x2 = 0.0;
    x3 = 0.0;
    value = ( x2 * ( 0.125 + r8_csevl ( x3, aifcs, naif ) ) ...
      - r8_csevl ( x3, aigcs, naig ) ) - 0.25;
  elseif ( abs ( x ) <= x3sml )
    x2 = x * x;
    x3 = 0.0;
    value = ( x2 * ( 0.125 + r8_csevl ( x3, aifcs, naif ) ) ...
      - r8_csevl ( x3, aigcs, naig ) ) - 0.25;
  elseif ( x <= 1.0 )
    x2 = x * x;
    x3 = x * x * x;
    value = ( x2 * ( 0.125 + r8_csevl ( x3, aifcs, naif ) ) ...
      - r8_csevl ( x3, aigcs, naig ) ) - 0.25;
  else
    value = r8_aide ( x ) ...
      * exp ( - 2.0 * x * sqrt ( x ) / 3.0 );
  end

  return
end
