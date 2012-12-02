function yval = spline_overhauser_nonuni_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_OVERHAUSER_NONUNI_VAL evaluates the nonuniform Overhauser spline.
%
%  Discussion:
%
%    The nonuniformity refers to the fact that the abscissas values
%    need not be uniformly spaced.
%
%    Thanks to Doug Fortune for pointing out that the point distances
%    used to define ALPHA and BETA should be the Euclidean distances
%    between the points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points.
%    3 <= NDATA is required.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.
%    The values of TDATA are assumed to be distinct and increasing.
%
%    Input, real YDATA(NDATA), the data values.
%
%    Input, real TVAL, the value where the spline is to
%    be evaluated.
%
%    Output, real YVAL, the value of the spline at TVAL.
%
  if ( ndata < 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_OVERHAUSER_NONUNI_VAL - Fatal error!\n' );
    fprintf ( 1, '  NDATA < 3.\n' );
    error ( 'SPLINE_OVERHAUSER_NONUNI_VAL - Fatal error!' );
  end
%
%  Find the nearest interval [ TDATA(LEFT), TDATA(RIGHT) ] to TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Evaluate the spline in the given interval.
%
  if ( left == 1 )

    d21 = sqrt ( ( tdata(2) - tdata(1) )^2 ...
               + ( ydata(2) - ydata(1) )^2 );

    d32 = sqrt ( ( tdata(3) - tdata(2) )^2 ...
               + ( ydata(3) - ydata(2) )^2 );

    alpha = d21 / ( d32 + d21 );

    mbasis = basis_matrix_overhauser_nul ( alpha );

    yval = basis_matrix_tmp ( left, 3, mbasis, ndata, tdata, ydata, tval );

  elseif ( left < ndata-1 )

    d21 = sqrt ( ( tdata(left) - tdata(left-1) )^2 ...
               + ( ydata(left) - ydata(left-1) )^2 );

    d32 = sqrt ( ( tdata(left+1) - tdata(left) )^2 ...
               + ( ydata(left+1) - ydata(left) )^2 );

    d43 = sqrt ( ( tdata(left+2) - tdata(left+1) )^2 ...
               + ( ydata(left+2) - ydata(left+1) )^2 );

    alpha = d21 / ( d32 + d21 );
    beta  = d32 / ( d43 + d32 );

    mbasis = basis_matrix_overhauser_nonuni ( alpha, beta );

    yval = basis_matrix_tmp ( left, 4, mbasis, ndata, tdata, ydata, tval );

  elseif ( left == ndata-1 )

    d32 = sqrt ( ( tdata(ndata-1) - tdata(ndata-2) )^2 ...
               + ( ydata(ndata-1) - ydata(ndata-2) )^2 );

    d43 = sqrt ( ( tdata(ndata) - tdata(ndata-1) )^2 ...
               + ( ydata(ndata) - ydata(ndata-1) )^2 );

    beta  = d32 / ( d43 + d32 );

    mbasis = basis_matrix_overhauser_nur ( beta );

    yval = basis_matrix_tmp ( left, 3, mbasis, ndata, tdata, ydata, tval );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SPLINE_OVERHAUSER_NONUNI_VAL - Fatal error!\n' );
    fprintf ( 1, '  Nonsensical value of LEFT.\n' );
    error ( 'SPLINE_OVERHAUSER_NONUNI_VAL - Fatal error!' );

  end

  return
end
