function geometry_test0234 ( )

%*****************************************************************************80
%
%% TEST0234 tests R8MAT_SOLVE_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  n = 2;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0234\n' );
  fprintf ( 1, '  R8MAT_SOLVE_2D solves 2D linear systems.\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
    [ x(1:n,1), seed ] = r8vec_uniform_01 ( n, seed );
    b(1:n,1) = a(1:n,1:n) * x(1:n,1);

    [ det, x2 ] = r8mat_solve_2d ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Solution / Computed:\n' );
    fprintf ( 1, '\n' );

    for i = 1 : n
      fprintf ( 1, '  %14f  %14f\n', x(i,1), x2(i,1) );
    end

  end

  return
end
