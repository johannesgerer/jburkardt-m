function determ = fibonacci3_determinant ( n )

%*****************************************************************************80
%
%% FIBONACCI3_DETERMINANT returns the determinant of the Fibonacci3 matrix.
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
%    Output, real DETERM, the determinant.
%
  f1 = 0;
  f2 = 0;
  f3 = 1;

  for i = 1 : n
    f1 = f2;
    f2 = f3;
    f3 = f1 + f2;
  end

  determ = f3;

  return
end
