function value = r8_cos ( x )

%*****************************************************************************80
%
%% R8_COS evaluates the cosine of an R8 argument.
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
%    Output, real VALUE, the cosine of X.
%
  persistent ntsn
  persistent pi2
  persistent pi2rec
  persistent pihi
  persistent pilo
  persistent pirec
  persistent sincs
  persistent xmax
  persistent xsml
  persistent xwarn
%
%  pihi + pilo = pi.  pihi is exactly representable on all machines
%  with at least 8 bits of precision.  whether it is exactly
%  represented depends on the compiler.  this routine is more
%  accurate if it is exactly represented.
%
  pi2 = 1.57079632679489661923132169163975;
  pi2rec = 0.63661977236758134307553505349006;
  pihi = 3.140625;
  pilo = 9.6765358979323846264338327950288E-04;
  pirec = 0.31830988618379067153776752674503;

  if ( isempty ( ntsn ) )

    sincs = [ ...
      -0.374991154955873175839919279977323464, ...
      -0.181603155237250201863830316158004754, ...
      +0.005804709274598633559427341722857921, ...
      -0.000086954311779340757113212316353178, ...
      +0.000000754370148088851481006839927030, ...
      -0.000000004267129665055961107126829906, ...
      +0.000000000016980422945488168181824792, ...
      -0.000000000000050120578889961870929524, ...
      +0.000000000000000114101026680010675628, ...
      -0.000000000000000000206437504424783134, ...
      +0.000000000000000000000303969595918706, ...
      -0.000000000000000000000000371357734157, ...
      +0.000000000000000000000000000382486123, ...
      -0.000000000000000000000000000000336623, ...
      +0.000000000000000000000000000000000256 ]';

    ntsn = r8_inits ( sincs, 15, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( 2.0 * r8_mach ( 3 ) );
    xmax = 1.0 / r8_mach ( 4 );
    xwarn = sqrt ( xmax );

  end

  absx = abs ( x );
  y = absx + pi2;

  if ( xmax < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COS - Warning!\n' );
    fprintf ( 1, '  No precision because |X| is big.\n' );
    value = 0.0
    return
  end

  if ( xwarn < y )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_COS - Warning!\n' );
    fprintf ( 1, '  Answer < half precision because |X| is big.\n' );
  end

  value = 1.0;

  if ( absx < xsml )
    return
  end

  xn = r8_aint ( y * pirec + 0.5 );
  n2 = r8_aint ( mod ( xn, 2.0 ) + 0.5 );
  xn = xn - 0.5;
  f = ( absx - xn * pihi ) - xn * pilo;

  xn = 2.0 * ( f * pi2rec ) * ( f * pi2rec ) - 1.0;

  value = f + f * r8_csevl ( xn, sincs, ntsn );

  if ( n2 ~= 0 )
    value = - value;
  end

  if ( value < -1.0 )
    value = -1.0;
  elseif ( 1.0 < value )
    value = 1.0;
  end

  return
end
