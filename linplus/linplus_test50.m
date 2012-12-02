function linplus_test50 ( )

%*****************************************************************************80
%
%% TEST50 tests R8PO_FA, R8PO_SL.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST50\n' );
  fprintf ( 1, '  R8PO_FA factors a positive definite symmetric\n' );
  fprintf ( 1, '    linear system,\n' );
  fprintf ( 1, '  R8PO_SL solves a factored system.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = min ( i, j );
    end
  end
%
%  Set the desired solution.
%
  x = r8vec_indicator ( n );
%
%  Compute the corresponding right hand side.
%
  b = r8po_mxv ( n, a, x );
%
%  Factor the matrix.
%
  [ a_lu, info ] = r8po_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  R8PO_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end
%
%  Solve the linear system.
%
  x = r8po_sl ( n, a_lu, b );
 
  r8vec_print ( n, x, '  Solution:' );
%
%  Set the desired solution.
%
  x(1:n) = 1;
%
%  Compute the corresponding right hand side, using the factored matrix.
%
  b = r8po_ml ( n, a, x );
%
%  Solve the linear system.
%
  x = r8po_sl ( n, a, b );
 
  r8vec_print ( n, x, '  Solution:' );

  return
end
