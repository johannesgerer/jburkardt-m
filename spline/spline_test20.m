function spline_test20 ( )

%*****************************************************************************80
%
%% TEST20 tests SPLINE_HERMITE_SET, SPLINE_HERMITE_VAL.
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
  ndata = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20\n' );
  fprintf ( 1, '  SPLINE_HERMITE_SET sets up a Hermite spline;\n' );
  fprintf ( 1, '  SPLINE_HERMITE_VAL evaluates it.\n' );
%
%  Set the data.
%
  for i = 1 : ndata
    tdata(i) = ( ( ndata - i     ) *   0.0          ...
               + (         i - 1 ) * ( 0.5 * pi ) ) ...
               / ( ndata     - 1 );
    ydata(i) = sin ( tdata(i) );
    ypdata(i) = cos ( tdata(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', ndata );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y            Y"\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata
    fprintf ( 1, '%14f  %14f  %14f\n', tdata(i), ydata(i), ypdata(i) );
  end
%
%  Set up the spline.
%
  c = spline_hermite_set ( ndata, tdata, ydata, ypdata );
%
%  Now evaluate the spline all over the place.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T        Y(hermite)     Y(exact)' );
  fprintf ( 1, '      Y''(hermite)   Y''(exact)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata

    if ( i == ndata )
      jhi = 0;
    else
      jhi = 2;
    end

    for j = 0 : jhi

      tval = ( 3 * ( i - 1 ) + j ) * ( 0.5 * pi ) ...
           / ( 3 * ( ndata - 1 ) );

      fval = sin ( tval );
      fpval = cos ( tval );
 
      [ yval, ypval ] = spline_hermite_val ( ndata, tdata, c, tval );

      if ( j == 0 )
        mark = '*';
      else
        mark = ' ';
      end

      fprintf ( 1, '%c  %14f  %14f  %14f  %14f  %14f\n', ...
        mark, tval, yval, fval, ypval, fpval );

    end

  end

  return
end
