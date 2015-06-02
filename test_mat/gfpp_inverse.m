function a = gfpp_inverse ( n, alpha )

%*****************************************************************************80
%
%% GFPP_INVERSE returns the inverse of the GFPP matrix.
%
%  Example:
%
%    N = 5, ALPHA = 1
%
%    0.5000   -0.2500   -0.1250   -0.0625   -0.0625
%         0    0.5000   -0.2500   -0.1250   -0.1250
%         0         0    0.5000   -0.2500   -0.2500
%         0         0         0    0.5000   -0.5000
%    0.5000    0.2500    0.1250    0.0625    0.0625
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, determines subdiagonal elements.
%
%    Output, real A(N,N), the inverse matrix.
%
  [ p, l, u ] = gfpp_plu ( n, alpha );
  
  p_inverse = p';

  l_inverse = tri_l1_inverse ( n, l );

  u_inverse = tri_u_inverse ( n, u );

  a = u_inverse * l_inverse * p_inverse;
  
  return
end
