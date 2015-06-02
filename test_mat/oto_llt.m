function a = oto_llt ( n )

%*****************************************************************************80
%
%% OTO_LLT returns the Cholesky factor of the OTO matrix.
%
%  Example:
%
%    N = 5
%
%   1.4142         0         0         0         0
%   0.7071    1.2247         0         0         0
%        0    0.8165    1.1547         0         0
%        0         0    0.8660    1.1180         0
%        0         0         0    0.8944    1.0954
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2015
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
  a = zeros ( n, n );

  for i = 1 : n
    a(i,i) = sqrt ( ( i + 1 ) / i );
  end

  for i = 2 : n
    a(i,i-1) = sqrt ( ( i - 1 ) / i );
  end

  return
end