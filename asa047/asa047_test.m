function asa047_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for ASA047_TEST.
%
%  Discussion:
%
%    ASA047_PRB calls the ASA047 routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA047_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ASA047 library.\n' );

  asa047_test01 ( );
  asa047_test02 ( );
  asa047_test03 ( );
  asa047_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA047_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
