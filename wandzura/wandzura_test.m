function wandzura_test ( )

%*****************************************************************************80
%
%% WANDZURA_TEST is the main program for the WANDZURA sample code.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2006
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'WANDZURA_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the WANDZURA library.\n' );

  wandzura_test01 ( );
  wandzura_test02 ( );
  wandzura_test03 ( );
  wandzura_test04 ( );
  wandzura_test05 ( );
  wandzura_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'WANDZURA_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
