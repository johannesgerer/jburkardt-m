function machine_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for MACHINE_TEST.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Discussion:
%
%    MACHINE_TEST runs the MACHINE tests.
%
%  Modified:
%
%    25 April 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MACHINE_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the MACHINE library.\n' );

  d1mach_test ( );
  i1mach_test ( );
  r1mach_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MACHINE_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
