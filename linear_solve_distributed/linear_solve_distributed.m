function x_error = linear_solve_distributed ( n )

%% LINEAR_SOLVE_DISTRIBUTED solves a distributed linear system.
%
%  Discussion:
%
%    A dense matrix A is defined, with its elements distributed
%    across the participating MATLAB workers.
%
%    The backslash operator is used to factor A and solve a
%    linear system.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real X_ERROR, the L2 error in the solution.
%
  spmd
%
%  Create the matrix A so that its entries are distributed
%  across the available workers.
%
    A = rand ( n, n, codistributor ( ) );
%
%  Set b so that the exact solution is the vector of 1's.
%
    b = sum ( A, 2 );
%
%  Solve the linear system A * x = b.  
%
%  Since the data is distributed, the MATLAB workers must communicate
%  during the computation.
%
    x = A \ b;

    error_norm = norm ( x - ones(1000,1) );

  end

  x_error = error_norm{1};
 
  return
end
