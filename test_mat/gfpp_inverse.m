function a = gfpp_inverse ( n, alpha )

%*****************************************************************************80
%
%% GFPP_INVERSE returns the inverse of the GFPP matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real ALPHA, the value to assign to all subdiagonal
%    elements of A.  
%
%    Output, real A(N,N), the inverse matrix.
%
  [ p, l, u ] = gfpp_plu ( n, alpha );
  
  a = plu_inverse ( n, p, l, u );
  
  return
end
