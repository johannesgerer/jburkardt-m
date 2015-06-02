function [ x, error_norm, iter, flag ] = cg ( A, x, b, M, max_it, tol )

%*****************************************************************************80
%
%% CG solves a linear system using the conjugate gradient method.
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
%    June Donato, Jack Dongarra, Victor Eijkhout, Roidan Pozo,
%    Charles Romine, Henk van der Vorst
%    Templates for the Solution of Linear Systems: Building Blocks for 
%    Iterative Methods, 
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
%
  flag = 0;
  iter = 0;

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

  for iter = 1 : max_it

    z = r;
    rho = ( r' * z );
%
%  Compute P, the direction vector.
%
    if ( 1 < iter )
      beta = rho / rho_1;
      p = z + beta * p;
    else
      p = z;
    end

    q = A * p;
    alpha = rho / ( p' * q );
%
%  Update the approximate solution.
%
    x = x + alpha * p;
%
%  Compute the residual.
%
    r = r - alpha * q;
    error_norm = norm ( r ) / bnrm2;
    errorhist(iter+1) = error_norm;

    if ( error_norm <= tol )
      break
    end

    rho_1 = rho;

  end

  if ( tol < error_norm ) 
    flag = 1;
  end

  error_norm = errorhist;

  return
end
