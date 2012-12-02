function determ = milnes_determinant ( n, x )

%*****************************************************************************80
%
%% MILNES_DETERMINANT returns the determinant of the Milnes matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N-1), the lower column values.
%
%    Output, real DETERM, the determinant.
%
  if ( n == 1 )
    determ = 1.0;
  else
    determ = prod ( 1.0 - x(1:n-1) );
  end

  return
end
