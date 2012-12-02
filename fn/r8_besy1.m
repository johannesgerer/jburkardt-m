function value = r8_besy1 ( x )

%*****************************************************************************80
%
%% R8_BESY1 evaluates the Bessel function Y of order 1 of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2011
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
%    Output, real VALUE, the Bessel function Y of order 1 of X.
%
  persistent by1cs
  persistent nty1
  persistent twodpi
  persistent xmin
  persistent xsml

  twodpi = 0.636619772367581343075535053490057;

  if ( isempty ( nty1 ) )

    by1cs = [ ...
      +0.320804710061190862932352018628015E-01, ...
      +0.126270789743350044953431725999727E+01, ...
      +0.649996189992317500097490637314144E-02, ...
      -0.893616452886050411653144160009712E-01, ...
      +0.132508812217570954512375510370043E-01, ...
      -0.897905911964835237753039508298105E-03, ...
      +0.364736148795830678242287368165349E-04, ...
      -0.100137438166600055549075523845295E-05, ...
      +0.199453965739017397031159372421243E-07, ...
      -0.302306560180338167284799332520743E-09, ...
      +0.360987815694781196116252914242474E-11, ...
      -0.348748829728758242414552947409066E-13, ...
      +0.278387897155917665813507698517333E-15, ...
      -0.186787096861948768766825352533333E-17, ...
      +0.106853153391168259757070336000000E-19, ...
      -0.527472195668448228943872000000000E-22, ...
      +0.227019940315566414370133333333333E-24, ...
      -0.859539035394523108693333333333333E-27, ...
      +0.288540437983379456000000000000000E-29, ...
      -0.864754113893717333333333333333333E-32 ]';

    nty1 = r8_inits ( by1cs, 20, 0.1 * r8_mach ( 3 ) );
    xmin = 1.571 * exp ( max ( log ( r8_mach ( 1 ) ), ...
      - log ( r8_mach ( 2 ) ) ) + 0.01 );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESY1 - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_BESY1 - Fatal error!' )
  elseif ( x <= xmin )
    y = 0.0;
    value = twodpi * log ( 0.5 * x ) * r8_besj1 ( x ) ...
      + ( 0.5 + r8_csevl ( 0.125 * y - 1.0, by1cs, nty1 ) ) / x;
  elseif ( x <= 4.0 )
    y = x * x;
    value = twodpi * log ( 0.5 * x ) * r8_besj1 ( x ) ...
      + ( 0.5 + r8_csevl ( 0.125 * y - 1.0, by1cs, nty1 ) ) / x;
  else
    [ ampl, theta ] = r8_b1mp ( x );
    value = ampl * sin ( theta );
  end

  return
end
