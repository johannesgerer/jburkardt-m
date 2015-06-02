function timer_cputime_test ( )

%*****************************************************************************80
%
%% TIMER_CPUTIME_TEST uses CPUTIME as the timer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 December 2005
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMER_CPUTIME\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of the CPUTIME timer.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CPUTIME is a MATLAB built in routine.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    reading = cputime;\n' );
  
  timer_cputime_test01 ( );
  timer_cputime_test02 ( );
  timer_cputime_test03 ( );
  timer_cputime_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMER_CPUTIME\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
