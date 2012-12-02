function stroud_test045 ( )

%*****************************************************************************80
%
%% TEST045 tests BALL_UNIT_VOLUME_3D.
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
  n = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST045\n' );
  fprintf ( 1, '  In 3 dimensions:\n' );
  fprintf ( 1, '  BALL_UNIT_VOLUME_3D gets the volume of the unit ball.\n' );
  fprintf ( 1, '  BALL_UNIT_VOLUME_ND will be called for comparison.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    Volume    Method\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '  %1d  %12f  %s\n', n, ball_unit_volume_3d ( ), ...
    'BALL_UNIT_VOLUME_3D' );

  fprintf ( 1, '  %1d  %12f  %s\n', n, ball_unit_volume_nd ( n ), ...
    'BALL_UNIT_VOLUME_ND' );

  return
end
