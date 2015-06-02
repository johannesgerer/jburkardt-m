function sparse_test04 ( )

%*****************************************************************************80
%
%% SPARSE_TEST04 demonstrates incrementing a sparse matrix.
%
%  Discussion:
%
%    For this example, we show that you don't need to have the entire
%    sparse matrix data available in order to start defining the matrix.
%    (Of course, it is more efficient to make fewer calls, with more data,
%    but it is not the only way to work.)
%
%    For simplicity, we assume the matrix is 10 x 10, and we 
%    generate 50 random coordinate pairs (I,J), and increment them by 1.
%    Initially, the sparse matrix is empty, but each time we call,
%    we are either creating a new entry, or incrementing an existing one.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Lindfield, John Penny,
%    Numerical Methods Using MATLAB,
%    Prentice Hall, 1999
%  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_TEST04:\n' );
  fprintf ( 1, '  Demonstrate the use of MATLAB''s SPARSE facility\n' );
  fprintf ( 1, '  to set or increment a matrix one entry at a time.\n' );
%
%  This defines an "empty" sparse matrix.
%
  i = [];
  j = [];
  v = [];
  m = 10;
  n = 10;

  a = sparse ( i, j, v, m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J  New A(I,J)\n' );
  fprintf ( 1, '\n' );
  
  for test = 1 : 50

    i = round ( 10.0 * rand ( ) + 0.5 );
    j = round ( 10.0 * rand ( ) + 0.5 );
    a(i,j) = a(i,j) + 1;
%
%  FPRINTF won't print a sparse matrix reference,
%  so you have to convert it to FULL first.
%  
    fprintf ( 1, '  %4d  %4d  %g\n', i, j, full ( a(i,j) ) );
    
  end    
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nonzero entries is %d\n', nnz ( a ) );
%
%  FPRINT won't print the SUM SUM of A,
%  so you have to convert it to FULL first.
%
  fprintf ( 1, '  Sum of entries is %f\n', full ( sum ( sum ( a ) ) ) );
%
%  Typing "a" will list the sparse triplet form of the matrix.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix printed in sparse triplet form:\n' );
  fprintf ( 1, '\n' );

  a
%
%  To see the usual layout, you must convert it to FULL.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix printed in usual full matrix form:\n' );
  fprintf ( 1, '\n' );

  full ( a )
  
  return
end
