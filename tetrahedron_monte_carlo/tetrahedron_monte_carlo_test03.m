function tetrahedron_monte_carlo_test03 ( )

%*****************************************************************************80
%
%% TETRAHEDRON_MONTE_CARLO_TEST03 uses TETRAHEDRON_SAMPLE_03 with an increasing number of points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
%
%  Author:
%
%    John Burkardt
%
  f_num = 6;

  t(1:3,1:4) = [ ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0; ...
    0.0, 0.0, 0.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_MONTE_CARLO_TEST03\n' );
  fprintf ( 1, '  Sample using TETRAHEDRON_UNIT_SAMPLE_03\n' );
  fprintf ( 1, '  Integrate TETRAHEDRON_UNIT_INTEGRAND_03\n' );
  fprintf ( 1, '  Integration region is the unit tetrahedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use an increasing number of points P_NUM.\n' );
  fprintf ( 1, '  Note that the sample routine is a good" sampler.\n' );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     P_NUM      X^2             X*Y             X*Z' );
  fprintf ( 1, '             Y^2             Y*Z             Z^2\n' );
  fprintf ( 1, '\n' );

  p_num = 1;

  while ( p_num <= 65536 )

    [ result, seed ] = tetrahedron_monte_carlo ( t, p_num, f_num, ...
      @tetrahedron_unit_sample_01, @tetrahedron_integrand_03, seed );

    fprintf ( 1, '  %8d  %14f  %14f  %14f  %14f  %14f  %14f\n', ...
      p_num, result(1:f_num) )

    p_num = 2 * p_num;

  end

  return
end
