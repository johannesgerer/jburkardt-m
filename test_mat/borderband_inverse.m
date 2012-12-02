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
%    03 July 2011
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

  a = plu_inverse ( n, p, l, u );

  return
end
