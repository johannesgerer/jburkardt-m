function A = vandermonde_interp_1d_matrix ( n, x )

%*****************************************************************************80
%
%% VANDERMONDE_INTERP_1D_MATRIX computes a Vandermonde 1D interpolation matrix.
%
%  Discussion:
%
%    We assume the interpolant has the form
%
%      p(x) = c1 + c2 * x + c3 * x^2 + ... + cn * x^(n-1).
%
%    We have n data values (x(i),y(i)) which must be interpolated:
%
%      p(x(i)) = c1 + c2 * x(i) + c3 * x(i)^2 + ... + cn * x(i)^(n-1) = y(i)
%
%    This can be cast as an NxN linear system for the polynomial
%    coefficients:
%
%      [ 1 x1 x1^2 ... x1^(n-1) ] [  c1 ] = [  y1 ]
%      [ 1 x2 x2^2 ... x2^(n-1) ] [  c2 ] = [  y2 ]
%      [ ...................... ] [ ... ] = [ ... ]
%      [ 1 xn xn^2 ... xn^(n-1) ] [  cn ] = [  yn ]
%
%    and if the x values are distinct, the matrix A is theoretically
%    invertible (though in fact, generally badly conditioned).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points.
%
%    Input, real X(N,1), the data values.
%
%    Output, real A(N,N), the Vandermonde matrix for X.
%
  A = ( x(1:n,1) * ones(1,n) ) .^ ( ones(n,1) * (0:n-1) );

  return
end
