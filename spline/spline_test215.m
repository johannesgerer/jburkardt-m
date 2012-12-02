function spline_test215 ( )

%*****************************************************************************80
%
%% TEST215 tests SPLINE_LINEAR_INT.
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
  n = 3;
  t = [ 2.0, 4.5, 7.5  ];
  y = [ 3.0, 3.75, 5.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST215\n' );
  fprintf ( 1, '  SPLINE_LINEAR_INT computes the integral\n' );
  fprintf ( 1, '  of a linear spline.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '%14f  %14f\n', t(i), y(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '    A             B           Integral\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5

    if ( i == 1 )
      a = 0.0;
      b = 4.0;
    elseif ( i == 2 )
      a = 4.0;
      b = 5.0;
    elseif ( i == 3 )
      a = 5.0;
      b = 10.0;
    elseif ( i == 4 )
      a = 0.0;
      b = 10.0;
    else
      a = 10.0;
      b = 0.0;
    end

    int_val = spline_linear_int ( n, t, y, a, b );

    fprintf ( 1, '%14f  %14f  %14f\n', a, b, int_val );

  end

  return
end
