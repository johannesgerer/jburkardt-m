function x = mono_upto_next_grlex ( m, n, x )

%*****************************************************************************80
%
%% MONO_UPTO_NEXT_GRLEX: grlex next monomial with total degree up to N.
%
%  Discussion:
%
%    We consider all monomials in an M dimensional space, with total
%    degree up to N.
%
%    For example:
%
%    M = 3
%    N = 3
%
%    #  X(1)  X(2)  X(3)  Degree
%      +------------------------
%    1 |  0     0     0        0
%      |
%    2 |  0     0     1        1
%    3 |  0     1     0        1
%    4 |  1     0     0        1
%      |
%    5 |  0     0     2        2
%    6 |  0     1     1        2
%    7 |  0     2     0        2
%    8 |  1     0     1        2
%    9 |  1     1     0        2
%   10 |  2     0     0        2
%      |
%   11 |  0     0     3        3
%   12 |  0     1     2        3
%   13 |  0     2     1        3
%   14 |  0     3     0        3
%   15 |  1     0     2        3
%   16 |  1     1     1        3
%   17 |  1     2     0        3
%   18 |  2     0     1        3
%   19 |  2     1     0        3
%   20 |  3     0     0        3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the maximum degree.
%    0 <= N.
%
%    Input, integer X(M), the current monomial.
%    To start the sequence, set X = [ 0, 0, ..., 0, 0 ].
%
%    Output, integer X(M), the next monomial.
%    The last value in the sequence is X = [ N, 0, ..., 0, 0 ].
%
  if ( n < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_UPTO_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  N < 0.\n' );
    error ( 'MONO_UPTO_NEXT_GRLEX - Fatal error!' );
  end

  if ( sum ( x(1:m) ) < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_UPTO_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X sums to less than 0.\n' );
    error ( 'MONO_UPTO_NEXT_GRLEX - Fatal error!' );
  end

  if ( n < sum ( x(1:m) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_UPTO_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X sums to more than N.\n' );
    error ( 'MONO_UPTO_NEXT_GRLEX - Fatal error!' );
  end

  if ( n == 0 )
    return
  end

  if ( x(1) == n )
    x(1) = 0;
  else
    x = mono_next_grlex ( m, x );
  end

  return
end
