function random_data_test ( )

%*****************************************************************************80
%
%% RANDOM_DATA_TEST tests RANDOM_DATA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 August 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDOM_DATA_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the RANDOM_DATA library.\n' );

  random_data_test005 ( );
  random_data_test01 ( );
  random_data_test02 ( );
  random_data_test03 ( );
  random_data_test04 ( );
  random_data_test05 ( );
  random_data_test06 ( );
  random_data_test07 ( );
  random_data_test08 ( );
  random_data_test09 ( );

  random_data_test10 ( );
  random_data_test11 ( );
  random_data_test115 ( );
  random_data_test12 ( );
  random_data_test125 ( );
  random_data_test13 ( );
  random_data_test14 ( );
  random_data_test15 ( );
  random_data_test16 ( );
  random_data_test17 ( );
  random_data_test18 ( );
  random_data_test19 ( );

  random_data_test20 ( );
  random_data_test205 ( );
  random_data_test21 ( );
  random_data_test22 ( );
  random_data_test23 ( );
  random_data_test24 ( );
  random_data_test245 ( );
  random_data_test25 ( );
  random_data_test26 ( );
  random_data_test264 ( );
  random_data_test265 ( );
  random_data_test267 ( );
  random_data_test27 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RANDOM_DATA_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
