function stroud_test05 ( )

%*****************************************************************************80
%
%% TEST05 tests BALL_UNIT_VOLUME_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST05\n' );
  fprintf ( 1, '  BALL_UNIT_VOLUME_ND computes the volume\n' );
  fprintf ( 1, '    of the unit ball in ND.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    N    Volume\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 10
    fprintf ( 1, '  %3d  %12f\n', n, ball_unit_volume_nd ( n ) );
  end

  return
end
