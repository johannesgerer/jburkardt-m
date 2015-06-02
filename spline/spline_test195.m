function spline_test195 ( )

%*****************************************************************************80
%
%% TEST195 tests SPLINE_CUBIC_SET, SPLINE_CUBIC_VAL2.
%
%  Discussion:
%
%    Compare MATLAB's spline () function to SPLINE_CUBIC_SET with the 
%    "not-a-knot" condition.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2013
%
%  Author
%
%    John Burkardt
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST195\n' );
  fprintf ( 1, '  SPLINE_CUBIC_SET sets up a cubic spline;\n' );
  fprintf ( 1, '  SPLINE_CUBIC_VAL evaluates it.\n' );
  fprintf ( 1, '  Matlab''s build in spline() function uses the\n' );
  fprintf ( 1, '  "not-a-knot" boundary condition, which we can match.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Runge''s function, evenly spaced knots.\n' );

  for i = 1 : n

    t(i) = ( ( n - i     ) * (-1.0E+00)   ...
           + (     i - 1 ) * (+1.0E+00) ) ...
           / ( n     - 1 );

    y(i) =  frunge ( t(i) );

  end

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
%
%  Try boundary condition type 3.
%
  ibcbeg = 3;
  ybcbeg = 0.0;
  ibcend = 3;
  ybcend = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Boundary condition 3 ("not a knot") at both ends:\n' );

  ypp = spline_cubic_set ( n, t, y, ibcbeg, ybcbeg, ibcend, ybcend );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  SPLINE"(T), F"(T):\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '%14f  %14f\n', ypp(i), fpprunge(t(i)) );
  end

  left = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '                                    (Mathworks)\n' );
  fprintf ( 1, '        T             SPLINE(T)       SPLINE(T)         F(T)\n' );
  fprintf ( 1, '\n' );

  nval = 25;
  tval = 2.0 * rand ( nval, 1 ) - 1.0;
  yval2 = spline ( t, y, tval );

  for i = 1 : nval
    yval = spline_cubic_val ( n, t, y, ypp, tval(i) );
    fprintf ( 1, '%14f  %14f  %14f  %14f\n', ...
          tval(i), yval, yval2(i), frunge ( tval(i) ) );
  end

  return
end
