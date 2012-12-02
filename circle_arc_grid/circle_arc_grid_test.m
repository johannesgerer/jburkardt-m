function circle_arc_grid_test ( )

%*****************************************************************************80
%
%% CIRCLE_ARC_GRID_TEST tests CIRCLE_ARC_GRID.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 November 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_ARC_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test CIRCLE_ARC_GRID.\n' );

  circle_arc_grid_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_ARC_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
