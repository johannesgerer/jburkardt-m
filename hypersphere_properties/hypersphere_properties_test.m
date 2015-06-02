function hypersphere_properties_test ( )

%*****************************************************************************80
%
%% HYPERSPHERE_PROPERTIES_TEST tests the HYPERSPHERE_PROPERTIES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HYPERSPHERE_PROPERTIES library.\n' );

  hypersphere_properties_test01 ( );
  hypersphere_properties_test02 ( );
  hypersphere_properties_test03 ( );
  hypersphere_properties_test04 ( );
  hypersphere_properties_test05 ( );
  hypersphere_properties_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HYPERSPHERE_PROPERTIES_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

