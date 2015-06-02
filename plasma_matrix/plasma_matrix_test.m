function plasma_matrix_test ( n )

%*****************************************************************************80
%
%% PLASMA_MATRIX_TEST tests PLASMA_MATRIX.
%
%  Discussion:
%
%    This program shows how a MATLAB sparse matrix (and possibly a right
%    hand side vector) can be stored into a Harwell-Boeing file,
%    and later retrieved.
%
%    Harwell-Boeing files are useful as a means of storing sparse matrices,
%    especially when data is created with one program and needed by another.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLASMA_MATRIX_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Create a large sparse plasma matrix and right hand side.\n' );
  fprintf ( 1, '  Store the matrix and right hand side in a Harwell-Boeing file.\n' );
  fprintf ( 1, '  Then retrieve the information.\n' );

  plasma_matrix_test01 ( 5 );
  plasma_matrix_test01 ( 100 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PLASMA_MATRIX_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
