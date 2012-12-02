function toms446_test ( )

%*****************************************************************************80
%
%% TOMS446_TEST tests the TOM446 library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 September 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS446_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TOMS446 library.\n' );

  toms446_test01 ( );
  toms446_test02 ( );
  toms446_test03 ( );
  toms446_test04 ( );
  toms446_test05 ( );
  toms446_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS446_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
