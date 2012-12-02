function yval = basis_matrix_tmp ( left, n, mbasis, ndata, tdata, ydata, tval )

%*****************************************************************************80
%
%% BASIS_MATRIX_TMP computes Q = T * MBASIS * P
%
%  Discussion:
%
%    YDATA is a vector of data values, most frequently the values of some
%    function sampled at uniformly spaced points.  MBASIS is the basis
%    matrix for a particular kind of spline.  T is a vector of the
%    powers of the normalized difference between TVAL and the left
%    endpoint of the interval.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer LEFT, indicats that TVAL is in the interval
%    [ TDATA(LEFT), TDATA(LEFT+1) ], or that this is the "nearest"
%    interval to TVAL.
%    For TVAL < TDATA(1), use LEFT = 1.
%    For TDATA(NDATA) < TVAL, use LEFT = NDATA - 1.
%
%    Input, integer N, the order of the basis matrix.
%
%    Input, real MBASIS(N,N), the basis matrix.
%
%    Input, integer NDATA, the dimension of the vectors TDATA and YDATA.
%
%    Input, real TDATA(NDATA), the abscissa values.  This routine
%    assumes that the TDATA values are uniformly spaced, with an
%    increment of 1.0.
%
%    Input, real YDATA(NDATA), the data values to be interpolated or
%    approximated.
%
%    Input, real TVAL, the value of T at which the spline is to be
%    evaluated.
%
%    Output, real YVAL, the value of the spline at TVAL.
%
  if ( left == 1 )
    arg = 0.5E+00 * ( tval - tdata(left) );
    first = left;
  elseif ( left < ndata - 1 )
    arg = tval - tdata(left);
    first = left - 1;
  elseif ( left == ndata - 1 )
    arg = 0.5E+00 * ( 1.0E+00 + tval - tdata(left) );
    first = left - 1;
  end
%
%  TVEC(I) = ARG**(N-I).
%
  tvec(n,1) = 1.0E+00;
  for i = n-1 : -1 : 1
    tvec(i,1) = arg * tvec(i+1,1);
  end

  yval = 0.0E+00;
  for j = 1 : n
    yval = yval + ( tvec(1:n,1)' * mbasis(1:n,j) ) * ydata(first - 1 + j);
  end

  return
end
