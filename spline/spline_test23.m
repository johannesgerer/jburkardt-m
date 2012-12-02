function spline_test23 ( )

%*****************************************************************************80
%
%% TEST23 tests SPLINE_OVERHAUSER_VAL.
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
  ndim = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST23\n' );
  fprintf ( 1, '  SPLINE_OVERHAUSER_VAL evaluates the\n' );
  fprintf ( 1, '    Overhauser spline.\n' );
%
%  Set the data.
%
  tdata(1) = 1.0;
  ydata(1,1) =   0.0;
  ydata(2,1) =   0.0;

  tdata(2) = 2.0;
  ydata(1,2) =   1.0;
  ydata(2,2) =   1.0;

  tdata(3) = 3.0;
  ydata(1,3) =   2.0;
  ydata(2,3) = - 1.0;

  tdata(4) = 4.0;
  ydata(1,4) =   3.0;
  ydata(2,4) =   0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data to be interpolated:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of data values = %d\n', ndata );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       T             Y\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ndata
    fprintf ( 1, '%14f  ', tdata(i) );
    for j = 1 : ndim
      fprintf ( 1, '%14f  ',  ydata(j,i) );
    end
    fprintf ( 1, '\n' );
  end
%
%  Now evaluate the spline all over the place.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T, Spline value\n' );
  fprintf ( 1, '\n' );

  for i = 0 : 6 * ndata + 3

    tval = ( i ) / 6.0;
    yval = spline_overhauser_val ( ndim, ndata, tdata, ydata, tval );

    fprintf ( 1, '%14f  ', tval );
    for j = 1 : ndim
      fprintf ( 1, '%14f  ',  yval(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
