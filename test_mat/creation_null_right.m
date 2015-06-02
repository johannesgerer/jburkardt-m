function x = creation_null_right ( m, n )

%*****************************************************************************80
%
%% CREATION_NULL_RIGHT returns a right null vector of the CREATION matrix.
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
%    Input, integer M, N, the order of A.
%
%    Output, real X(N,1), the null vector.
%
  x = zeros ( n, 1 );

  x(n,1) = 1.0;

  return
end
