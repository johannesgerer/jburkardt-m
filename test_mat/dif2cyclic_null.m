function x = dif2cyclic_null ( n )

%*****************************************************************************80
%
%% DIF2CYCLIC_NULL returns a null vector of the cyclic second difference matrix.
%
%  Discussion:
%
%    X(1:N) = 1 is a null vector.
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
  x(1:n) = 1.0;

  return
end
