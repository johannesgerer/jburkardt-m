function geometry_test194 ( )

%*****************************************************************************80
%
%% TEST194 tests SPHERE_UNIT_SAMPLE2_ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  n_sample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST194\n' );
  fprintf ( 1, '  For the unit sphere in N dimensions:\n' );
  fprintf ( 1, '  SPHERE_UNIT_SAMPLE2_ND samples;\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A few sample values:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    [ x(1:3,1), seed ] = sphere_unit_sample2_nd ( 3, seed );
    fprintf ( 1, '  %10f  %10f  %10f\n', x(1:3,1) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Spatial dimension = %d\n', 3 );
  fprintf ( 1, '  Number of sample points = %d\n', n_sample );

  average(1:3,1) = 0.0;

  for i = 1 : n_sample
    [ x(1:3,1), seed ] = sphere_unit_sample2_nd ( 3, seed );
    average(1:3,1) = average(1:3,1) + x(1:3,1);
  end

  average(1:3,1) = average(1:3,1) / n_sample;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now average the points, which should get a value\n' );
  fprintf ( 1, '  close to zero, and closer as N increases.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Average:        %10f  %10f  %10f\n', average(1:3,1) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Now choose a random direction, sample the same\n' );
  fprintf ( 1, '  number of points, and compute the dot product with\n' );
  fprintf ( 1, '  the direction.\n' );
  fprintf ( 1, '  Take the absolute value of each dot product\n' );
  fprintf ( 1, '  and sum and average.\n' );

  for j = 1 : 5

    [ v(1:3,1), seed ] = sphere_unit_sample2_nd ( 3, seed );

    dot_average = 0.0;

    for i = 1 : n_sample
      [ x(1:3,1), seed ] = sphere_unit_sample2_nd ( 3, seed );
      dot_average = dot_average + abs ( x(1:3,1)' * v(1:3,1) );
    end

    dot_average = dot_average / n_sample;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  V:                %10f  %10f  %10f\n', v(1:3,1) );
    fprintf ( 1, '  Average |(XdotV)| %10f\n', dot_average );

  end

  return
end
