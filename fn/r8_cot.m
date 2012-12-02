function value = r8_cot ( x )

%*****************************************************************************80
%
%% R8_COT evaluates the cotangent of an R8 argument.
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
%    Output, real VALUE, the cotangent of X.
%
  persistent cotcs
  persistent nterms
  persistent pi2rec
  persistent sqeps
  persistent xmax
  persistent xmin
  persistent xsml

  pi2rec = 0.011619772367581343075535053490057;

  if ( isempty ( nterms ) )

    cotcs = [ ...
      +0.240259160982956302509553617744970, ...
      -0.165330316015002278454746025255758E-01, ...
      -0.429983919317240189356476228239895E-04, ...
      -0.159283223327541046023490851122445E-06, ...
      -0.619109313512934872588620579343187E-09, ...
      -0.243019741507264604331702590579575E-11, ...
      -0.956093675880008098427062083100000E-14, ...
      -0.376353798194580580416291539706666E-16, ...
      -0.148166574646746578852176794666666E-18, ...
      -0.583335658903666579477984000000000E-21, ...
      -0.229662646964645773928533333333333E-23, ...
      -0.904197057307483326719999999999999E-26, ...
      -0.355988551920600064000000000000000E-28, ...
      -0.140155139824298666666666666666666E-30, ...
      -0.551800436872533333333333333333333E-33 ]';

    nterms = r8_inits ( cotcs, 15, 0.1 * r8_mach ( 3 ) );
    xmax = 1.0 / r8_mach ( 4 );
    xsml = sqrt ( 3.0 * r8_mach ( 3 ) );
    xmin = exp ( max ( log ( r8_mach ( 1 ) ), ...
      - log ( r8_mach ( 2 ) ) )  + 0.01 );
    sqeps = sqrt ( r8_mach ( 4 ) );

  end

  y = abs ( x );

  if ( y < xmin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COT - Fatal error!\n' );
    fprintf ( 1, '  |X| is too small.\n' );
    error ( 'R8_COT - Fatal error!' )
  end

  if ( xmax < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COT - Fatal error!\n' );
    fprintf ( 1, '  |X| is too big.\n' );
    error ( 'R8_COT - Fatal error!' )
  end

  ainty = r8_aint ( y );
  yrem = y - ainty;
  prodbg = 0.625 * ainty;
  ainty = r8_aint ( prodbg );
  y = ( prodbg - ainty ) + 0.625 * yrem + y * pi2rec;
  ainty2 = r8_aint ( y );
  ainty = ainty + ainty2;
  y = y - ainty2;

  ifn = r8_aint ( mod ( ainty, 2.0 ) );

  if ( ifn == 1 )
    y = 1.0 - y;
  end

  if ( 0.5 < abs ( x ) && y < abs ( x ) * sqeps )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COT - Warning!\n' );
    fprintf ( 1, '  Answer less than half precision.\n' );
    fprintf ( 1, '  |X| too big, or X nearly a nonzero multiple of pi.\n' );
  end

  if ( y == 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COT - Fatal error!\n' );
    fprintf ( 1, '  X is a multiple of pi.\n' );
    error ( 'R8_COT - Fatal error!' )

  elseif ( y <= xsml )

    value = 1.0 / y;

  elseif ( y <= 0.25 )

    value = ( 0.5 ...
      + r8_csevl ( 32.0 * y * y - 1.0, cotcs, nterms ) ) / y;

  elseif ( y <= 0.5 )

    value = ( 0.5 + r8_csevl ( 8.0 * y * y - 1.0, ...
      cotcs, nterms ) ) / ( 0.5 * y );

    value = ( value * value - 1.0 ) * 0.5 / value;

  else

    value = ( 0.5 + r8_csevl ( 2.0 * y * y - 1.0, ...
      cotcs, nterms ) ) / ( 0.25 * y );
    value = ( value * value - 1.0 ) * 0.5 / value;
    value = ( value * value - 1.0 ) * 0.5 / value;

  end

  if ( x < 0.0 )
    value = - abs ( value );
  else
    value = + abs ( value );
  end

  if ( ifn == 1 )
    value = - value;
  end

  return
end
