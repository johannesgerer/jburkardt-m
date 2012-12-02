function determ = borderband_determinant ( n )

%*****************************************************************************80
%
%% BORDERBAND_DETERMINANT returns the determinant of the BORDERBAND matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of A.
%
%    Output, real DETERM, the determinant.
%
  determ = 0.0;
  for i = 1 : n - 1
    determ = determ - 2.0^( 2 - 2 * i );
  end
  determ = determ + 1.0;

  return
end
