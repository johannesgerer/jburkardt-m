function determ = invol_determinant ( n )

%*****************************************************************************80
%
%% INVOL_DETERMINANT returns the determinant of the INVOL matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 4 ) == 0 | mod ( n, 4 ) == 3 )
    determ = 1.0;
  else
    determ = -1.0;
  end

  return
end
