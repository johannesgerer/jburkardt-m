function niederreiter2_test ( )

%*****************************************************************************80
%
%% NIEDERREITER2_TEST tests the NIEDERREITER2 routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NIEDERREITER2 library.\n' );

  niederreiter2_test01 ( );
  niederreiter2_test02 ( );
  niederreiter2_test03 ( );
  niederreiter2_test04 ( );
  niederreiter2_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NIEDERREITER2_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
