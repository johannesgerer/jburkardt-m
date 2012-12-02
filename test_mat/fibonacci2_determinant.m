function determ = fibonacci2_determinant ( n )

%*****************************************************************************80
%
%% FIBONACCI2_DETERMINANT returns the determinant of the Fibonacci2 matrix.
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
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  if ( n == 1 )
    determ = 0.0;
  else
    determ = -1.0;
  end

  return
end
