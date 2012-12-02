function [ l, u ] = r8ge_ilu ( m, n, a )

%*****************************************************************************80
%
%% R8GE_ILU produces the incomplete LU factors of a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    The incomplete LU factors of the M by N matrix A are:
%
%      L, an M by M unit lower triangular matrix,
%      U, an M by N upper triangular matrix
%
%    with the property that L and U are computed in the same way as
%    the usual LU factors, except that, whenever an off diagonal element
%    of the original matrix is zero, then the corresponding value of
%    U is forced to be zero.
%
%    This condition means that it is no longer the case that A = L*U.
%
%    On the other hand, L and U will have a simple sparsity structure
%    related to that of A.  The incomplete LU factorization is generally
%    used as a preconditioner in iterative schemes applied to sparse
%    matrices.  It is presented here merely for illustration.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the R8GE matrix.
%
%    Output, real L(M,M), the M by M unit lower triangular factor.
%
%    Output, real U(M,N), the M by N upper triangular factor.
%
  l(1:m,1:m) = 0.0;
  for i = 1 : m
    l(i,i) = 1.0;
  end

  u(1:m,1:n) = a(1:m,1:n);

  for j = 1 : min ( m-1, n )
%
%  Zero out the entries in column J, from row J+1 to M.
%
    for i = j+1 : m

      if ( u(i,j) ~= 0.0E+00 )

        l(i,j) = u(i,j) / u(j,j);
        u(i,j) = 0.0E+00;

        for k = j+1 : n
          if ( u(i,k) ~= 0.0E+00 )
            u(i,k) = u(i,k) - l(i,j) * u(j,k);
          end
        end

      end

    end

  end

  return
end
