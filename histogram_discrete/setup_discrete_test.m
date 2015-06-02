function setup_discrete_test ( )

%*****************************************************************************80
%
%% SETUP_DISCRETE_TEST tests SETUP_DISCRETE.
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
  fprintf ( 1, 'SETUP_DISCRETE_TEST\n' );
  fprintf ( 1, '  SETUP_DISCRETE sets up data for a discrete histogram.\n' );
%
%  Case 1.
%
  s_num = 50;
  s_min = 10.0;
  s_max = 20.0;
  s = floor ( s_min + ( s_max + 1.0 - s_min ) * rand ( s_num, 1 ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );
  r8vec_print ( s_num, s, '  Sample data:' );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  r8vec2_print ( x_num, x, y, '  Discrete histogram data:' );

  y_int = 0.0;
  for i = 1 : x_num - 1
    y_int = y_int + ( x(i+1) - x(i) ) * 0.5 * ( y(i+1) + y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integral of Y(X) = %g\n', y_int );
%
%  Use the same data, but narrow S_MIN and S_MAX.
%
  s_num = 50;
  s_min = 12.0;
  s_max = 17.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  r8vec2_print ( x_num, x, y, '  Discrete histogram data:' );

  y_int = 0.0;
  for i = 1 : x_num - 1
    y_int = y_int + ( x(i+1) - x(i) ) * 0.5 * ( y(i+1) + y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integral of Y(X) = %g\n', y_int );
%
%  Use the same data, but widen S_MIN and S_MAX.
%
  s_num = 50;
  s_min = 5.0;
  s_max = 23.0;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  S_MIN = %g\n', s_min );
  fprintf ( 1, '  S_MAX = %g\n', s_max );

  [ x_num, x, y ] = setup_discrete ( s_num, s, s_min, s_max );

  r8vec2_print ( x_num, x, y, '  Discrete histogram data:' );

  y_int = 0.0;
  for i = 1 : x_num - 1
    y_int = y_int + ( x(i+1) - x(i) ) * 0.5 * ( y(i+1) + y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integral of Y(X) = %g\n', y_int );

  return
end

