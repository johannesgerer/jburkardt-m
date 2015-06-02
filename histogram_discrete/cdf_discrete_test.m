function cdf_discrete_test ( )

%*****************************************************************************80
%
%% CDF_DISCRETE_TEST tests CDF_DISCRETE_VALUE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CDF_DISCRETE_TEST\n' );
  fprintf ( 1, '  CDF_DISCRETE_VALUE evaluates the CDF associated with a\n' );
  fprintf ( 1, '  discrete histogram.\n' );
%
%  Set up the discrete histogram from sample data.
%
  s_num = 5;
  s_min = 0.0;
  s_max = 10.0;
  s = [ 2.0, 2.0, 4.0, 5.0, 9.0 ];
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );
  r8vec_print ( s_num, s, '  Sample data:' );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  r8vec2_print ( x_num, x, y, '  Discrete histogram data:' );
%
%  Evaluate the discrete CDF.
%
  v_num = 21;
  v = linspace ( s_min, s_max, v_num );
  cdf = cdf_discrete_value ( x_num, x, y, v_num, v );
  r8vec2_print ( v_num, v, cdf, '  Discrete CDF table:' );
%
%  Plot the discrete CDF.
%
  plot ( v, cdf, 'bo-', 'Linewidth', 3 )
  grid on
  xlabel ( '<--- X --->' )
  ylabel ( '<--- CDF(X) --->' )
  title ( 'Discrete CDF function' )

  filename = 'cdf_discrete_test.png';
  print ( '-dpng', filename )
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Discrete CDF plotted as "%s".\n', filename );

  return
end

