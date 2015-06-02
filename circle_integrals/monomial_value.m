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
%    where the exponents are nonnegative integers.  Note that
%    if the combination 0^0 is encountered, it should be treated
%    as 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points at which the
%    monomial is to be evaluated.
%
%    Input, integer E(M), the exponents.
%
%    Input, real X(M,N), the point coordinates.
%
%    Output, real V(N), the value of the monomial.
%
  v(1:n,1) = 1.0;

  for i = 1 : m
    if ( 0 ~= e(i) )
      v(1:n,1) = v(1:n,1) .* ( x(i,1:n).^e(i) )';
    end
  end

  return
end
