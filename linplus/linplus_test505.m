function linplus_test505 ( )

%*****************************************************************************80
%
%% TEST505 tests R8PO_FA;
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
  n = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST505\n' );
  fprintf ( 1, '  R8PO_FA factors a positive definite symmetric\n' );
  fprintf ( 1, '    linear system,\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );

  for i = 1 : n
    for j = 1 : n
      a(i,j) = min ( i, j );
    end
  end

  r8po_print ( n, a, '  The matrix A:' );
%
%  Factor the matrix.
%
  [ r, info ] = r8po_fa ( n, a );

  if ( info ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Fatal error!\n' );
    fprintf ( 1, '  R8PO_FA declares the matrix is singular!\n' );
    fprintf ( 1, '  The value of INFO is %d\n', info );
    return
  end

  r8ut_print ( n, n, r, '  The factor R (a R8UT matrix):' );
%
%  Compute the product R' * R.
%
  rtr(1:n,1:n) = r(1:n,1:n)' * r(1:n,1:n);

  r8ge_print ( n, n, rtr, '  The product R'' * R:' );

  return
end
