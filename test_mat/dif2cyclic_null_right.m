function x = dif2cyclic_null_right ( m, n )

%*****************************************************************************80
%
%% DIF2CYCLIC_NULL_RIGHT returns a right null vector of the DIF2CYCLIC matrix.
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
%    Input, integer M, N, the order of A.
%
%    Output, real X(N,1), the null vector.
%
  x = ones ( n, 1 );

  return
end
