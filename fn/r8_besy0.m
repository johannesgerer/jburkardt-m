function value = r8_besy0 ( x )

%*****************************************************************************80
%
%% R8_BESY0 evaluates the Bessel function Y of order 0 of an R8 argument.
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
%    Output, real VALUE, the Bessel function Y of order 0 of X.
%
  persistent alnhaf
  persistent by0cs
  persistent nty0
  persistent twodpi
  persistent xsml

  alnhaf = -0.69314718055994530941723212145818;
  twodpi = 0.636619772367581343075535053490057;

  if ( isempty ( nty0 ) )
    by0cs = [ ...
      -0.1127783939286557321793980546028E-01, ...
      -0.1283452375604203460480884531838, ...
      -0.1043788479979424936581762276618, ...
      +0.2366274918396969540924159264613E-01, ... 
      -0.2090391647700486239196223950342E-02, ...
      +0.1039754539390572520999246576381E-03, ...
      -0.3369747162423972096718775345037E-05, ...
      +0.7729384267670667158521367216371E-07, ...
      -0.1324976772664259591443476068964E-08, ... 
      +0.1764823261540452792100389363158E-10, ...
      -0.1881055071580196200602823012069E-12, ...
      +0.1641865485366149502792237185749E-14, ...
      -0.1195659438604606085745991006720E-16, ...
      +0.7377296297440185842494112426666E-19, ...
      -0.3906843476710437330740906666666E-21, ...
      +0.1795503664436157949829120000000E-23, ...
      -0.7229627125448010478933333333333E-26, ...
      +0.2571727931635168597333333333333E-28, ...
      -0.8141268814163694933333333333333E-31 ]';

    nty0 = r8_inits ( by0cs, 19, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r8_mach ( 3 ) );

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESY0 - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_BESY0 - Fatal error!' )
  elseif ( x <= xsml )
    y = 0.0;
    value = twodpi * ( alnhaf + log ( x ) ) * r8_besj0 ( x ) ...
      + 0.375 + r8_csevl ( 0.125 * y - 1.0, by0cs, nty0 );
  elseif ( x <= 4.0 )
    y = x * x;
    value = twodpi * ( alnhaf + log ( x ) ) * r8_besj0 ( x ) ...
      + 0.375 + r8_csevl ( 0.125 * y - 1.0, by0cs, nty0 );
  else
    [ ampl, theta ] = r8_b0mp ( x );
    value = ampl * sin ( theta );
  end

  return
end
