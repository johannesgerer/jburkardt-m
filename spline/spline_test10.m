function spline_test10 ( )

%*****************************************************************************80
%
%% TEST10 tests BC_VAL.
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
  nsample = 101;
  xcon = [ 0.0E+00, 0.75E+00, 1.0E+00 ];
  ycon = [ 1.0E+00, 0.0E+00,  1.0E+00 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST10\n' );
  fprintf ( 1, '  BC_VAL evaluates a general Bezier function.\n' );
%
%  One point on the curve should be about (0.75, 0.536).
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T, X(T), Y(T)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : nsample

    t = (       i - 1 ) ...
      / ( nsample - 1 );

    [ xval, yval ] = bc_val ( n, t, xcon, ycon );

    fprintf ( 1, '%14f  %14f  %14f\n', t, xval, yval );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The point ( 0.75, 0.536 ) should be on the curve.\n' );

  return
end
