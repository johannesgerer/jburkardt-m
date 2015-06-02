function a = plu_inverse ( n, pivot )

%*****************************************************************************80
%
%% PLU_INVERSE returns the inverse of a PLU matrix.
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
%    Input, integer PIVOT(N), the list of pivot rows.  PIVOT(I)
%    must be a value between I and N, reflecting the choice of
%    pivot row on the I-th step.  For no pivoting, set PIVOT(I) = I.
%
%    Output, real A(N,N), the inverse matrix.
%
  [ p, l, u ] = plu_plu ( n, pivot );

  p_inverse = p';

  l_inverse = tri_l1_inverse ( n, l );

  u_inverse = tri_u_inverse ( n, u );

  a = u_inverse * l_inverse * p_inverse;

  return
end
