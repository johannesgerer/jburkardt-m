function determ = fibonacci1_determinant ( n, f1, f2 )

%*****************************************************************************80
%
%% FIBONACCI1_DETERMINANT returns the determinant of the Fibonacci1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real F1, F2, the first two elements of the sequence
%    that will generate the Fibonacci sequence.
%
%    Output, real DETERM, the determinant.
%
  if ( n == 1 )
    determ = 1.0;
  elseif ( n == 2 )
    determ = -1.0;
  else
    determ = 0.0;
  end

  return
end
