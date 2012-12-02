function value = r8_tanh ( x )

%*****************************************************************************80
%
%% R8_TANH evaluates the hyperbolic tangent of an R8 argument.
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
%    Output, real VALUE, the hyperbolic tangent of X.
%
  persistent nterms
  persistent sqeps
  persistent tanhcs
  persistent xmax

  if ( isempty ( nterms ) )
    tanhcs = [ ...
      -0.25828756643634710438338151450605, ...
      -0.11836106330053496535383671940204, ...
      +0.98694426480063988762827307999681E-02, ...
      -0.83579866234458257836163690398638E-03, ...
      +0.70904321198943582626778034363413E-04, ...
      -0.60164243181207040390743479001010E-05, ...
      +0.51052419080064402965136297723411E-06, ...
      -0.43320729077584087216545467387192E-07, ...
      +0.36759990553445306144930076233714E-08, ...
      -0.31192849612492011117215651480953E-09, ...
      +0.26468828199718962579377758445381E-10, ...
      -0.22460239307504140621870997006196E-11, ...
      +0.19058733768288196054319468396139E-12, ...
      -0.16172371446432292391330769279701E-13, ...
      +0.13723136142294289632897761289386E-14, ...
      -0.11644826870554194634439647293781E-15, ...
      +0.98812684971669738285540514338133E-17, ...
      -0.83847933677744865122269229055999E-18, ...
      +0.71149528869124351310723506176000E-19, ...
      -0.60374242229442045413288837119999E-20, ...
      +0.51230825877768084883404663466666E-21, ...
      -0.43472140157782110106047829333333E-22, ...
      +0.36888473639031328479423146666666E-23, ...
      -0.31301874774939399883325439999999E-24, ...
      +0.26561342006551994468488533333333E-25, ...
      -0.22538742304145029883494399999999E-26, ...
      +0.19125347827973995102208000000000E-27, ...
      -0.16228897096543663117653333333333E-28, ...
      +0.13771101229854738786986666666666E-29, ...
      -0.11685527840188950118399999999999E-30, ...
      +0.99158055384640389120000000000000E-32 ]';
    nterms = r8_inits ( tanhcs, 31, 0.1 * r8_mach ( 3 ) );
    sqeps = sqrt ( 3.0 * r8_mach ( 3 ) );
    xmax = - 0.5 * log ( r8_mach ( 3 ) );
  end

  y = abs ( x );

  if ( y <= sqeps )

    value = x;

  elseif ( y <= 1.0 )

    value = x * ( 1.0 + r8_csevl ( 2.0 * x * x - 1.0, tanhcs, nterms ) );

  elseif ( y <= xmax )

    y = exp ( y );
    yrec = 1.0 / y;
    value = ( y - yrec ) / ( y + yrec );

    if ( x < 0.0 )
      value = - value;
    end

  else

    if ( x < 0.0 )
      value = - 1.0;
    else
      value = + 1.0;
    end

  end

  return
end
