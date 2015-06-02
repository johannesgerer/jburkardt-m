function matlab_kmeans_test ( )

%*****************************************************************************80
%
%% MATLAB_KMEANS_TEST tests the MATLAB kmeans() function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB_KMEANS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MATLAB kmeans() function.\n' );

  matlab_kmeans_test01 ( );
  matlab_kmeans_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MATLAB_KMEANS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
