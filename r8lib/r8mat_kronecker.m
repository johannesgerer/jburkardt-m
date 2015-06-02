function c = r8mat_kronecker ( m1, n1, a, m2, n2, b )

%*****************************************************************************80
%
%% R8MAT_KRONECKER computes the Kronecker product of two R8MAT's.
%
%  Discussion:
%
%    An R8MAT is an MxN array of R8's, stored by (I,J) -> [I+J*M].
%
%    If A is an M1 by N1 array, and B is an M2 by N2 array, then
%    the Kronecker product of A and B is an M1*M2 by N1*N2 array
%      C(I,J) = A(I1,J1) * B(I2,J2)
%    where
%      I1 =     ( I - 1 ) / M2   + 1
%      I2 = mod ( I - 1,    M2 ) + 1
%      J1 =     ( J - 1 ) / N2   + 1
%      J2 = mod ( J - 1,    N2 ) + 1
%
%    Note that MATLAB provides the "kron(a,b)" function to compute the
%    Kronecker product, and that should be used instead of this function%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M1, N1, the order of the first matrix.
%
%    Input, real A(M1,N1), the first matrix.
%
%    Input, integer M2, N2, the order of the second matrix.
%
%    Input, real B(M2,N2), the second matrix.
%
%    Output, real C(M1*M2,N1*N2), the Kronecker product.
%
  c = zeros ( m1 * m2, n1 * n2 );

  for j1 = 1 : n1
    for i1 = 1 : m1
      i0 = ( i1 - 1 ) * m2;
      j0 = ( j1 - 1 ) * n2;
      j = j0;
      for j2 = 1 : n2
        j = j + 1;
        i = i0;
        for i2 = 1 : m2
          i = i + 1;
          c(i,j) = a(i1,j1) * b(i2,j2);
        end
      end
    end
  end

  return
end
