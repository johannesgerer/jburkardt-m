function [ x, error_norm, iter, flag ]  = jacobi ( A, x, b, max_it, tol )

%% JACOBI solves a linear system using the Jacobi method.
%
%  Modified:
%
%    19 July 2004
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
  iter = 0;
  flag = 0;

  bnrm2 = norm ( b );
  if ( bnrm2 == 0.0 )
    bnrm2 = 1.0; 
  end

  r = b - A * x;
  error_norm = norm ( r ) / bnrm2;
  errorhist = [ ];
  errorhist(1) = error_norm;
  if ( error_norm < tol )
    return 
  end

  [ m, n ] = size ( A );
%
%  Split the matrix.
%
  [ M, N ] = split ( A, b, 1.0, 1 );

  for iter = 1 : max_it

    x_1 = x;
%
%  Update the approximate solution.
%
    x = M \ ( N * x + b );
%
%  Compute the relative change in the approximate solution.
%
    error_norm = norm ( x - x_1 ) / norm ( x );
    errorhist(iter+1) = error_norm;
    if ( error_norm <= tol )
      break
    end

  end

  if ( tol < error_norm ) 
    flag = 1; 
  end

  error_norm = errorhist;

  return
end
