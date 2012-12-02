function geometry_test006 ( )

%*****************************************************************************80
%
%% TEST006 tests BALL_UNIT_SAMPLE_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  n_sample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST006\n' );
  fprintf ( 1, '  For the unit ball in 2 dimensions (the disk):\n' );
  fprintf ( 1, '  BALL_UNIT_SAMPLE_2D samples;\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A few sample values:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ x, seed ] = ball_unit_sample_2d ( seed );
    fprintf ( 1, '  %10f  %10f\n', x(1:dim_num) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of sample points = %d\n', n_sample );

  average(1:dim_num) = 0.0;

  for i = 1 : n_sample
    [ x, seed ] = ball_unit_sample_2d ( seed );
    average(1:dim_num) = average(1:dim_num) + x(1:dim_num);
  end

  average(1:dim_num) = average(1:dim_num) / n_sample;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now average the points, which should get a value\n' );
  fprintf ( 1, '  close to zero, and closer as N_SAMPLE increases.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %10f  %10f\n', average(1:dim_num) );

  average_r = 0.0;

  for i = 1 : n_sample
    [ x, seed ] = ball_unit_sample_2d ( seed );
    average_r = average_r + sqrt ( sum ( x(1:dim_num).^2 ) );
  end

  average_r = average_r / n_sample;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now average the distance of the points from\n' );
  fprintf ( 1, '  the center, which should be 1/sqrt(2) = %f\n', 1.0 / sqrt ( 2.0 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %10f\n', average_r );

  average_theta = 0.0;

  for i = 1 : n_sample
    [ x, seed ] = ball_unit_sample_2d ( seed );
    theta = r8_atan ( x(2), x(1) );
    average_theta = average_theta + theta;
  end

  average_theta = average_theta / n_sample;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now average the angle THETA,\n' );
  fprintf ( 1, '  which should be PI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %10f\n', average_theta );

  return
end
