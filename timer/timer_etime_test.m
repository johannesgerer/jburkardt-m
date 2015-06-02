function timer_etime_test ( )

%*****************************************************************************80
%
%% TIMER_ETIME_TEST uses ETIME as the timer.
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
  fprintf ( 1, 'TIMER_ETIME\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of the CLOCK and ETIME.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CLOCK and ETIME are MATLAB built in routines.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    t0 = clock;\n' );
  fprintf ( 1, '    THINGS TO BE TIMED;\n' );
  fprintf ( 1, '    t1 = clock;\n' );
  fprintf ( 1, '    seconds = etime ( t1, t0 );\n' );

  timer_etime_test01 ( );
  timer_etime_test02 ( );
  timer_etime_test03 ( );
  timer_etime_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMER_ETIME\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
