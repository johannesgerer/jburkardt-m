function a = exchange_inverse ( n )

%*****************************************************************************80
%
%% EXCHANGE_INVERSE returns the inverse of the exchange matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a = exchange ( n, n );

  return
end
