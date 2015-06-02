function x = mono_next_grevlex ( m, x )

%*****************************************************************************80
%
%% MONO_NEXT_GREVLEX: grevlex next monomial.
%
%  Discussion:
%
%    For example:
%
%    M = 3
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
%    7 |  1     0     1        2
%    8 |  0     2     0        2
%    9 |  1     1     0        2
%   10 |  2     0     0        2
%      |
%   11 |  0     0     3        3
%   12 |  0     1     2        3
%   13 |  1     0     2        3
%   14 |  0     2     1        3
%   15 |  1     1     1        3
%   16 |  2     0     1        3
%   17 |  0     3     0        3
%   18 |  1     2     0        3
%   19 |  2     1     0        3
%   20 |  3     0     0        3
%
%    Thanks to Stefan Klus for pointing out a discrepancy in a previous
%    version of this code, 05 February 2015.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer X(M), the current monomial.
%    The first element in the sequence is X = [ 0, 0, ..., 0, 0 ].
%
%    Output, integer X(M), the next monomial.
%
  if ( sum ( x(1:m) ) < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'MONO_NEXT_GREVLEX - Fatal error!\n' );
    fprintf ( 1, '  Input X sums to less than 0.\n' );
    error ( 'MONO_NEXT_GREVLEX - Fatal error!' );
  end
%
%  Seek the first index 1 < I for which 0 < X(I).
%
  j = 1;

  for i = 2 : m
    if ( 0 < x(i) )
      j = i;
      break
    end
  end

  if ( j == 1 )
    t = x(1);
    x(1) = 0;
    x(m) = t + 1;
  elseif ( j < m )
    x(j) = x(j) - 1;
    t = x(1) + 1;
    x(1) = 0;
    x(j-1) = x(j-1) + t;
  elseif ( j == m )
    t = x(1);
    x(1) = 0;
    x(j-1) = t + 1;
    x(j) = x(j) - 1;
  end

  return
end
