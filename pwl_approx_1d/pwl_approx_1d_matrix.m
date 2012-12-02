function a = pwl_approx_1d_matrix ( nd, xd, yd, nc, xc )

%*****************************************************************************80
%
%% PWL_APPROX_1D_MATRIX returns the matrix for the PWL approximant controls.
%
%  Discussion:
%
%    The value of the piecewise linear approximant, using control points XC
%    and control values YC, evaluated at the point XD, can be represented by
%
%      YD = A * YC
%
%    where A is a matrix whose values depend on XC and XD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of data points.
%    ND must be at least 1.
%
%    Input, real XD(ND,1), the data points.
%
%    Input, real YD(ND,1), the data values.
%
%    Input, integer NC, the number of control points.
%    NC must be at least 1.
%
%    Input, real XC(NC,1), the control points.
%
%    Output, real A(ND,NC), the matrix.
%
  a = zeros ( nd, nc );

  [ k, k ] = histc ( xd, xc );
%
%  Use extrapolation, if necessary.
%
  k ( k == 0 ) = 1;
  k ( k == nc ) = nc - 1;
  t = ( xd - xc(k,1) ) ./ ( xc(k+1,1) - xc(k,1) );
%
%  The obscure vectorized form of the following statements 
%  currently escapes me.
%
  for i = 1 : nd
    a(i,k(i)) = 1 - t(i);
    a(i,k(i)+1) = t(i);
  end

  return
end
