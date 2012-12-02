function c = r8ut_mxm ( n, a, b )

%*****************************************************************************80
%
%% R8UT_MXM multiplies two R8UT matrices.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2004
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
%    Input, real A(N,N), B(N,N), the R8UT factor matrices.
%
%    Output, real C(N,N), the R8UT product matrix.
%
  c = zeros ( n, n );

  for i = 1 : n
   for j = i : n
      for k = i : j
        c(i,j) = c(i,j) + a(i,k) * b(k,j);
      end
    end
  end

  return
end
