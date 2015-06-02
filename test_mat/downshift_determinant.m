function determ = downshift_determinant ( n )

%*****************************************************************************80
%
%% DOWNSHIFT_DETERMINANT returns the determinant of the DOWNSHIFT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 May 2002
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
  if ( mod ( n, 2 ) == 0 )
    determ = -1.0;
  else
    determ = +1.0;
  end

  return
end
