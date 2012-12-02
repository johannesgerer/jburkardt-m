function determ = helmert_determinant ( n )

%*****************************************************************************80
%
%% HELMERT_DETERMINANT returns the determinant of the HELMERT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
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
  if ( mod ( n, 2 ) == 0 )
    determ = -1.0;
  else
    determ = +1.0;
  end

  return
end
