function fx = legendre_integrand ( d, n, x )

%*****************************************************************************80
%
%% LEGENDRE_INTEGRAND is an integrand for the Legendre integral.
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
  if ( d == 1 )

    fx(1:n,1) = exp ( - ( x(1:n) / 2.0 ).^2 / 2.0 ) ...
      / 2.0 / sqrt ( 2.0 * pi );

  else

    fx(1:n,1) = 1.0;

    for i = 1 : d
      fx(1:n,1) = fx(1:n,1) .* exp ( - ( x(i,1:n)' / 2.0 ).^2 / 2.0 ) ...
        / 2.0 / sqrt ( 2.0 * pi );
    end

  end

  return
end
