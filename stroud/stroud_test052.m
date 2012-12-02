function stroud_test052 ( )

%*****************************************************************************80
%
%% TEST052 tests BALL_VOLUME_3D.
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
  fprintf ( 1, 'TEST052\n' );
  fprintf ( 1, '  In 3 dimensions:\n' );
  fprintf ( 1, '  BALL_VOLUME_3D computes the volume of a unit ball.\n' );
  fprintf ( 1, '  BALL_VOLUME_ND will be called for comparison.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    R      Volume    Method\n' );
  fprintf ( 1, '\n' );

  r = 1.0;

  for i = 1 : 3

    fprintf ( 1, '  %1d  %12f  %12f  %s\n', ...
      n, r, ball_volume_3d ( r ), 'BALL_VOLUME_3D' );

    fprintf ( 1, '  %1d  %12f  %12f  %s\n', ...
      n, r, ball_volume_nd ( n, r ), 'BALL_VOLUME_ND' );

    r = r * 2.0;

  end

  return
end
