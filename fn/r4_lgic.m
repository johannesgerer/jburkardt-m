function value = r4_lgic ( a, x, alx )

%*****************************************************************************80
%
%% R4_LGIC evaluates the log complementary incomplete gamma function for large X.
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
%    Input, real A, the parameter.
%
%    Input, real X, the argument.
%
%    Input, real ALX, the logarithm of X.
%
%    Output, real VALUE, the log complementary incomplete
%    gamma function.
%
  persistent eps

  if ( isempty ( eps ) )
    eps = 0.5 * r4_mach ( 3 );
  end

  xpa = x + 1.0 - a;
  xma = x - 1.0 - a;

  r = 0.0;
  p = 1.0;
  s = p;
  for k = 1 : 200
    fk = k;
    t = fk * ( a - fk ) * ( 1.0 + r );
    r = - t / ( ( xma + 2.0 * fk ) * ( xpa + 2.0 * fk ) + t );
    p = r * p;
    s = s + p;
    if ( abs ( p ) < eps * s )
      value = a * alx - x + log ( s / xpa );
      return
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R4_LGIC - Fatal error!\n' );
  fprintf ( 1, '  No convergence in 200 iterations.\n' );

  error ( 'R4_LGIC - Fatal error!' )
end
