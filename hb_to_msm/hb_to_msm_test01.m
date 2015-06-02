function hb_to_msm_test01 ( )

%*****************************************************************************80
%
%% HB_TO_MSM_TEST01 tests HB_TO_MSM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2014
%
%  Author:
%
%    John Burkardt
%
  filename = 'rua_32.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_MSM_TEST01\n' );
  fprintf ( 1, '  We will read a Harwell-Boeing sparse matrix file\n' );
  fprintf ( 1, '  called "%s"\n', filename );
  fprintf ( 1, '  and have HB_TO_MSM convert it to MATLAB sparse format.\n' );

  a = hb_to_msm ( filename );

  [ m, n ] = size ( a );
  nonz = nnz ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order is %d by %d\n', m, n );
  fprintf ( 1, '  Number of nonzero entries is %d\n', nonz );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use spy() to display the sparsity of the matrix.\n' );

  spy ( a )
  filename = 'rua_32.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPY plot saved as "%s"\n', filename );
%
%  To verify the results, we extract the data.
%
  b = full ( a )

  return
end



