function bisection_rc_test ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST tests the BISECTION_RC library.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BISECTION_RC library.\n' );

  bisection_rc_test01 ( );
  bisection_rc_test02 ( );
  bisection_rc_test03 ( );
  bisection_rc_test04 ( );
  bisection_rc_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_PRB:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
