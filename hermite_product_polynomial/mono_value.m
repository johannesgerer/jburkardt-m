function v = mono_value ( m, n, f, x )

%*****************************************************************************80
%
%% MONO_VALUE evaluates a monomial.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 December 2013
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
%    Input, integer F(M), the exponents of the monomial.
%
%    Input, real X(M,N), the coordinates of the evaluation points.
%
%    Output, real V(N), the value of the monomial at X.
%  
  v = ones ( n, 1 );

  for i = 1 : m
    v(1:n,1) = v(1:n,1) .* x(i,1:n)' .^ f(i);
  end

  return
end

