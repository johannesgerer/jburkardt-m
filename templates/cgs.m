function [ x, error_norm, iter, flag ] = cgs ( A, x, b, M, max_it, tol )

%% CGS solves a linear system using the conjugate gradient squared method.
%
%  Discussion:
%
%    The algorithm is appropriate for a symmetric positive definite matrix A.
%
%    This routine does NOT carry out preconditioning.
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
%    Input, real M, not used.
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
%    -1: the iteration broke down.
%
  iter = 0;

  bnrm2 = norm ( b );
  if ( bnrm2 == 0.0 )
    bnrm2 = 1.0; 
  end

  r = b - A * x;
  error_norm = norm ( r ) / bnrm2;
  errorhist = [ ];
  errorhist ( 1 ) = error_norm;

  if ( error_norm < tol )
    flag = 0;
    return
  end

  flag = 1;

  r_tld = r;

  for iter = 1 : max_it

    rho = r_tld' * r;

    if ( rho == 0.0 )
      flag = -1;
      break
    end
%
%  Compute the direction vectors.
%
    if ( 1 < iter )
      beta = rho / rho_1;
      u = r + beta * q;
      p = u + beta * ( q + beta * p );
    else
      u = r;
      p = u;
    end

    p_hat =  p;

    v_hat = A * p_hat;
    alpha = rho / ( r_tld' * v_hat );
    q = u - alpha * v_hat;
    u_hat = u + q ;
     
    alpha_times_uhat = alpha * u_hat;                                      
%
%  Update the approximate solution.
%
     x = x + alpha_times_uhat;
%
%  Set the residual.
%
     r = r - A * alpha_times_uhat;
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
