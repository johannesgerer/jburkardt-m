function determ = smoke_determinant ( n )

%*****************************************************************************80
%
%% SMOKE_DETERMINANT returns the determinant of the SMOKE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
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
    determ =   2.0;
  else
    determ = - 2.0;
  end

  return
end
