function determ = one_determinant ( n )

%*****************************************************************************80
%
%% ONE_DETERMINANT returns the determinant of the ONE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
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
  if ( n == 1 )
    determ = 1.0;
  else
    determ = 0.0;
  end

  return
end
