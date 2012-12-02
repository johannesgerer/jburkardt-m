function linplus_test54 ( )

%*****************************************************************************80
%
%% TEST54 tests R8SD_CG.
%
%  Discussion:
%
%    NX and NY are the number of grid points in the X and Y directions.
%    N is the number of unknowns.
%    NDIAG is the number of nonzero diagonals we will store.  We only
%      store the main diagonal, and the superdiagonals.
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
  ndiag = 3;
  nx = 10;
  ny = 10;
  n = nx * ny;
  offset = [ 0, 1, nx ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST54\n' );
  fprintf ( 1, '  R8SD_CG applies the conjugate gradient method\n' );
  fprintf ( 1, '    to a symmetric positive definite linear\n' );
  fprintf ( 1, '    system stored by diagonals.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order N = %d\n', n );
  fprintf ( 1, '  Number of diagonals is %d\n', ndiag );
  fprintf ( 1, '\n' );
%
%  Now we compute the numbers that go into the diagonals.  For this
%  problem, we could simply store a column of 4's, and two columns of
%  -1's, but I wanted to go through the motions of thinking about the
%  value of each entry.  "K" counts the row of the original matrix
%  that we are working on.
%
  k = 0;
  for j = 1 : ny
    for i = 1 : nx

      k = k + 1;
%
%  Central
%
      a(k,1) = 4.0E+00;
%
%  East ( = West )
%
      if ( i == nx )
        a(k,2) = 0.0E+00;
      else
        a(k,2) = -1.0E+00;
      end
%
%  North ( = South )
%
      if ( j == ny )
        a(k,3) = 0.0E+00;
      else
        a(k,3) = -1.0E+00;
      end

    end
  end
%
%  Print some of the matrix.
%
  r8sd_print_some ( n, ndiag, offset, a, 1, 1, 10, 10, ...
    '  First 10 rows and columns of matrix:' );
%
%  Set the desired solution.
%
  k = 0;
  for j = 1: ny
    for i = 1 : nx
      k = k + 1;
      x(k) = 10 * i + j;
    end
  end
%
%  Compute the corresponding right hand side.
%
  b = r8sd_mxv ( n, ndiag, offset, a, x );

  r8vec_print_some ( n, b, 1, 10, '  Right hand side:' );
%
%  Set X to zero so no one accuses us of cheating.
%
  x(1:n) = 0.0E+00;
%
%  Call the conjugate gradient method.
%
  x = r8sd_cg ( n, ndiag, offset, a, b, x );
%
%  Compute the residual, A*x-b
%
  b2 = r8sd_mxv ( n, ndiag, offset, a, x );
 
  err = max ( abs ( b2(1:n) - b(1:n) ) );
 
  r8vec_print_some ( n, x, 1, 10, '  Solution:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum residual = %f\n', err );
%
%  Note that if we're not satisfied with the solution, we can
%  again, using the computed X as our starting estimate.
%
%
%  Call the conjugate gradient method AGAIN.
%
  x = r8sd_cg ( n, ndiag, offset, a, b, x );
%
%  Compute the residual, A*x-b
%
  b2 = r8sd_mxv ( n, ndiag, offset, a, x );
 
  err = max ( abs ( b2(1:n) - b(1:n) ) );
 
  r8vec_print_some ( n, x, 1, 10, '  Second attempt at solution:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Maximum residual of second attempt = %f\n', err );

  return
end
