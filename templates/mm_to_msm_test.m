function mm_to_msm_test ( )

%*****************************************************************************80
%
%% MM_TO_MSM_TEST tests MM_TO_MSM.
%
%  Modified:
%
%    25 March 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_MSM_TEST:\n' );
  fprintf ( 1, '  MM_TO_MSM can read a Matrix Market file and convert \n' );
  fprintf ( 1, '  the information into a Matlab Sparse Matrix.\n' );

  file_name = 'wathen_29_29_adg.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will read the file "%s".\n', file_name );

  [ A, rows, cols, entries, rep, field, symm ] = mm_to_msm ( file_name );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order is %d rows by %d columns\n', rows, cols );
  fprintf ( 1, '  Number of entries is %d\n', entries );
  fprintf ( 1, '  Matrix representation is "%s"\n', rep );
  fprintf ( 1, '  Matrix arithmetic field is "%s"\n', field );
  fprintf ( 1, '  Matrix symmetry type is "%s"\n', symm );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Whether A is full or sparse, we can manipulate it\n' );
  fprintf ( 1, '  now with MATLAB.  Here we get the eigenvalues.\n' );
  fprintf ( 1, '  For the Wathen matrix, these will all be positive.\n' );

  lambda = eig ( A );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Eigenvalues of Wathen matrix:\n' );
  fprintf ( 1, '\n' );
  for i = 1 : rows
    fprintf ( 1, '  %f\n', lambda(i) );
  end
  
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MM_TO_MSM_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
