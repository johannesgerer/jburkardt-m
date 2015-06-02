function polygon_properties_test ( )

%*****************************************************************************80
%
%% POLYGON_PROPERTIES_TEST tests the POLYGON_PROPERTIES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    07 May 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the POLYGON_PROPERTIES library.\n' );

  polygon_properties_test01 ( );
  polygon_properties_test02 ( );
  polygon_properties_test03 ( );
  polygon_properties_test04 ( );
  polygon_properties_test05 ( );
  polygon_properties_test06 ( );
  polygon_properties_test07 ( );
  polygon_properties_test08 ( );
  polygon_properties_test09 ( );

  polygon_properties_test10 ( );
  polygon_properties_test11 ( );
  polygon_properties_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLYGON_PROPERTIES_PRB\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
