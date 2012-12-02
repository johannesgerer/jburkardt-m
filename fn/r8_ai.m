function value = r8_ai ( x )

%*****************************************************************************80
%
%% R8_AI evaluates the Airy function Ai of an R8 argument.
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
      -0.37971358496669997496197089469414E-01, ...
      +0.59191888537263638574319728013777E-01, ...
      +0.98629280577279975365603891044060E-03, ...
      +0.68488438190765667554854830182412E-05, ...
      +0.25942025962194713019489279081403E-07, ...
      +0.61766127740813750329445749697236E-10, ...
      +0.10092454172466117901429556224601E-12, ...
      +0.12014792511179938141288033225333E-15, ...
      +0.10882945588716991878525295466666E-18, ...
      +0.77513772196684887039238400000000E-22, ...
      +0.44548112037175638391466666666666E-25, ...
      +0.21092845231692343466666666666666E-28, ...
      +0.83701735910741333333333333333333E-32 ]';
    aigcs = [ ...
      +0.18152365581161273011556209957864E-01, ...
      +0.21572563166010755534030638819968E-01, ...
      +0.25678356987483249659052428090133E-03, ...
      +0.14265214119792403898829496921721E-05, ...
      +0.45721149200180426070434097558191E-08, ...
      +0.95251708435647098607392278840592E-11, ...
      +0.13925634605771399051150420686190E-13, ...
      +0.15070999142762379592306991138666E-16, ...
      +0.12559148312567778822703205333333E-19, ...
      +0.83063073770821340343829333333333E-23, ...
      +0.44657538493718567445333333333333E-26, ...
      +0.19900855034518869333333333333333E-29, ...
      +0.74702885256533333333333333333333E-33 ]';
    naif = r8_inits ( aifcs, 13, 0.1 * r8_mach ( 3 ) );
    naig = r8_inits ( aigcs, 13, 0.1 * r8_mach ( 3 ) );
    x3sml = r8_mach ( 3 )^0.3334;
    xmax = ( - 1.5 * log ( r8_mach ( 1 ) ) )^0.6667;
    xmax = xmax - xmax * log ( xmax ) / ...
      ( 4.0 * xmax * sqrt ( xmax ) + 1.0 ) - 0.01;
  end

  if ( x < - 1.0 )
    [ xm, theta ] = r8_aimp ( x );
    value = xm * cos ( theta );
  elseif ( abs ( x ) <= x3sml )
    z = 0.0;
    value = 0.375 + ( r8_csevl ( z, aifcs, naif ) ...
      - x * ( 0.25 + r8_csevl ( z, aigcs, naig ) ) );
  elseif ( x <= 1.0 )
    z = x * x * x;
    value = 0.375 + ( r8_csevl ( z, aifcs, naif ) ...
      - x * ( 0.25 + r8_csevl ( z, aigcs, naig ) ) );
  elseif ( x <= xmax )
    value = r8_aie ( x ) * exp ( - 2.0 * x * sqrt ( x ) / 3.0 );
  else
    value = 0.0;
  end

  return
end
