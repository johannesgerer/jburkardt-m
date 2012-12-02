function box_behnken_test ( )

%*****************************************************************************80
%
%% BOX_BEHNKEN_TEST calls a set of problems for BOX_BEHNKEN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_BEHNKEN_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BOX_BEHNKEN library.\n' );

  box_behnken_test01 ( );
  box_behnken_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BOX_BEHNKEN_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
