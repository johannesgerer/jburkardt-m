function value = r8_besk1 ( x )

%*****************************************************************************80
%
%% R8_BESK1 evaluates the Bessel function K of order 1 of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
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
%    Output, real VALUE, the Bessel function K of order 1 of X.
%
  persistent bk1cs
  persistent ntk1
  persistent xmax
  persistent xmin
  persistent xsml

  if ( isempty ( ntk1 ) )

    bk1cs = [ ...
      +0.25300227338947770532531120868533E-01, ...
      -0.35315596077654487566723831691801, ...
      -0.12261118082265714823479067930042, ...
      -0.69757238596398643501812920296083E-02, ...
      -0.17302889575130520630176507368979E-03, ...
      -0.24334061415659682349600735030164E-05, ...
      -0.22133876307347258558315252545126E-07, ...
      -0.14114883926335277610958330212608E-09, ...
      -0.66669016941993290060853751264373E-12, ...
      -0.24274498505193659339263196864853E-14, ...
      -0.70238634793862875971783797120000E-17, ...
      -0.16543275155100994675491029333333E-19, ...
      -0.32338347459944491991893333333333E-22, ...
      -0.53312750529265274999466666666666E-25, ...
      -0.75130407162157226666666666666666E-28, ...
      -0.91550857176541866666666666666666E-31 ]';

    ntk1 = r8_inits ( bk1cs, 16, 0.1 * r8_mach ( 3 ) );
    xmin = exp ( max ( log ( r8_mach ( 1 ) ), ...
      - log ( r8_mach ( 2 ) ) ) + 0.01 );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );
    xmax = - log ( r8_mach ( 1 ) );
    xmax = xmax - 0.5 * xmax * log ( xmax ) ...
      / ( xmax + 0.5 ) - 0.01;

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESK1 = Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_BESK1 - Fatal error1' )
  elseif ( x <= xsml )
    y = 0.0;
    value = log ( 0.5 * x ) * r8_besi1 ( x ) + ( 0.75 ...
      + r8_csevl ( 0.5 * y - 1.0, bk1cs, ntk1 ) ) / x;
  elseif ( x <= 2.0 )
    y = x * x;
    value = log ( 0.5 * x ) * r8_besi1 ( x ) + ( 0.75 ...
      + r8_csevl ( 0.5 * y - 1.0, bk1cs, ntk1 ) ) / x;
  elseif ( x <= xmax )
    value = exp ( - x ) * r8_besk1e ( x );
  else
    value = 0.0;
  end

  return
end
