function det = bis_determinant ( alpha, beta, n )

%*****************************************************************************80
%
%% BIS_DETERMINANT returns the determinant of the bidiagonal scalar matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, the scalars which define the
%    diagonal and first superdiagonal of the matrix.
%
%    Input, integer N, the order of the matrix.
%
%    Output, real DET, the determinant of the matrix.
%
  det = alpha^n;

  return
end
