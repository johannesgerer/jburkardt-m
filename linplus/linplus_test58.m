function linplus_test58 ( )

%*****************************************************************************80
%
%% TEST58 tests R8SS_MXV, R8SS_PRINT.
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
  n = 9;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST58\n' );
  fprintf ( 1, '  For a symmetric skyline storage matrix,\n' );
  fprintf ( 1, '  R8SS_MXV computes A*x,\n' );
  fprintf ( 1, '  R8SS_PRINT prints it.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
%
%  Set the matrix.
%
  [ na, diag, a, seed ] = r8ss_random ( n, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nonzero entries stored is %d\n', na );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Diagonal storage indices:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%6d  %6d\n', i, diag(i) );
  end
%
%  Replace the random entries by marker values.
%
  ij = 0;
  for j = 1 : n

    if ( j == 1 )
      ilo = 1;
    else
      ilo = diag(j-1) - diag(j) + j + 1;
    end

    for i = ilo : j
      ij = ij + 1;
      a(ij) = 10 * i + j;
    end

  end

  r8ss_print ( n, na, diag, a, '  The R8SS matrix:' );
%
%  Copy the matrix into a general matrix.
%
  a2 = r8ss_to_r8ge ( n, na, diag, a );
%
%  Set the vector X.
%
  x = r8vec_indicator ( n );
%
%  Compute the product.
%
  b = r8ss_mxv ( n, na, diag, a, x );
%
%  Compute the product using the general matrix.
%
  b2 = r8ge_mxv ( n, n, a2, x );
%
%  Compare the results.
%
  r8vec2_print_some ( n, b, b2, 10, '  R8SS_MXV verse R8GE_MXV' );

  return
end
