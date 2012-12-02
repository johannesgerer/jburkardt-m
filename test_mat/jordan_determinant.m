function determ = jordan_determinant ( alpha, n )

%*****************************************************************************80
%
%% JORDAN_DETERMINANT returns the determinant of a Jordan block matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the eigenvalue of A.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  determ = alpha^n;

  return
end
