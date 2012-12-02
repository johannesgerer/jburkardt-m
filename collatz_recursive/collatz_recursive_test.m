function collatz_recursive_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for COLLATZ_RECURSIVE_TEST.
%
%  Discussion:
%
%    COLLATZ_RECURSIVE_TEST tests the COLLATZ_RECURSIVE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_RECURSIVE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the COLLATZ_RECURSIVE library.\n' );

  collatz_recursive_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COLLATZ_RECURSIVE_TEST\n' );
  fprintf ( 1,'  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
