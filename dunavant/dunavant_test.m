function dunavant_test ( )

%*****************************************************************************80
%
%% DUNAVANT_TEST is the main program for the DUNAVANT sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DUNAVANT_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the DUNAVANT library.\n' );

  dunavant_test01 ( );
  dunavant_test02 ( );
  dunavant_test025 ( );
  dunavant_test03 ( );
  dunavant_test04 ( );
  dunavant_test05 ( );
  dunavant_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DUNAVANT_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
