function svd_snowfall_test ( )

%*****************************************************************************80
%
%% SVD_SNOWFALL_TEST tests the SVD_SNOWFALL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_SNOWFALL_TEST\n' );
  fprintf ( 1, '  Test the SVD_SNOWFALL library.\n' );
%
%  Retrieve the data.
%
  x = svd_snowfall_test01 ( );
  svd_snowfall_test02 ( x );
  svd_snowfall_test03 ( x );
  svd_snowfall_test04 ( x );
  svd_snowfall_test05 ( x );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SVD_SNOWFALL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
