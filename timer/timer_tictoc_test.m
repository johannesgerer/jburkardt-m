function timer_tictoc_test ( )

%*****************************************************************************80
%
%% TIMER_TICTOC_TEST uses TIC and TOC as the timer.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMER_TICTOC\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrate the use of the TIC routine.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  TIC and TOC are built-in MATLAB routines.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To measure and print elapsed wallclock time:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    tic;\n' );
  fprintf ( 1, '    THINGS TO BE TIMED;\n' );
  fprintf ( 1, '    toc;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  To store elapsed wallclock time:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    tic;\n' );
  fprintf ( 1, '    THINGS TO BE TIMED;\n' );
  fprintf ( 1, '    wallclock = toc;\n' );
  
  timer_tictoc_test01 ( );
  timer_tictoc_test02 ( );
  timer_tictoc_test03 ( );
  timer_tictoc_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TIMER_TICTOC\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
