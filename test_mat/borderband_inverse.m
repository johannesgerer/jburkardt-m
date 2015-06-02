function a = borderband_inverse ( n )

%*****************************************************************************80
%
%% BORDERBAND_INVERSE returns the inverse of the BORDERBAND matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the inverse matrix.
%
  [ p, l, u ] = borderband_plu ( n );

  p_inverse = p';

  l_inverse = tri_l1_inverse ( n, l );

  u_inverse = tri_u_inverse ( n, u );

  a = u_inverse * l_inverse * p_inverse;

  return
end
