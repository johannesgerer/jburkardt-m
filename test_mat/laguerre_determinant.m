function determ = laguerre_determinant ( n )

%*****************************************************************************80
%
%% LAGUERRE_DETERMINANT returns the determinant of the LAGUERRE matrix.
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
%    Input, integer N, the order of the matrix.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;
  p = + 1.0;
  for i = 1 : n
    im1 = i - 1;
    determ = determ * p / r8_factorial ( im1 );
    p = - p;
  end

  return
end
