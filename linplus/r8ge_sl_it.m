function [ x, dx ] = r8ge_sl_it ( n, a, a_lu, pivot, b, job, x )

%*****************************************************************************80
%
%% R8GE_SL_IT applies one step of iterative refinement following R8GE_SL.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
%
%    It is assumed that:
%
%    * the original matrix A has been factored by R8GE_FA;
%    * the linear system A * x = b has been solved once by R8GE_SL.
%
%    (Actually, it is not necessary to solve the system once using R8GE_SL.
%    You may simply supply the initial estimated solution X = 0.)
%
%    Each time this routine is called, it will compute the residual in
%    the linear system, apply one step of iterative refinement, and
%    add the computed correction to the current solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2004
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
%    Input, real A(N,N), the original, UNFACTORED R8GE matrix.
%
%    Input, real A_LU(N,N), the LU factors from R8GE_FA.
%
%    Input, integer PIVOT(N), the pivot vector from R8GE_FA.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, integer JOB, specifies the operation.
%    0, solve A*X=B.
%    nonzero, solve A'*X=B.
%
%    Input, real X(N), an estimate of the solution of A * x = b.
%
%    Output, real X(N), an improved estimate of the solution.
%
%    Output, real DX(N), contains the correction terms added to X.
%

%
%  Compute the residual vector.
%
  r = r8ge_res ( n, n, a, x, b );
%
%  Solve A * dx = r
%
  dx = r8ge_sl ( n, a_lu, pivot, r, job );
%
%  Add dx to x.
%
  x(1:n) = x(1:n) + dx(1:n);

  return
end
