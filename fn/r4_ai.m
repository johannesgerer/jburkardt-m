function value = r4_ai ( x )

%*****************************************************************************80
%
%% R4_AI evaluates the Airy function Ai of an R4 argument.
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
%    Output, real VALUE, the Airy function Ai of X.
%
  persistent aifcs
  persistent aigcs
  persistent naif
  persistent naig
  persistent x3sml
  persistent xmax

  if ( isempty ( naif ) )
    aifcs = [ ...
   -0.03797135849666999750E+00, ...
    0.05919188853726363857E+00, ...
    0.00098629280577279975E+00, ...
    0.00000684884381907656E+00, ...
    0.00000002594202596219E+00, ...
    0.00000000006176612774E+00, ...
    0.00000000000010092454E+00, ...
    0.00000000000000012014E+00, ...
    0.00000000000000000010E+00 ]';
    aigcs = [ ...
    0.01815236558116127E+00, ...
    0.02157256316601076E+00, ...
    0.00025678356987483E+00, ...
    0.00000142652141197E+00, ...
    0.00000000457211492E+00, ...
    0.00000000000952517E+00, ...
    0.00000000000001392E+00, ...
    0.00000000000000001E+00 ]';
    naif = r4_inits ( aifcs, 9, 0.1 * r4_mach ( 3 ) );
    naig = r4_inits ( aigcs, 8, 0.1 * r4_mach ( 3 ) );
    x3sml = r4_mach ( 3 )^0.3334;
    xmax = ( - 1.5 * log ( r4_mach ( 1 ) ) )^0.6667;
    xmax = xmax - xmax * log ( xmax ) ...
      / ( 4.0 * xmax * sqrt ( xmax ) + 1.0 ) - 0.01;
  end

  if ( x < - 1.0 )
    [ xm, theta ] = r4_aimp ( x );
    value = xm * cos ( theta );
  elseif ( abs ( x ) <= x3sml )
    z = 0.0;
    value = 0.375 + ( r4_csevl ( z, aifcs, naif ) ...
      - x * ( 0.25 + r4_csevl ( z, aigcs, naig ) ) );
  elseif ( x <= 1.0 )
    z = x * x * x;
    value = 0.375 + ( r4_csevl ( z, aifcs, naif ) ...
      - x * ( 0.25 + r4_csevl ( z, aigcs, naig ) ) );
  elseif ( x <= xmax )
    value = r4_aie ( x ) * exp ( - 2.0 * x * sqrt ( x ) / 3.0 );
  else
    value = 0.0;
  end

  return
end
