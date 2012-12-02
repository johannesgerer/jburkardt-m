function i4lib_test35 ( )

%*****************************************************************************80
%
%% TEST35 tests I4MAT_U1_INVERSE.
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
  n = 6;
%
%  Each row of this definition is a COLUMN of the matrix.
%
  a = [ ...
    1,  0,  0,  0,  0,  0; ...
    2,  1,  0,  0,  0,  0; ...
    0,  0,  1,  0,  0,  0; ...
    5,  0,  3,  1,  0,  0; ...
    0,  0,  0,  0,  1,  0; ...
   75,  0,  0,  6,  4,  1 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST35\n' );
  fprintf ( 1, '  I4MAT_U1_INVERSE inverts a unit upper triangular matrix.\n' );

  i4mat_print ( n, n, a, '  The original matrix:' );
 
  b = i4mat_u1_inverse ( n, a );
 
  i4mat_print ( n, n, b, '  The inverse matrix:' );

  c(1:n,1:n) = a(1:n,1:n) * b(1:n,1:n);

  i4mat_print ( n, n, c, '  The product:' );

  return
end
