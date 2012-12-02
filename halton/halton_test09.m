function halton_test09 ( )

%*****************************************************************************80
%
%% TEST09 tests SPHERE_UNIT_HALTON_2D.
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
  dim_num2 = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST09\n' );
  fprintf ( 1, '  For the unit sphere in 2 dimensions (the circle):\n' );
  fprintf ( 1, '  HALTON generates "U1" points,\n' );
  fprintf ( 1, '  U1_TO_SPHERE_UNIT_2D samples the circle;\n' );

  dim_num = 1;
  halton_dim_num_set ( dim_num );
  n = 5;
  step = 0;
  halton_step_set ( step );
  seed(1:dim_num) = 0;
  halton_seed_set ( seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIM_NUM = %12d\n', dim_num );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A few sample values:\n' );
  fprintf ( 1, '\n' );

  for j = 1 : n
    u = halton ( );
    x = u1_to_sphere_unit_2d ( u );
    fprintf ( 1, '  ' );
    for i = 1 : dim_num2
      fprintf ( 1, '%6f  ', x(i) );
    end
    fprintf ( 1, '\n' );
  end

  n = 1000;
  step = 0;
  halton_step_set ( step );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N =    %12d\n', n );
  fprintf ( 1, '  STEP = %12d\n', step );

  average(1:dim_num2) = 0.0;

  for i = 1 : n
    u = halton ( );
    x = u1_to_sphere_unit_2d ( u );
    average(1:dim_num) = average(1:dim_num) + x(1:dim_num);
  end

  average(1:dim_num2) = average(1:dim_num2) / n;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average the points, which should get a value\n' );
  fprintf ( 1, '  close to zero, and closer as N increases.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        ' ); 
  for i = 1 : dim_num2
    fprintf ( 1, '  %12f', average(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now choose a random direction, sample the same\n' );
  fprintf ( 1, '  number of points, and compute the dot product with\n' );
  fprintf ( 1, '  the direction.\n' );
  fprintf ( 1, '  Take the absolute value of each dot product\n' );
  fprintf ( 1, '  and sum and average.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We expect a value near 2 / PI = 0.6366...\n' );

  for j2 = 1 : 5

    seed_val = get_seed ( );
    step = seed_val + 111 * j2;
    halton_step_set ( step );

    u = halton ( );
    v = u1_to_sphere_unit_2d ( u );

    step = 0;
    halton_step_set ( step );

    dot_average = 0.0;

    for j = 1 : n
      u = halton ( );
      x = u1_to_sphere_unit_2d ( u );
      dot_average = dot_average + abs ( x(1:dim_num2) * v(1:dim_num2)' );
    end

    dot_average = dot_average / n;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Random V:         ' );
    for i = 1 : dim_num2
      fprintf ( 1, '  %12f', v(i) );
    end
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Average |(XdotV)| = %f\n', dot_average );

  end

  return
end
