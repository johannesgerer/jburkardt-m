function spline_test205 ( )

%*****************************************************************************80
%
%% TEST205 tests SPLINE_LINEAR_INT, SPLINE_LINEAR_INTSET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2009
%
%  Author
%
%    John Burkardt
%
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST205\n' );
  fprintf ( 1, '  SPLINE_LINEAR_INTSET is given some interval endpoints,\n' );
  fprintf ( 1, '  and a value associated with each interval.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  It determines a linear spline, with breakpoints\n' );
  fprintf ( 1, '  at the centers of each interval, whose integral\n' );
  fprintf ( 1, '  over each interval is equal to the given value.\n' );

  int_x(1:n+1) = [ 0.0, 1.0, 4.0, 5.0, 10.0 ]';
  int_v(1:n) = [ 10.0, 2.0, 8.0, 27.5 ]';

  r8vec_print ( n+1, int_x, '  The interval end points:' );
  r8vec_print ( n, int_v, '  The desired interval integral values:' );

  [ data_x, data_y ] = spline_linear_intset ( n, int_x, int_v );

  r8vec_print ( n, data_x, '  The spline break points:' );
  r8vec_print ( n, data_y, '  The spline data values: ' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  As a check, call SPLINE_LINEAR_INT to compute\n' );
  fprintf ( 1, '  the integral of the spline over each interval,\n' );
  fprintf ( 1, '  and compare to the desired value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     A       B    Desired      Computed\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    a = int_x(i);
    b = int_x(i+1);
    value = spline_linear_int ( n, data_x, data_y, a, b );
    fprintf ( 1, '%6f  %6f  %12f  %12f\n', a, b, int_v(i), value );
  end

  return
end
