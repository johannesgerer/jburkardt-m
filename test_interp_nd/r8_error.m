function value = r8_error ( x )

%*****************************************************************************80
%
%% R8_ERROR evaluates the error function of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
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
%    Output, real VALUE, the error function of X.
%
  persistent erfcs
  persistent nterf
  persistent sqeps
  persistent sqrtpi
  persistent xbig

  sqrtpi = 1.77245385090551602729816748334115;

  if ( isempty ( nterf ) )

    erfcs = [ ...
      -0.49046121234691808039984544033376E-01, ...
      -0.14226120510371364237824741899631, ...
      +0.10035582187599795575754676712933E-01, ...
      -0.57687646997674847650827025509167E-03, ...
      +0.27419931252196061034422160791471E-04, ...
      -0.11043175507344507604135381295905E-05, ...
      +0.38488755420345036949961311498174E-07, ...
      -0.11808582533875466969631751801581E-08, ...
      +0.32334215826050909646402930953354E-10, ...
      -0.79910159470045487581607374708595E-12, ...
      +0.17990725113961455611967245486634E-13, ...
      -0.37186354878186926382316828209493E-15, ...
      +0.71035990037142529711689908394666E-17, ...
      -0.12612455119155225832495424853333E-18, ...
      +0.20916406941769294369170500266666E-20, ...
      -0.32539731029314072982364160000000E-22, ...
      +0.47668672097976748332373333333333E-24, ...
      -0.65980120782851343155199999999999E-26, ...
      +0.86550114699637626197333333333333E-28, ...
      -0.10788925177498064213333333333333E-29, ...
      +0.12811883993017002666666666666666E-31 ]';

    nterf = inits ( erfcs, 21, 0.1 * r8_mach ( 3 ) );
    xbig = sqrt ( - log ( sqrtpi * r8_mach ( 3 ) ) );
    sqeps = sqrt ( 2.0 * r8_mach ( 3 ) );

  end

  y = abs ( x );

  if ( y <= sqeps )
    value = 2.0 * x / sqrtpi;
  elseif ( y <= 1.0 )
    value = x * ( 1.0 + csevl ( 2.0 * x * x - 1.0, erfcs, nterf ) );
  elseif ( y <= xbig )
    value = 1.0 - r8_errorc ( y );
    if ( x < 0.0 )
      value = - value;
    end
  else
    value = 1.0;
    if ( x < 0.0 )
      value = - value;
    end
  end

  return
end
