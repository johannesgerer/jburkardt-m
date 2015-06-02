function r8mat_solve_3d_test ( )

%*****************************************************************************80
%
%% R8MAT_SOLVE_3D_TEST tests R8MAT_SOLVE_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2011
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  test_num = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_SOLVE_3D_TEST\n' );
  fprintf ( 1, '  R8MAT_SOLVE_3D solves 3D linear systems.\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ a, seed ] = r8mat_uniform_01 ( n, n, seed );
    [ x, seed ] = r8vec_uniform_01 ( n, seed );
    b(1:n,1) = a(1:n,1:n) * x(1:n);

    [ x2, det ] = r8mat_solve_3d ( a, b );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Solution / Computed:\n' );
    fprintf ( 1, '\n' );

    for i = 1 : n
      fprintf ( 1, '  %14f  %14f\n', x(i), x2(i) );
    end

  end

  return
end
