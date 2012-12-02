function partition_problem_test01 ( n, w )

%*****************************************************************************80
%
%% PARTITION_PROBLEM_TEST01 tests PARTITION_BRUTE.
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
  fprintf ( 1, 'PARTITION_PROBLEM_TEST01:\n' );
  fprintf ( 1, '  Partition a set of N integers W so that the subsets\n' );
  fprintf ( 1, '  have equal sums.\n' );

  [ c, discrepancy ] = partition_brute ( n, w );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        W0        W1\n' );
  fprintf ( 1, '\n' );
  w0_sum = 0;
  w1_sum = 0;
  for i = 1 : n
    if ( c(i) == 0 )
      w0_sum = w0_sum + w(i);
      fprintf ( 1, '  %4d  %8d\n', i, w(i) );
    else
      w1_sum = w1_sum + w(i);
      fprintf ( 1, '  %4d            %8d\n', i, w(i) );
    end
  end
  fprintf ( 1, '        --------  --------\n' );
  fprintf ( 1, '        %8d  %8d\n', w0_sum, w1_sum );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Discrepancy = %d\n', discrepancy );

  return
end
