function v = hepp_value ( m, n, o, x )

%*****************************************************************************80
%
%% HEPP_VALUE evaluates a Hermite Product Polynomial at several points X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of evaluation points.
%
%    Input, integer O(M,1), the degree of the polynomial factors.
%    0 <= O(*).
%
%    Input, real X(M,N), the evaluation points.
%
%    Output, real VALUE(N,1), the value of the Hermite Product Polynomial
%    of degree O at the points X.
%
  v = ones ( n, 1 );

  for i = 1 : m

    vi = hep_value ( n, o(i), x(i,1:n) );

    v(1:n) = v(1:n) .* vi(1:n);

  end

  return
end
