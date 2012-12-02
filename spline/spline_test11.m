function spline_test11 ( )

%*****************************************************************************80
%
%% TEST11 tests BEZ_VAL.
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
  n = 2;
  a = 0.0E+00;
  b = 1.0E+00;
  nsample = 21;
  y = [ 1.0E+00, 0.0E+00, 1.0E+00 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST11\n' );
  fprintf ( 1, '  BEZ_VAL evaluates a Bezier function.\n' );
%
%  One point on the curve should be (0.75, 20/32).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T, X(T), Y(T)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nsample

    x = ( ( nsample - i     ) * a   ...
        + (           i - 1 ) * b ) ...
        / ( nsample     - 1 );

    fprintf ( 1, '%8d  %14f  %14f\n', i, x, bez_val ( n, x, a, b, y ) );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  When X = 0.75E+00\n' );
  fprintf ( 1, '  BEZ_VAL(X) should be 0.625E+00.\n' );

  return
end
