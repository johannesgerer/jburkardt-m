function a = hermite ( n )

%*****************************************************************************80
%
%% HERMITE returns the HERMITE matrix.
%
%  Example:
%
%    N = 11
%
%        1     .      .      .       .     .      .     .      .   .    .
%        .     2      .      .       .     .      .     .      .   .    .
%       -2     .      4      .       .     .      .     .      .   .    .
%        .   -12      .      8       .     .      .     .      .   .    .
%       12     .    -48      .      16     .      .     .      .   .    .
%        .   120      .   -160       .    32      .     .      .   .    .
%     -120     .    720      .    -480     .     64     .      .   .    .
%        . -1680      .   3360       . -1344      .   128      .   .    .
%     1680     . -13440      .   13440     .  -3584     .    256   .    .
%        . 30240      . -80640       . 48384      . -9216      . 512    .
%   -30240     . 302400      . -403200     . 161280     . -23040   . 1024
%
%  Properties:
%
%    A is generally not symmetric: A' ~= A.
%
%    A is lower triangular.
%
%    det ( A ) = 2^((N*(N-1))/2)
%
%    LAMBDA(I) = 2^(I-1).
%
%    A is integral: int ( A ) = A.
%
%    A is reducible.
%
%    Successive diagonals are zero, positive, zero, negative.
%
%    A is generally not normal: A' * A ~= A * A'.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  if ( n <= 0 )
    return
  end

  a(1,1) = 1.0;

  if ( n == 1 )
    return
  end

  a(2,2) = 2.0;

  if ( n == 2 )
    return
  end

  for i = 3 : n
    for j = 1 : n
      if ( j == 1 )
        a(i,j) =                  - 2.0 * ( i - 2 ) * a(i-2,j);
      else
        a(i,j) = 2.0 * a(i-1,j-1) - 2.0 * ( i - 2 ) * a(i-2,j);
      end
    end
  end

  return
end
