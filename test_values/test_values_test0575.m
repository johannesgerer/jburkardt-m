function test_values_test0575 ( )

%*****************************************************************************80
%
%% TEST0575 demonstrates the use of DEDEKIND_SUM_VALUES.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 July 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0575:\n' );
  fprintf ( 1, '  DEDEKIND_SUM_VALUES stores values of the Dedekind sum:\n' );
  fprintf ( 1, '  (N/D) = Dedekind_Sum ( P, Q ).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       P       Q       N       D\n' );
  fprintf ( 1, '\n' );

  n_data = 0;

  while ( 1 )

    [ n_data, p, q, n, d ] = dedekind_sum_values ( n_data );

    if ( n_data == 0 )
      break
    end

    fprintf ( 1, '  %6d  %6d  %6d  %6d\n', p, q, n, d );

  end

  return
end
