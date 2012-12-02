function halton_test12 ( )

%*****************************************************************************80
%
%% TEST12 tests U3_TO_BALL_UNIT_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 January 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST12\n' );
  fprintf ( 1, '  For the unit ball in 3 dimensions:\n' );
  fprintf ( 1, '  U3_TO_BALL_UNIT_3D samples;\n' );

  dim_num = 3;
  halton_dim_num_set ( dim_num );
  n = 5;
  step = 0;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A few sample values:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    u = halton ( );
    x = u3_to_ball_unit_3d ( u );
    fprintf ( 1, '  ' );
    for i = 1 : dim_num
      fprintf ( 1, '  %8f', x(i) );
    end
    fprintf ( 1, '\n' );
  end

  n = 1000;
  step = 0;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  average(1:dim_num) = 0.0;

  for j = 1 : n
    u = halton ( );
    x = u3_to_ball_unit_3d ( u );
    average(1:dim_num) = average(1:dim_num) + x(1:dim_num);
  end

  average(1:dim_num) = average(1:dim_num) / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average the points, which should get a value\n' );
  fprintf ( 1, '  close to zero, and closer as N increases.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        ' );
  for i = 1 : dim_num
    fprintf ( 1, '  %8f', average(i) );
  end 
  fprintf ( 1, '\n' );

  step = 0;
  halton_step_set ( step );

  average_r = 0.0;

  for j = 1 : n
    u = halton ( );
    x = u3_to_ball_unit_3d ( u );
    r = sqrt ( sum ( x(1:dim_num).^2 ) );
    average_r = average_r + r;
  end

  average_r = average_r / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average the distance of the points from the center,\n' ); 
  fprintf ( 1, '  which should be DIM_NUM/(DIM_NUM+1) = %f\n', dim_num / ( dim_num + 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %f\n', average_r );

  step = 0;
  halton_step_set ( step );

  average_theta = 0.0;

  for j = 1 : n
    u = halton ( );
    x = u3_to_ball_unit_3d ( u );
    theta = atan4 ( x(2), x(1) );
    average_theta = average_theta + theta;
  end

  average_theta = average_theta / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average the angle THETA,\n' );
  fprintf ( 1, '  which should approach PI.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %f\n', average_theta );

  step = 0;
  halton_step_set ( step );

  average_phi = 0.0;

  for j = 1 : n
    u = halton ( );
    x = u3_to_ball_unit_3d ( u );
    r = sqrt ( sum ( x(1:dim_num).^2 ) );
    if ( r == 0.0 );
      phi = 0.0;
    else
      phi = acos ( x(3) / r );
    end
    average_phi = average_phi + phi;
  end

  average_phi = average_phi / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average the angle PHI,\n' );
  fprintf ( 1, '  which should approach PI/2.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:      %f\n', average_phi );

  return
end
