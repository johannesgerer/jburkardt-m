function yval = r8poly2_val2 ( dim_num, ndata, tdata, ydata, left, tval )

%*****************************************************************************80
%
%% R8POLY2_VAL2 evaluates a parabolic interpolant through tabular data.
%
%  Discussion:
%
%    This routine is a utility routine used by OVERHAUSER_SPLINE_VAL.
%    It constructs the parabolic interpolant through the data in
%    3 consecutive entries of a table and evaluates this interpolant
%    at a given abscissa value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of a single data point.
%    DIM_NUM must be at least 1.
%
%    Input, integer NDATA, the number of data points.
%    NDATA must be at least 3.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.
%    The values in TDATA must be in strictly ascending order.
%
%    Input, real YDATA(DIM_NUM,NDATA), the data points 
%    corresponding to the abscissas.
%
%    Input, integer LEFT, the location of the first of the three
%    consecutive data points through which the parabolic interpolant
%    must pass.  1 <= LEFT <= NDATA - 2.
%
%    Input, real TVAL, the value of T at which the parabolic
%    interpolant is to be evaluated.  Normally, TDATA(1) <= TVAL <= T(NDATA),
%    and the data will be interpolated.  For TVAL outside this range,
%    extrapolation will be used.
%
%    Output, real YVAL(DIM_NUM), the value of the parabolic
%    interpolant at TVAL.
%

%
%  Check.
%
  if ( left < 1 || ndata-2 < left )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_VAL2 - Fatal error!\n' );
    fprintf ( 1, '  LEFT < 1 or NDATA-2 < LEFT.\n' );
    fprintf ( 1, '  LEFT = %d\n', left );
    error ( 'R8POLY2_VAL2 - Fatal error!' );
  end

  if ( dim_num < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_VAL2 - Fatal error!\n' );
    fprintf ( 1, '  DIM_NUM < 1.\n' );
    fprintf ( 1, '  DIM_NUM = %d\n', dim_num );
    error ( 'R8POLY2_VAL2 - Fatal error!' );
  end
%
%  Copy out the three abscissas.
%
  t1 = tdata(left);
  t2 = tdata(left+1);
  t3 = tdata(left+2);

  if ( t2 <= t1 || t3 <= t2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8POLY2_VAL2 - Fatal error!\n' );
    fprintf ( 1, '  T2 <= T1 or T3 <= T2.\n' );
    fprintf ( 1, '  T1 = %f\n', t1 );
    fprintf ( 1, '  T2 = %f\n', t2 );
    fprintf ( 1, '  T3 = %f\n', t3 );
    error ( 'R8POLY2_VAL2 - Fatal error!' );
  end
%
%  Construct and evaluate a parabolic interpolant for the data
%  in each dimension.
%
  for i = 1 : dim_num

    y1 = ydata(i,left);
    y2 = ydata(i,left+1);
    y3 = ydata(i,left+2);

    dif1 = ( y2 - y1 ) / ( t2 - t1 );
    dif2 = ( ( y3 - y1 ) / ( t3 - t1 ) ...
           - ( y2 - y1 ) / ( t2 - t1 ) ) / ( t3 - t2 );

    yval(i) = y1 + ( tval - t1 ) * ( dif1 + ( tval - t2 ) * dif2 );

  end

  return
end
