function edge_test ( )

%*****************************************************************************80
%
%% EDGE_TEST tests the EDGE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the EDGE library.\n' );

  figure_num = 0;

  figure_num = edge_test01 ( figure_num );
  figure_num = edge_test02 ( figure_num );
  figure_num = edge_test03 ( figure_num );
  figure_num = edge_test035 ( figure_num );
  figure_num = edge_test036 ( figure_num );
  figure_num = edge_test037 ( figure_num );
  figure_num = edge_test04 ( figure_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EDGE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
