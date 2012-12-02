function value = r4_tan ( x )

%*****************************************************************************80
%
%% R4_TAN evaluates the tangent of an R4 argument.
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
%    Output, real VALUE, the tangent of X.
%
  persistent nterms
  persistent sqeps
  persistent tancs
  persistent xmax
  persistent xsml

  pi2rec = 0.0116197723675813430;

  if ( isempty ( nterms ) )
    tancs = [ ...
      0.226279327631293578, ...
      0.0430179131465489618, ...
      0.0006854461068256508, ...
      0.0000110453269475970, ...
      0.0000001781747790392, ...
      0.0000000028744968582, ...
      0.0000000000463748541, ...
      0.0000000000007481760, ...
      0.0000000000000120704, ...
      0.0000000000000001947, ...
      0.0000000000000000031 ]';
    nterms = r4_inits ( tancs, 11, 0.1 * r4_mach ( 3 ) );
    xmax = 1.0 / r4_mach ( 4 );
    xsml = sqrt ( 3.0 * r4_mach ( 3 ) );
    sqeps = sqrt ( r4_mach ( 4 ) );
  end

  y = abs ( x );

  if ( xmax < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_TAN - Warning!\n' );
    fprintf ( 1, '  No precision because |X| is big.\n' );
    value = 0.0;
    return
  end
%
%  Carefully compute y * (2/pi) = (aint(y) + rem(y)) * (.625 + pi2rec)
%  = aint(.625*y) + rem(.625*y) + y*pi2rec  =  aint(.625*y) + z
%  = aint(.625*y) + aint(z) + rem(z)
%
  ainty = floor ( y );
  yrem = y - ainty;
  prodbg = 0.625 * ainty;
  ainty = floor ( prodbg );
  y = ( prodbg - ainty ) + 0.625 * yrem + y * pi2rec;
  ainty2 = floor ( y );
  ainty = ainty + ainty2;
  y = y - ainty2;

  ifn = floor ( mod ( ainty, 2.0 ) );

  if ( ifn == 1 )
    y = 1.0 - y;
  end

  if ( 1.0 - y < abs ( x ) * sqeps )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_TAN - Warning!\n' );
    fprintf ( 1, '  Answer < half precision.\n' );
    fprintf ( 1, '  |X| big or X near pi/2 or 3*pi/2.\n' );
  end

  if ( y == 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_TAN - Fatal error!\n' );
    fprintf ( 1, '  X is pi/2 or 3*pi/2.\n' );
    error ( 'R4_TAN - Fatal error!' )
  end

  if ( y <= 0.25 )

    value = y;
    if ( xsml < y )
      value = y * ( 1.5 ...
        + r4_csevl ( 32.0 * y * y - 1.0, tancs, nterms ) );
    end

  elseif ( y <= 0.5 )

    value = 0.5 * y * ( 1.5 ...
      + r4_csevl ( 8.0 * y * y - 1.0, tancs, nterms ) );

    value = 2.0 * value / ( 1.0 - value * value );

  else

    value = 0.25 * y * ( 1.5 ...
      + r4_csevl ( 2.0 * y * y - 1.0, tancs, nterms ) );
    value = 2.0 * value / ( 1.0 - value * value );
    value = 2.0 * value / ( 1.0 - value * value );

  end

  if ( x < 0.0 )
    value = - abs ( value );
  elseif ( 0.0 < x )
    value = + abs ( value );
  end

  if ( ifn == 1 )
    value = - value;
  end

  return
end
