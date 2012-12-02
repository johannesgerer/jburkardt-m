function value = r4_fac ( n )

%*****************************************************************************80
%
%% R4_FAC evaluates the factorial of an I4 argument.
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
%    Input, integer N, the argument.
%
%    Output, real VALUE, the factorial of N.
%
  persistent facn
  persistent nmax
  persistent sq2pil

  sq2pil = 0.91893853320467274;

  if ( isempty ( nmax ) )

    facn = [ ...
      1.0E+00, ...
      1.0E+00, ...
      2.0E+00, ...
      6.0E+00, ...
      24.0E+00, ...
      120.0E+00, ...
      720.0E+00, ...
      5040.0E+00, ...
      40320.0E+00, ...
      362880.0E+00, ...
      3628800.0E+00, ...
      39916800.0E+00, ...
      479001600.0E+00, ...
      6227020800.0E+00, ...
      87178291200.0E+00, ...
      1307674368000.0E+00, ...
      20922789888000.0E+00, ...
      355687428096000.0E+00, ...
      6402373705728000.0E+00, ...
      0.12164510040883200E+18, ...
      0.24329020081766400E+19, ...
      0.51090942171709440E+20, ...
      0.11240007277776077E+22, ...
      0.25852016738884977E+23, ...
      0.62044840173323944E+24, ...
      0.15511210043330986E+26 ]';

    [ xmin, xmax ] = r4_gaml ( );
    nmax = r4_aint ( xmax - 1.0 );

  end

  if ( n < 0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_FAC - Fatal error!\n' );
    fprintf ( 1, '  Input argument is negative.\n' );
    error ( 'R4_FAC - Fatal error!' )

  elseif ( n <= 25 )

    value = facn(n+1);

  elseif ( n <= nmax )

    x = n + 1;
    value = exp ( ( x - 0.5 ) * log ( x ) - x + sq2pil + r4_lgmc ( x ) );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_FAC - Fatal error!\n' );
    fprintf ( 1, '  Factorial overflows.\n' );
    error ( 'R4_FAC - Fatal error!' )

  end

  return
end
