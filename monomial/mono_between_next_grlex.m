function x = mono_between_next_grlex ( m, n1, n2, x )

%*****************************************************************************80
%
%% MONO_BETWEEN_NEXT_GRLEX: grlex next monomial, degree between N1 and N2.
%
%  Discussion:
%
%    We consider all monomials in an M dimensional space, with total
%    degree N between N1 and N2, inclusive.
%
%    For example:
%
%    M = 3
%    N1 = 2
%    N2 = 3
%
%    #  X(1)  X(2)  X(3)  Degree
%      +------------------------
%    1 |  0     0     2        2
%    2 |  0     1     1        2
%    3 |  0     2     0        2
%    4 |  1     0     1        2
%    5 |  1     1     0        2
%    6 |  2     0     0        2
%      |
%    7 |  0     0     3        3
%    8 |  0     1     2        3
%    9 |  0     2     1        3
%   10 |  0     3     0        3
%   11 |  1     0     2        3
%   12 |  1     1     1        3
%   13 |  1     2     0        3
%   14 |  2     0     1        3
%   15 |  2     1     0        3
%   16 |  3     0     0        3
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
%    Input, integer M, the spatial dimension.
%
%    Input, integer N1, N2, the minimum and maximum degrees.
%    0 <= N1 <= N2.
%
%    Input, integer X(M), the current monomial.
%    To start the sequence, set X = [ 0, 0, ..., 0, N1 ].
%
%    Output, integer X(M), the next monomial.
%    The last value in the sequence is X = [ N2, 0, ..., 0, 0 ].
%
  if ( n1 < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  N1 < 0.\n' );
    error ( 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!' );
  end

  if ( n2 < n1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  N2 < N1.\n' );
    error ( 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!' );
  end

  if ( sum ( x(1:m) ) < n1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X sums to less than N1.\n' );
    error ( 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!' );
  end

  if ( n2 < sum ( x(1:m) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X sums to more than N2.\n' );
    error ( 'MONO_BETWEEN_NEXT_GRLEX - Fatal error!' );
  end

  if ( n2 == 0 )
    return
  end

  if ( x(1) == n2 )
    x(1) = 0;
    x(m) = n1;
  else
    x = mono_next_grlex ( m, x );
  end
  return
end
