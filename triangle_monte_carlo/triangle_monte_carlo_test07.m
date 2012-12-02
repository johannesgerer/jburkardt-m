function triangle_monte_carlo_test07 ( )

%*****************************************************************************80
%
%% TRIANGLE_MONTE_CARLO_TEST07 uses TRIANGLE_SAMPLE_03 on a general triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 August 2009
%
%  Author:
%
%    John Burkardt
%
  f_num = 8;

  t(1:2,1:3) = [ ...
    4.0, 1.0; ...
    8.0, 3.0; ...
    0.0, 9.0]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE_MONTE_CARLO_TEST07\n' );
  fprintf ( 1, '  Sample using TRIANGLE_UNIT_SAMPLE_03\n' );
  fprintf ( 1, '  Integrate TRIANGLE_UNIT_INTEGRAND_USER\n' );
  fprintf ( 1, '  Integration region is over a general triangle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use an increasing number of points P_NUM.\n' );
  fprintf ( 1, '  Note that the sample routine is a "good" sampler.\n' );

  seed = 123456789;

  r8mat_transpose_print ( 2, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     P_NUM \n' );
  fprintf ( 1, '\n' );

  p_num = 1;

  while ( p_num <= 65536 )

    [ result, seed ] = triangle_monte_carlo ( t, p_num, f_num, ...
      @triangle_unit_sample_03, @triangle_integrand_user, seed );

    fprintf ( 1, '  %8d', p_num );
    for j = 1 : f_num
      fprintf ( 1, '  %14f', result(j) );
    end
    fprintf ( 1, '\n' );

    p_num = 2 * p_num;

  end

  return
end
