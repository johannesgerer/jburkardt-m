function fx = fn_value ( d, n, x )

%*****************************************************************************80
%
%% FN_VALUE is a Hermite test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 May 2012
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer D, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real X(D,N), the points.
%
%    Output, real FX(N,1), the function values.
%
  exponent = 6;

  if ( d == 1 )
    fx(1:n,1) = x(1:n).^exponent;
  else
    fx(1:n,1) = x(1,1:n).^exponent;
  end

  return
end
