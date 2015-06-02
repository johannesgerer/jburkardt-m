function r8mat_lu_test ( )

%*****************************************************************************80
%
%% R8MAT_LU_TEST tests R8MAT_LU.
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
  m = 5;
  n = 5;

  x = [ 1.0, 10.0, 4.0, 2.0, 3.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8MAT_LU_TEST\n' );
  fprintf ( 1, '  R8MAT_LU computes the LU factors of a matrix.\n' );

  a = r8mat_vand2 ( n, x );

  r8mat_print ( m, n, a, '  Matrix to be factored:' );

  [ l, p, u ] = r8mat_lu ( m, n, a );

  r8mat_print ( m, m, p, '  P factor:' );

  r8mat_print ( m, m, l, '  L factor:' );
 
  r8mat_print ( m, n, u, '  U factor:' );
 
  plu(1:m,1:n) = p(1:m,1:m)' * ( l(1:m,1:m) * u(1:m,1:n) );

  r8mat_print ( m, n, plu, '  P*L*U:' );

  return
end
