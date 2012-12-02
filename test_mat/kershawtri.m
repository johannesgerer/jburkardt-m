function a = kershawtri ( n, x )

%*****************************************************************************80
%
%% KERSHAWTRI returns the KERSHAWTRI matrix.
%
%  Discussion:
%
%    A(I,I) = X(I)     for I <= (N+1)/2
%    A(I,I) = X(N+1-I) for (N+1)/2 < I
%    A(I,J) = 1        for I = J + 1 or I = J - 1.
%    A(I,J) = 0        otherwise.
%
%  Example:
%
%    N = 5,
%    X = ( 10, 20, 30 )
%    A = 
%      10   1   0   0   0
%       1  20   1   0   0
%       0   1  30   1   0
%       0   0   1  20   1
%       0   0   0   1  10
%
%  Properties:
%
%    A is tridiagonal.
%
%    A is symmetric.
%
%    If the entries in X are integers, then det(A) is an integer.
%
%    If det(A) is an integer, then det(A) * inv(A) is an integer matrix.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    P Schlegel,
%    The Explicit Inverse of a Tridiagonal Matrix,
%    Mathematics of Computation,
%    Volume 24, Number 111, July 1970, page 665.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X((N+1)/2), defines the diagonal of the matrix.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;

  nh = floor ( n / 2 );

  for i = 1 : nh
    a(i,i)         = x(i);
    a(n+1-i,n+1-i) = x(i);
  end

  if ( mod ( n, 2 ) == 1 )
    a(nh+1,nh+1) = x(nh+1);
  end
  
  for i = 1 : n - 1
    a(i,i+1) = 1.0;
    a(i+1,i) = 1.0;
  end

  return
end
