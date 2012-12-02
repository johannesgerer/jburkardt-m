function yval = spline_overhauser_uni_val ( ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% SPLINE_OVERHAUSER_UNI_VAL evaluates the uniform Overhauser spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NDATA, the number of data points.
%
%    Input, real TDATA(NDATA), the abscissas of the data points.
%    The values of TDATA are assumed to be distinct and increasing.
%    This routine also assumes that the values of TDATA are uniformly
%    spaced; for instance, TDATA(1) = 10, TDATA(2) = 11, TDATA(3) = 12...
%
%    Input, real YDATA(NDATA), the data values.
%
%    Input, real TVAL, the value where the spline is to
%    be evaluated.
%
%    Output, real YVAL, the value of the spline at TVAL.
%

%
%  Find the nearest interval [ TDATA(LEFT), TDATA(RIGHT) ] to TVAL.
%
  [ left, right ] = r8vec_bracket ( ndata, tdata, tval );
%
%  Evaluate the spline in the given interval.
%
  if ( left == 1 )

    mbasis = basis_matrix_overhauser_uni_l ( );

    yval = basis_matrix_tmp ( left, 3, mbasis, ndata, tdata, ydata, tval );

  elseif ( left < ndata-1 )

    mbasis = basis_matrix_overhauser_uni ( );

    yval = basis_matrix_tmp ( left, 4, mbasis, ndata, tdata, ydata, tval );

  elseif ( left == ndata-1 ) 

    mbasis = basis_matrix_overhauser_uni_r ( );

    yval = basis_matrix_tmp ( left, 3, mbasis, ndata, tdata, ydata, tval );

  end

  return
end
