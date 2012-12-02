function sparse_test02 ( )

%*****************************************************************************80
%
%% SPARSE_TEST02 demonstrates a simple use of the SPARSE matrix facility.
%
%  Discussion:
%
%    This is a nice but very simple example.  
%
%    Note in this example that we define three sparse matrices,
%    SUP, DIAG, and SUB, and then define A as the sum of those matrices.
%
%    However, again, each time we define a sparse matrix, we are assuming
%    we have all the information available at one time.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield and John Penny,
%    Numerical Methods Using MATLAB,
%    Prentice Hall, 1999
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST02:\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPARSE facility\n' );
  fprintf ( 1, '  to define a sparse matrix, and solve an associated\n' );
  fprintf ( 1, '  linear system.\n' );

  n = 100;
%
%  We set up the three diagonals of the -1, 2, -1 matrix.
%
  sup  = sparse ( 1:n-1, 2:n,   -1.0, n, n );
  diag = sparse ( 1:n,   1:n,    2.0, n, n );
  sub  = sparse ( 2:n,   1:n-1, -1.0, n, n );
%
%  A is the matrix whose superdiagonal, diagonal, and subdiagonal
%  have been set above.  Because SUP, DIAG and SUB are sparse,
%  A will "inherit" this property.
%
  A = sup + diag + sub;
%
%  Set up a right hand side b that defines a linear system whose
%  solution is [ 1, 2, 3, ..., n ].
%
  b(1:n-1,1) = 0.0;
  b(n,1) = n + 1;
%
%  Use MATLAB's backslash command to solve the linear system.
%  Because MATLAB "knows" that A is a sparse matrix, it will
%  automatically do the efficient thing.
%
  x = A \ b;
%
%  Print the solution.
%
  x(1:n)
  
  return
end
