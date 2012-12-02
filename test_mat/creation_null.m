function x = creation_null ( n )

%*****************************************************************************80
%
%% CREATION_NULL returns a null vector of the creation matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real X(N), the null vector.
%
  x(1:n-1) = 0.0;
  x(n) = 1.0;

  return
end
