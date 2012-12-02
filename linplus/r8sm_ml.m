function b = r8sm_ml ( n, a_lu, u, v, pivot, x, job )

%*****************************************************************************80
%
%% R8SM_ML multiplies a factored square R8SM matrix times a vector.
%
%  Discussion:
%
%    The R8SM storage format is used for an M by N Sherman Morrison matrix B,
%    which is defined by an M by N matrix A, an M vector U, and
%    an N vector V, by B = A - U * V'
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_FA.
%
%    Input, real U(N), V(N), the Sherman Morrison vectors.
%
%    Input, integer PIVOT(N), the pivot vector computed by R8GE_FA.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Input, integer JOB, specifies the operation to be done:
%    JOB = 0, compute (A-u*v') * x.
%    JOB nonzero, compute (A-u*v')' * x.
%
%    Output, real B(N), the result of the multiplication.
%
  b(1:n) = r8ge_ml ( n, a_lu, pivot, x, job );

  if ( job == 0 )

    b(1:n) = b(1:n) - u(1:n) * ( v(1:n) * x(1:n)' );

  else

    b(1:n) = b(1:n) - v(1:n) * ( u(1:n) * x(1:n)' );

  end

  return
end
