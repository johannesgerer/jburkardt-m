function determ = gfpp_determinant ( n, alpha )

%*****************************************************************************80
%
%% GFPP_DETERMINANT returns the determinant of the GFPP matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the value to assign to all subdiagonal
%    elements of A. 
%
%    Output, real DETERM, the determinant.
%
  determ = ( 1.0 + alpha )^( n - 1 );

  return
end
