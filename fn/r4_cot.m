function value = r4_cot ( x )

%*****************************************************************************80
%
%% R4_COT evaluates the cotangent of an R4 argument.
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

  pi2rec = 0.0116197723675813430;

  if ( isempty ( nterms ) )

    cotcs = [ ...
      0.24025916098295630, ...
     -0.016533031601500228, ...
     -0.000042998391931724, ...
     -0.000000159283223327, ...
     -0.000000000619109313, ...
     -0.000000000002430197, ...
     -0.000000000000009560, ...
     -0.000000000000000037 ]';

    nterms = r4_inits ( cotcs, 8, 0.1 * r4_mach ( 3 ) );
    xmax = 1.0 / r4_mach ( 4 );
    xsml = sqrt ( 3.0 * r4_mach ( 3 ) );
    xmin = exp ( max ( log ( r4_mach ( 1 ) ), ...
      - log ( r4_mach ( 2 ) ) )  + 0.01 );
    sqeps = sqrt ( r4_mach ( 4 ) );

  end

  y = abs ( x );

  if ( y < xmin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_COT - Fatal error!\n' );
    fprintf ( 1, '  |X| is too small.\n' );
    error ( 'R4_COT - Fatal error!' )
  end

  if ( xmax < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_COT - Fatal error!\n' );
    fprintf ( 1, '  |X| is too big.\n' );
    error ( 'R4_COT - Fatal error!' )
  end
%
%  Carefully compute y * (2/pi) = (aint(y) + rem(y)) * (.625 + pi2rec)
%  = aint(.625*y) + rem(.625*y) + y*pi2rec  =  aint(.625*y) + z
%  = aint(.625*y) + aint(z) + rem(z)
%
  ainty = r4_aint ( y );
  yrem = y - ainty;
  prodbg = 0.625 * ainty;
  ainty = r4_aint ( prodbg );
  y = ( prodbg - ainty ) + 0.625 * yrem + y * pi2rec;
  ainty2 = r4_aint ( y );
  ainty = ainty + ainty2;
  y = y - ainty2;

  ifn = r4_aint ( mod ( ainty, 2.0 ) );

  if ( ifn == 1 )
    y = 1.0 - y;
  end

  if ( 0.5 < abs ( x ) && y < abs ( x ) * sqeps )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_COT - Warning!\n' );
    fprintf ( 1, '  Answer less than half precision.\n' );
    fprintf ( 1, '  |X| too big, or X nearly a nonzero multiple of pi.\n' );
  end

  if ( y == 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_COT - Fatal error!\n' );
    fprintf ( 1, '  X is a multiple of pi.\n' );
    error ( 'R4_COT - Fatal error!' )

  elseif ( y <= xsml )

    value = 1.0 / y;

  elseif ( y <= 0.25 )

    value = ( 0.5 + r4_csevl ( 32.0 * y * y - 1.0, cotcs, nterms ) ) / y;

  elseif ( y <= 0.5 )

    value = ( 0.5 + r4_csevl ( 8.0 * y * y - 1.0, ...
      cotcs, nterms ) ) / ( 0.5 * y );

    value = ( value * value - 1.0 ) * 0.5 / value;

  else

    value = ( 0.5 + r4_csevl ( 2.0 * y * y - 1.0, ...
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
