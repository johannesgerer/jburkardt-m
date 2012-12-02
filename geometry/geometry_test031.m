function geometry_test031 ( )

%*****************************************************************************80
%
%% TEST031 tests HAVERSINE.
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
  n_test = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST031\n' );
  fprintf ( 1, '  HAVERSINE computes the haversine of an angle.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Degrees  Radians  Haversine\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n_test
    x = i * 2.0 * pi / n_test;
    d = radians_to_degrees ( x );
    hx = haversine ( x );
    fprintf ( 1, '  %10f  %10f  %12f\n', d, x, hx );
  end

  return
end
