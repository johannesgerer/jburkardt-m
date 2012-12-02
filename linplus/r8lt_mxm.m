function c = r8lt_mxm ( n, a, b )

%*****************************************************************************80
%
%% R8LT_MXM multiplies two R8LT matrices.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, real A(N,N), B(N,N), the R8LT factor matrices.
%
%    Output, real C(N,N), the R8LT product matrix.
%
  c(1:n,1:n) = 0.0E+00;

  for i = 1 : n
    for j = 1 : i
      c(i,j) = a(i,j:i) * b(j:i,j);
    end
  end
 
  return
end
