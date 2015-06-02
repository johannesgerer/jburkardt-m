function a = a123 ( )

%*****************************************************************************80
%
%% A123 returns the A123 matrix.
%
%  Example:
%
%    1 2 3
%    4 5 6
%    7 8 9
%
%  Properties:
%
%    A is integral.
%
%    A is not symmetric.
%
%    A is singular.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(3,3), the matrix.
%
  a = zeros ( 3, 3 );

  k = 0;
  for i = 1 : 3
    for j = 1 : 3
      k = k + 1;
      a(i,j) = k;
    end
  end

  return
end