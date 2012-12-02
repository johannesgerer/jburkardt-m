function partition_problem_test02 ( n, w )

%*****************************************************************************80
%
%% PARTITION_PROBLEM_TEST02 tests PARTITION_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of weights.
%
%    Input, integer W(N), a set of weights.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PARTITION_PROBLEM_TEST02:\n' );
  fprintf ( 1, '  PARTITION_COUNT counts the number of exact solutions\n' );
  fprintf ( 1, '  of the partition problem.\n' );

  count = partition_count ( n, w );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        W\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %4d  %8d\n', i, w(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Number of solutions = %d\n', count );

  return
end
