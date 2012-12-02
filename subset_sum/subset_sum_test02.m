function count = subset_sum_test02 ( w, t, r )

%*****************************************************************************80
%
%% SUBSET_SUM_TEST02 counts solutions for a given subset sum problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 May 2012
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
  fprintf ( 1, 'SUBSET_SUM_TEST02:\n' );
  fprintf ( 1, '  Count solutions to the subset sum problem in a given range.\n' );
  fprintf ( 1, '\n' );
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
    r(1) = 0;
    r(2) = 2^n - 1;
  end

  count = subset_sum_count ( w, t, r );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of solutions in [%d,%d] is %d.\n', r(1), r(2), count );

  return
end
