function geometry_test0243 ( )

%*****************************************************************************80
%
%% TEST0243 tests R8VEC_ANY_NORMAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 10;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0243\n' );
  fprintf ( 1, '  R8VEC_ANY_NORMAL computes a vector V2 that is normal\n' );
  fprintf ( 1, '  to a given vector V1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Test    ||V1||      ||V2||        V1.V2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ v1, seed ] = r8vec_uniform_01 ( dim_num, seed );
    v1_length = r8vec_norm ( dim_num, v1 );
    v2 = r8vec_any_normal ( dim_num, v1 );
    v2_length = r8vec_norm ( dim_num, v2 );
    v1v2_dot = v1(1:dim_num) * v2(1:dim_num)';
    fprintf ( 1, '  %6d  %10f  %10f  %10f\n', ...
      test, v1_length, v2_length, v1v2_dot );
  end

  return
end
