%*****************************************************************************80
%
%% TEST_MATRIX_TEST tests TEST_MATRIX.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_TEST\n' );
  fprintf ( 1, '  Test the MATLAB TEST_MATRIX routines.\n' );

  tridiag_dense_test;
  tridiag_sparse_test;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_MATRIX_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );


