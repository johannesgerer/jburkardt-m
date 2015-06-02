function [ x, error_norm, iter, flag ]  = sor ( A, x, b, w, max_it, tol )

%*****************************************************************************80
%
%% SOR solves the linear system Ax=b using the Successive Over-Relaxation Method.  
%
%  Discussion:
%
%    When the parameter W
%    is set to 1, this is equivalent to the Gauss-Seidel iteration.
%
%  Reference:
%
%    Richard Barrett, Michael Berry, Tony Chan, James Demmel,
%      June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%      Charles Romine, Henk van der Vorst
%    Templates for the Solution of Linear Systems: Building Blocks for 
%      Iterative Methods, 
%    SIAM Publications, 1993.
%
%  Parameters:
%
%    Input, real A(N,N), the symmetric positive definite matrix.
%
%    Input, real X(N), the initial guess vector.
%
%    Input, real B(N), the right hand side vector.
%
%    Input, real W, the relaxation scalar, between 0 and 2.
%
%    Input, integer MAX_IT, the maximum number of iterations.
%
%    Input, real TOL, an error tolerance.
%
%    Output, real X(N), the solution.
%
%    Output, real ERROR_NORM, the norm of the error.
%
%    Output, integer ITER, the number of iterations performed.
%
%    Output, integer FLAG, the return flag.
%    0 = the solution was found to within the specified tolerance.
%    1 = a satisfactory solution was not found.  The iteration limit
%        was exceeded.
%

%
%  Initialization.
%
  flag = 1;
  iter = 0;

  bnrm2 = norm ( b );
  if ( bnrm2 == 0.0 )
    bnrm2 = 1.0
  end

  r = b - A * x;
  error_norm = norm ( r ) / bnrm2;
  errorhist = [ ];
  errorhist(1) = error_norm;

  if ( error_norm < tol )
    flag = 0;
    return
  end
%
%  Split the matrix.
%
  [ M, N, b ] = split ( A, b, w, 2 );

  for iter = 1 : max_it

    x_1 = x;
%
%  Update the approximation.
%
    x = M \ ( N * x + b );
%
%  Compute the error.
%
    error_norm = norm ( x - x_1 ) / norm ( x );
    errorhist(iter+1) = error_norm;
%
%  Check for convergence.
%
    if ( error_norm <= tol )
      flag = 0;
      break 
    end

  end
%
%  Restore the right hand side.
%
  b = b / w;

  error_norm = errorhist;

  return
end
