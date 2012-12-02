function linplus_test385 ( )

%*****************************************************************************80
%
%% TEST385 tests R8GE_PLU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2009
%
%  Author:
%
%    John Burkardt
%
  m = 5;
  n = 4;
  seed = 123456789;
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST385\n' );
  fprintf ( 1, '  For a matrix in general storage,\n' );
  fprintf ( 1, '  R8GE_PLU returns the PLU factors of a matrix.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix rows M =    %d\n', m );
  fprintf ( 1, '  Matrix columns N = %d\n', n );

  a = r8ge_random ( m, n, seed );

  r8ge_print ( m, n, a, '  Matrix A:' );
%
%  Compute the PLU factors.
%
  [ p, l, u ] = r8ge_plu ( m, n, a );

  r8ge_print ( m, m, p, '  Factor P:' );

  r8ge_print ( m, m, l, '  Factor L:' );

  r8ge_print ( m, n, u, '  Factor U:' );

  plu(1:m,1:n) = p(1:m,1:m) * ( l(1:m,1:m) * u(1:m,1:n) );
        
  r8ge_print ( m, n, plu, '  Product P*L*U:');

  return
end
