function value = r4_sin ( x )

%*****************************************************************************80
%
%% R4_SIN evaluates the sine of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2011
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
%    Output, real VALUE, the sine of X.
%
  persistent ntsn
  persistent pi2rec
  persistent pihi
  persistent pilo
  persistent pirec
  persistent sincs
  persistent xmax
  persistent xsml
  persistent xwarn

  pihi = 3.140625;
  pilo = 9.6765358979323846E-04;
  pirec = 0.31830988618379067;
  pi2rec = 0.636619772367581343;

  if ( isempty ( ntsn ) )

    sincs = [ ...
     -0.374991154955873175840, ...
     -0.181603155237250201864, ...
     +0.005804709274598633559, ...
     -0.000086954311779340757, ...
     +0.000000754370148088851, ...
     -0.000000004267129665056, ...
     +0.000000000016980422945, ...
     -0.000000000000050120579, ...
     +0.000000000000000114101, ...
     -0.000000000000000000206 ]';

    ntsn = r4_inits ( sincs, 10, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( 6.0 * r4_mach ( 3 ) );
    xmax = 1.0 / r4_mach ( 4 );
    xwarn = sqrt ( xmax );

  end

  y = abs ( x );

  if ( xmax < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_SIN - Warning!\n' );
    fprintf ( 1, '  No precision because |X| is big.\n' );
    value = 0.0;
    return
  end

  if ( xwarn < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_SIN - Warning!\n' );
    fprintf ( 1, '  Answer < half precision because |X| is big.\n' );
  end

  value = x;

  if ( y < xsml )
    return
  end

  xn = r4_aint ( y * pirec + 0.5 );
  n2 = r4_aint ( mod ( xn, 2.0 ) + 0.5 );
  sgn = x;
  if ( n2 ~= 0 )
    sgn = - sgn;
  end

  f = ( y - xn * pihi ) - xn * pilo;
  xn = 2.0 * ( f * pi2rec ) * ( f * pi2rec ) - 1.0;

  value = f + f * r4_csevl ( xn, sincs, ntsn );

  if ( sgn < 0.0 )
    value = - value;
  end

  if ( value < - 1.0 )
    value = - 1.0;
  elseif ( 1.0 < value )
    value = 1.0;
  end

  return
end
