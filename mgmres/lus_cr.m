function z = lus_cr ( n, nz_num, ia, ja, l, ua, r )

%*****************************************************************************80
%
%% LUS_CR applies the incomplete LU preconditioner.
%
%  Discussion:
%
%    The linear system M * Z = R is solved for Z.  M is the incomplete
%    LU preconditioner matrix, and R is a vector supplied by the user.
%    So essentially, we are solving L * U * Z = R.
%
%    The matrix A is assumed to be stored in compressed row format.  Only
%    the nonzero entries of A are stored.  The vector JA stores the
%    column index of the nonzero value.  The nonzero values are sorted
%    by row, and the compressed row vector IA then has the property that
%    the entries in A and JA that correspond to row I occur in indices
%    IA(I) through IA(I+1)-1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%   
%  Modified:
%
%    25 March 2008
%
%  Author:
%
%    Original C version by Lili Ju.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the system.
%
%    Input, integer NZ_NUM, the number of nonzeros.
%
%    Input, integer IA(N+1), JA(NZ_NUM), the row and column indices
%    of the matrix values.  The row vector has been compressed.
%
%    Input, real L(NZ_NUM), the matrix values.
%
%    Input, integer UA(N), the index of the diagonal element of each row.
%
%    Input, real R(N), the right hand side.
%
%    Output, real Z(N), the solution of the system M * Z = R.
%

%
%  Copy R in.
%
  w(1:n) = r(1:n);
%
%  Solve L * w = w where L is unit lower triangular.
%
  for i = 2 : n
    for j = ia(i) : ua(i) - 1
      w(i) = w(i) - l(j) * w(ja(j));
    end
  end
%
%  Solve U * w = w, where U is upper triangular.
%
  for i = n : -1 : 1
    for j = ua(i) + 1 : ia(i+1) - 1
      w(i) = w(i) - l(j) * w(ja(j));
    end
    w(i) = w(i) / l(ua(i));
  end
%
%  Copy Z out.
%
  z(1:n) = w(1:n);

  return
end
