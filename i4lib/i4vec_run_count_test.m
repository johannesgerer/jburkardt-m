function i4vec_run_count_test ( )

%*****************************************************************************80
%
%% I4VEC_RUN_COUNT_TEST tests I4VEC_RUN_COUNT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 20;
  test_num = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_RUN_COUNT_TEST\n' );
  fprintf ( 1, '  I4VEC_RUN_COUNT counts runs in an I4VEC\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ' Run Count        Sequence\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = i4vec_uniform_ab ( n, 0, 1, seed );

    run_count = i4vec_run_count ( n, a );

    fprintf ( 1, '  %8d        ', run_count )
    for i = 1 : n
      fprintf ( 1, '%2d', a(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
