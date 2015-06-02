function lebesgue_test ( )

%*****************************************************************************80
%
%% LEBESGUE_TEST tests the LEBESGUE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEBESGUE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LEBESGUE library.\n' );

  lebesgue_test01 ( );
  lebesgue_test02 ( );
  lebesgue_test03 ( );
  lebesgue_test04 ( );
  lebesgue_test05 ( );
  lebesgue_test06 ( );
  lebesgue_test07 ( );
  lebesgue_test08 ( );
  lebesgue_test09 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEBESGUE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
