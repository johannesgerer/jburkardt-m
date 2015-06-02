function fx = hermite_integrand ( d, n, x )

%*****************************************************************************80
%
%% HERMITE_INTEGRAND evaluates a test integrand for Hermite integrals.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2014
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
%    Input, real X(N,D), the points.
%
%    Output, real FX(N,1), the function values.
%
  if ( d == 1 )
    fx(1:n,1) = sqrt ( 1.0 + x(1:n).^2 );
  else
    fx(1:n,1) = sqrt ( 1.0 + x(1:n,1).^ 2 );
  end

  return
end
