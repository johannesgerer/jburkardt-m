function [ x, error_norm, iter, flag ] = bicg ( A, x, b, M, max_it, tol )

%% BICG solves a linear system using the biconjugate gradient method.
%
%  Discussion:
%
%    No preconditioning is applied.
%
%  Modified:
%
%    27 March 2006
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
%    Input, real M(N,N), the preconditioning matrix.  M is not used
%    by this routine, and it is included just so that the calling
%    sequence is similar to the other routines.
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
%    -1, the method broke down.
%

%
%  Initialization.
%
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

  flag = 1;
  
  r_tld  = r;

  for iter = 1 : max_it

    z = r;
    z_tld = r_tld;
    rho = z' * r_tld;
    
    if ( rho == 0.0 )
      flag = -1;
      break
    end
%
%  Compute direction vectors.
%
    if ( 1 < iter )
      beta = rho / rho_1;
      p = z + beta * p;
      p_tld = z_tld + beta * p_tld;
    else
      p = z;
      p_tld = z_tld;
    end
%
%  Compute the residual pair.
%
    q = A * p;
    q_tld = A' * p_tld;
    alpha = rho / ( p_tld' * q );
%
%  Update the approximation.
%
    x = x + alpha * p;
    r = r - alpha * q;
    r_tld = r_tld - alpha * q_tld;
%
%  Check for convergence.
%
    error_norm = norm ( r ) / bnrm2;
    errorhist(iter+1) = error_norm;

    if ( error_norm <= tol )
      flag = 0;
      break
    end

    rho_1 = rho;

  end

  error_norm = errorhist; 

  return
end
