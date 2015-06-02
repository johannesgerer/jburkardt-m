function collatz_test ( )

%*****************************************************************************80
%
%% COLLATZ_TEST tests the COLLATZ library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST\n' );
  fprintf ( 1, '  MATLAB version:\n' );
  fprintf ( 1, '  Test the COLLATZ library.\n' );

  collatz_test01 ( );
  collatz_test02 ( );
  collatz_test03 ( );
  collatz_test04 ( );
  collatz_test05 ( );
  collatz_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
