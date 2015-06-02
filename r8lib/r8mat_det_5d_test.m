function r8mat_det_5d_test ( )

%*****************************************************************************80
%
%% R8MAT_DET_5D_TEST tests R8MAT_DET_5D;
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
  n = 5;

  x = [ 1.0, 10.0, 4.0, 2.0, 3.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_DET_5D_TEST\n' );
  fprintf ( 1, '  R8MAT_DET_5D: determinant of 5 by 5 matrix.\n' );

  a = r8mat_vand2 ( n, x );
  det = r8mat_det_5d ( a );

  r8mat_print ( n, n, a, '  Matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  R8MAT_DET_5D computes determinant: %f\n', det );
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
