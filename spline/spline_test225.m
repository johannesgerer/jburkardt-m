function spline_test225 ( )

%*****************************************************************************80
%
%% TEST225 tests SPLINE_OVERHAUSER_NONUNI_VAL.
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
  ndata = 11;
  nsample = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST225\n' );
  fprintf ( 1, '  SPLINE_OVERHAUSER_NONUNI_VAL evaluates the\n' );
  fprintf ( 1, '    nonuniform Overhauser spline.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In this draft of a test, we simply repeat the\n' );
  fprintf ( 1, '  test for the uniform data case.\n' );

  for i = 1 : ndata
    tdata(i) = i - 1;
    ydata(i) = sin ( 2.0E+00 * pi * tdata(i) / ( ndata - 1) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', ndata );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata
    fprintf ( 1, '%14f  %14f\n', tdata(i), ydata(i) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '    T, Spline(T)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : ndata

    if ( i == 0 )
      tlo = tdata(1) - 0.5E+00 * ( tdata(2) - tdata(1) );
      thi = tdata(1);
    elseif ( i < ndata )
      tlo = tdata(i);
      thi = tdata(i+1);
    elseif ( ndata <= i )
      tlo = tdata(ndata);
      thi = tdata(ndata) + 0.5E+00 * ( tdata(ndata) - tdata(ndata-1) );
    end

    if ( i < ndata )
      jhi = nsample - 1;
    else
      jhi = nsample;
    end

    for j = 0 : jhi

      tval = ( ( nsample - j ) * tlo   ...
             + (           j ) * thi ) ...
             / ( nsample     );

      yval = spline_overhauser_nonuni_val ( ndata, tdata, ydata, tval );

      if ( 0 < i & j == 0 )
        mark = '*';
      else
        mark = ' ';
      end

      fprintf ( 1, '%c  %14f  %14f\n', mark, tval, yval );

    end

  end

  return
end
