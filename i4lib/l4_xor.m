function value = l4_xor ( l1, l2 )

%*****************************************************************************80
%
%% L4_XOR returns the exclusive OR of two L4's.
%
%  Discussion:
%
%    An L4 is a logical value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 May 2014
%
%  Author:
%
%   John Burkardt
%
%  Parameters:
%
%    Input, logical L1, L2, two values whose exclusive OR is needed.
%
%    Output, logical VALUE, the exclusive OR of L1 and L2.
%
  value = xor ( l1, l2 );

  return
end
