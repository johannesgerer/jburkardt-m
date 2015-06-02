function x = mono_total_next_grlex ( d, n, x )

%*****************************************************************************80
%
%% MONO_TOTAL_NEXT_GRLEX: grlex next monomial with total degree equal to N.
%
%  Discussion:
%
%    We consider all monomials in a D dimensional space, with total degree N.
%
%    For example:
%
%    D = 3
%    N = 3
%
%    #  X(1)  X(2)  X(3)  Degree
%      +------------------------
%    1 |  0     0     3        3
%    2 |  0     1     2        3
%    3 |  0     2     1        3
%    4 |  0     3     0        3
%    5 |  1     0     2        3
%    6 |  1     1     1        3
%    7 |  1     2     0        3
%    8 |  2     0     1        3
%    9 |  2     1     0        3
%   10 |  3     0     0        3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer N, the degree.
%    0 <= N.
%
%    Input, integer X(D), the current monomial.
%    To start the sequence, set X = [ 0, 0, ..., 0, N ].
%
%    Output, integer X(D), the next monomial.
%    The last value in the sequence is X = [ N, 0, ..., 0, 0 ].
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_TOTAL_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'MONO_TOTAL_NEXT_GRLEX - Fatal error!' );
  end

  if ( sum ( x(1:d) ) ~= n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_TOTAL_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X does not sum to N.\n' );
    error ( 'MONO_TOTAL_NEXT_GRLEX - Fatal error!' );
  end

  if ( n == 0 )
    return
  end

  if ( x(1) == n )
    x(1) = 0;
    x(d) = n;
  else
    x = mono_next_grlex ( d, x );
  end
  return
end
