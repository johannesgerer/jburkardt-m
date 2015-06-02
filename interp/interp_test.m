function interp_test ( )

%*****************************************************************************80
%
%% INTERP_TEST tests the INTERP library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INTERP_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the INTERP library.\n' );

  interp_test01 ( );

  interp_test02 ( );

  data_num = 6;
  interp_test03 ( data_num );

  data_num = 11;
  interp_test03 ( data_num );

  data_num = 6;
  interp_test04 ( data_num );

  data_num = 11;
  interp_test04 ( data_num );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INTERP_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
