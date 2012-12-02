function value = r4_binom ( n, m )

%*****************************************************************************80
%
%% R4_BINOM evaluates the binomial coefficient using R4 arithmetic.
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
%    Input, integer N, M, the arguments.
%
%    Output, real VALUE, the binomial coefficient.
%
  persistent sq2pil
  persistent bilnmx
  persistent fintmx

  sq2pil = 0.91893853320467274;

  if ( isempty ( bilnmx ) )
    bilnmx = log ( r4_mach ( 2 ) );
    fintmx = 0.9 / r4_mach ( 3 );
  end

  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BINOM - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'R4_BINOM - Fatal error!' )
  end

  if ( m < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BINOM - Fatal error!\n' );
    fprintf ( 1, '  M < 0.\n' );
    error ( 'R4_BINOM - Fatal error!' )
  end

  if ( n < m )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BINOM - Fatal error!\n' );
    fprintf ( 1, '  N < M.\n' );
    error ( 'R4_BINOM - Fatal error!' )
  end

  k = min ( m, n - m );

  if ( k <= 20 && k * log ( max ( n, 1 ) ) <= bilnmx )

    value = 1.0;

    for i = 1 : k
      value = value * ( n - i + 1 ) / i;
    end

  else

    if ( k < 9 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_BINOM - Fatal error!\n' );
      fprintf ( 1, '  Result overflows.\n' );
      fprintf ( 1, '  N or M is too big.\n' );
      error ( 'R4_BINOM - Fatal error!' )
    end

    xn = n + 1;
    xk = k + 1;
    xnk = n - k + 1;

    corr = r4_lgmc ( xn ) - r4_lgmc ( xk ) - r4_lgmc ( xnk );

    value = xk * log ( xnk / xk ) ...
      - xn * r4_lnrel ( - ( xk - 1.0 ) / xn ) ...
      - 0.5 * log ( xn * xnk / xk ) + 1.0 - sq2pil + corr;

    if ( bilnmx < value )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R4_BINOM - Fatal error!\n' );
      fprintf ( 1, '  Result overflows.\n' );
      fprintf ( 1, '  N or M is too big.\n' );
      error ( 'R4_BINOM - Fatal error!' )
    end

    value = exp ( value );

  end

  if ( value < fintmx )
    value = r4_aint ( value + 0.5 );
  end

  return
end
