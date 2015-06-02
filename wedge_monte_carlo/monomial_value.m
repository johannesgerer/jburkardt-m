function v = monomial_value ( m, n, e, x )

%*****************************************************************************80
%
%% MONOMIAL_VALUE evaluates a monomial.
%
%  Discussion:
%
%    This routine evaluates a monomial of the form
%
%      product ( 1 <= i <= m ) x(i)^e(i)
%
%    The combination 0.0^0 is encountered is treated as 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 August 2014
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
%    Input, integer E(M), the exponents.
%
%    Input, real X(M,N), the point coordinates.
%
%    Output, real V(N), the monomial values.
%
  v = ones ( n, 1 );

  for i = 1 : m
    if ( 0 ~= e(i) )
      v(1:n,1) = v(1:n,1) .* x(i,1:n)' .^ e(i);
    end
  end

  return
end
