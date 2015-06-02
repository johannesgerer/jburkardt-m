function determ = jordan_determinant ( n, alpha )

%*****************************************************************************80
%
%% JORDAN_DETERMINANT returns the determinant of the JORDAN matrix.
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
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the eigenvalue of the Jordan matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = alpha^n;

  return
end
