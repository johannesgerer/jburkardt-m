function stroud_test054 ( )

%*****************************************************************************80
%
%% TEST054 tests BALL_VOLUME_ND.
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
  fprintf ( 1, 'TEST054\n' );
  fprintf ( 1, '  BALL_UNIT_VOLUME_ND computes the volume of\n' );
  fprintf ( 1, '    the unit ball in N dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    N        R      Volume\n' );
  fprintf ( 1, '\n' );

  for n = 2 : 10
    r = 0.5;
    for i = 1 : 3
      fprintf ( 1, '  %3d  %12f  %12f\n', n, r, ball_volume_nd ( n, r ) );
      r = r * 2.0;
    end
  end

  return
end
