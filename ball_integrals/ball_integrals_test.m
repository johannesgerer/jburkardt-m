function ball_integrals_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for BALL__TEST.
%
%  Discussion:
%
%    BALL_INTEGRALS_TEST tests the BALL_INTEGRALS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BALL_INTEGRALS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BALL_INTEGRALS library.\n' );

  ball_integrals_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BALL_INTEGRALS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return;
end
