function circle_rule_test ( )

%*****************************************************************************80
%
%% CIRCLE_RULE_TEST tests the CIRCLE_RULE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 April 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_RULE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CIRCLE_RULE library.\n' );

  nt = 8;
  circle_rule_test01 ( nt );

  nt = 32;
  circle_rule_test01 ( nt );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_RULE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
