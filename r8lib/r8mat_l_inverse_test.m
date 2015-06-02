function r8mat_l_inverse_test ( )

%*****************************************************************************80
%
%% R8MAT_L_INVERSE_TEST tests R8MAT_L_INVERSE.
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
%
%  Each row of this definition is a COLUMN of the matrix.
%
  a = [ ...
    1.0, 2.0, 4.0,  7.0; ...
    0.0, 3.0, 5.0,  8.0; ...
    0.0, 0.0, 6.0,  9.0; ...
    0.0, 0.0, 0.0, 10.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_L_INVERSE_TEST\n' );
  fprintf ( 1, '  R8MAT_L_INVERSE inverts a lower triangular matrix.\n' );

  r8mat_print ( n, n, a, '  Matrix A to be inverted:' );
 
  b = r8mat_l_inverse ( n, a );
 
  r8mat_print ( n, n, b, '  Inverse matrix B:' );
 
  c = a * b;

  r8mat_print ( n, n, c, '  Product C = A * B:' );

  return
end
