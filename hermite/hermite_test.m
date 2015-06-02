function hermite_test ( )

%*****************************************************************************80
%
%% HERMITE_TEST tests the HERMITE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HERMITE library.\n' );

  hermite_test01 ( );
  hermite_test02 ( );
  hermite_test03 ( );
  hermite_test04 ( );
  hermite_test05 ( );
  hermite_test06 ( );
  hermite_test07 ( );
  hermite_test08 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
