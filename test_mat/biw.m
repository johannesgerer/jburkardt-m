function a = biw ( n )

%*****************************************************************************80
%
%% BIW returns the BIW matrix.
%
%  Discussion:
%
%    BIW is a bidiagonal matrix of Wilkinson.   Originally, this matrix
%    was considered for N = 100.
%
%  Formula:
%
%    if ( I == J )
%      A(I,J) = 0.5 + I / ( 10 * N )
%    else if ( J == I+1 )
%      A(I,J) = -1.0
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%    0.52 -1.00  0.00  0.00  0.00
%    0.00  0.54 -1.00  0.00  0.00
%    0.00  0.00  0.56 -1.00  0.00
%    0.00  0.00  0.00  0.58 -1.00
%    0.00  0.00  0.00  0.00  0.60
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 March 2015
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
    a(i,i) = 0.5 + i / ( 10 * n );
  end

  for i = 1 : n - 1
    a(i,i+1) = - 1.0;
  end

  return
end