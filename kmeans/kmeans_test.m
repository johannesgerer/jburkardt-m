function kmeans_test ( )

%*****************************************************************************80
%
%% KMEANS_TEST tests various KMEANS programs.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 October 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'KMEANS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test various KMEANS programs.\n' );

  kmeans_test01 ( );
  kmeans_test02 ( );
  kmeans_test03 ( );
  kmeans_test04 ( );
  kmeans_test05 ( );
  kmeans_test06 ( );
  kmeans_test07 ( );
  kmeans_test08 ( );
  kmeans_test09 ( );

  kmeans_test10 ( );
  kmeans_test11 ( );
  kmeans_test12 ( );
  kmeans_test13 ( );
  kmeans_test14 ( );
  kmeans_test15 ( );
  kmeans_test16 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'KMEANS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
