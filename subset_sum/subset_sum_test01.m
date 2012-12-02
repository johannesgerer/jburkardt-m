function [ c, index ] = subset_sum_test01 ( w, t, r )

%*****************************************************************************80
%
%% SUBSET_SUM_TEST01 returns a solution of the subset sum problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer W(N), a set of weights.  The length of this
%    array must be no more than 31.
%
%    Input, integer T, the target value.
%
%    Input, integer R(2), the lower and upper limits to be searched.
%    If this argument is omitted, the entire range, [0, 2^N-1 ] will
%    be searched.
%
  n = length ( w );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SUBSET_SUM_TEST01:\n' );
  fprintf ( 1, '  Seek a subset of W that sums to T.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Target value T = %d\n', t );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I       W(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %2d  %8d\n', i, w(i) );
  end

  if ( nargin == 2 )
    [ c, index ] = subset_sum_find ( w, t );
  elseif ( nargin == 3 )
    [ c, index ] = subset_sum_find ( w, t, r );
  end

  if ( isempty ( i ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  No solution was found.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solution code: %d\n', index );
  fprintf ( 1, '  Binary version:  ' );
  for i = 1 : n
    fprintf ( 1, '%d', bitget ( index, i ) );
  end
  fprintf ( 1, '\n' );

  total = 0;
  n2 = length ( c );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   #   I       W(I)\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n2
    total = total + w(c(i));
    fprintf ( 1, '  %2d  %2d  %8d\n', i, c(i), w(c(i)) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Total:  %8d\n', total );

  return
end
