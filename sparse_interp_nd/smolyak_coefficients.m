function [ c, w ] = smolyak_coefficients ( l_max, m )

%*****************************************************************************80
%
%% SMOLYAK_COEFFICIENTS returns the Smolyak coefficients and counts.
%
%  Discussion:
%
%    The Smolyak sparse interpolant can be written as:
%
%      A(L,M)(X) = sum ( L-M+1 <= |L| <= L_max ) 
%        C(|L|) * g(l1)(x1) * g(l2)(x2) * ... * g(lm)(xm).
%
%    where:
%
%    * L=(l1,l2,...,lm) is a vector of M nonnegative integers;
%    * |L| is the sum of the entries of L;
%    * X=(x1,x2,...,xm) is an M-dimensional point in a product space;
%    * g(i)(xj) is the i-th 1-d interpolation function in dimension j;
%
%    Note that:
%
%    * W(|L|) will represent the number of distinct interpolants for which
%      the sublevel, or sum of the L vector entries, is |L|;
%
%    * the coefficients C and counts W will be zero for sublevels 
%      0 through L_MAX - M (and MATLAB indices 1 through L_MAX-M+1).
%
%    * it will be the case that W' * C = 1, essentially because the interpolant
%      to the identity function must be the identity function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer L_MAX, the (maximum) level.
%    0 <= L_MAX.
%
%    Input, integer M, the spatial dimension.
%    1 <= M.
%
%    Output, integer C(L_MAX+1), the coefficients for objects at sublevels
%    0 through L_MAX.
%
%    Output, integer W(L_MAX+1), the number of objects at sublevels 
%    0 through L_MAX.
%
  c = zeros ( l_max + 1, 1 );

  l_min = max ( l_max - m + 1, 0 );
  for l = l_min : l_max
    c(l+1,1) = i4_mop ( l_max - l ) * i4_choose ( m - 1, l_max - l );
  end

  w = zeros ( l_max + 1, 1 );

  for l = l_min : l_max
    w(l+1) = i4_choose ( l + m - 1, m - 1 );
  end

  return
end
