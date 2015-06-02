function r8mat_det_4d_test ( )

%*****************************************************************************80
%
%% R8MAT_DET_4D_TEST tests R8MAT_DET_4D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 4;

  x = [ 1.0, 10.0, 4.0, 2.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_DET_4D_TEST\n' );
  fprintf ( 1, '  R8MAT_DET_4D determinant of a 4 by 4 matrix;\n' );

  a = r8mat_vand2 ( n, x );
  det = r8mat_det_4d ( a );

  r8mat_print ( n, n, a, '  Matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8MAT_DET_4D computes determinant: %f\n', det );
%
%  Special formula for the determinant of a Vandermonde matrix:
%
  det = 1.0;
  for i = 1 : n
    for j = 1 : i-1
      det = det * ( x(i) - x(j) );
    end
  end

  fprintf ( 1, '  Exact determinant is %f\n', det );

  return
end
