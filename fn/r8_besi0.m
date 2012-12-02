function value = r8_besi0 ( x )

%*****************************************************************************80
%
%% R8_BESI0 evaluates the Bessel function I of order 0 of an R8 argument.
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
%    Output, real VALUE, the Bessel function I of order 0 of X.
%
  persistent bi0cs
  persistent nti0
  persistent xmax
  persistent xsml

  if ( isempty ( nti0 ) )
    bi0cs = [ ...
      -0.7660547252839144951081894976243285E-01, ...
      +0.1927337953993808269952408750881196E+01, ...
      +0.2282644586920301338937029292330415, ...
      +0.1304891466707290428079334210691888E-01, ...
      +0.4344270900816487451378682681026107E-03, ...
      +0.9422657686001934663923171744118766E-05, ...
      +0.1434006289510691079962091878179957E-06, ...
      +0.1613849069661749069915419719994611E-08, ...
      +0.1396650044535669699495092708142522E-10, ...
      +0.9579451725505445344627523171893333E-13, ...
      +0.5333981859862502131015107744000000E-15, ...
      +0.2458716088437470774696785919999999E-17, ...
      +0.9535680890248770026944341333333333E-20, ...
      +0.3154382039721427336789333333333333E-22, ...
      +0.9004564101094637431466666666666666E-25, ...
      +0.2240647369123670016000000000000000E-27, ...
      +0.4903034603242837333333333333333333E-30, ...
      +0.9508172606122666666666666666666666E-33 ]';
    nti0 = r8_inits ( bi0cs, 18, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 8.0 * r8_mach ( 3 ) );
    xmax = log ( r8_mach ( 2 ) );
  end

  y = abs ( x );

  if ( y <= xsml )
    value = 1.0;
  elseif ( y <= 3.0 )
    value = 2.75 + r8_csevl ( y * y / 4.5 - 1.0, bi0cs, nti0 );
  elseif ( y <= xmax )
    value = exp ( y ) * r8_besi0e ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESI0 - Fatal error!\n' );
    fprintf ( 1, '  |X| too large.\n' );
    error ( 'R8_BESI0 - Fatal error!' )
  end

  return
end
