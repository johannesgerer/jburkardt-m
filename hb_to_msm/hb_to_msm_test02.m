function hb_to_msm_test02 ( )

%*****************************************************************************80
%
%% HB_TO_MSM_TEST02 tests HB_TO_MSM.
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
  filename = 'plasma_100_rua.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_TO_MSM_TEST02\n' );
  fprintf ( 1, '  We will read a Harwell-Boeing sparse matrix file\n' );
  fprintf ( 1, '  called "%s"\n', filename );
  fprintf ( 1, '  and have HB_TO_MSM convert it to MATLAB sparse format.\n' );

  [ a, rhs ] = hb_to_msm ( filename );

  [ m, n ] = size ( a );
  nonz = nnz ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Matrix order is %d by %d\n', m, n );
  fprintf ( 1, '  Number of nonzero entries is %d\n', nonz );
%
%  This is a large matrix, so let's just do a SPY on it.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use spy() to display the sparsity of the matrix.\n' );

  spy ( a )
  filename = 'plasma_100_rua.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPY plot saved as "%s"\n', filename );

  return
end



