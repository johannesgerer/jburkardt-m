function [ x, error_norm, iter, flag ] = bicgstab ( A, x, b, M, max_it, tol )

%*****************************************************************************80
%
%% BICGSTAB solves a linear system using the biconjugate gradient stabilized method.
%
%  Discussion:
%
%    No preconditioning is used.
%
%    MATLAB has brazenly appropriated the name "ALPHA" for a graphics
%    function, so we had to rename a variable.
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
%    -1, the method broke down with RHO = 0.
%    -2, the method broke down with OMEGA = 0.
%
  iter = 0;

  bnrm2 = norm( b );
  if ( bnrm2 == 0.0 )
    bnrm2 = 1.0; 
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

  omega  = 1.0;
  r_tld = r;

  for iter = 1 : max_it

    rho = r_tld' * r;

    if ( rho == 0.0 ) 
      flag = -1;
      break 
    end

    if ( 1 < iter )
      beta  = ( rho / rho_1 ) * ( aleph / omega );
      p = r + beta * ( p - omega * v );
    else
      p = r;
    end

    p_hat = p;
    v = A * p_hat;
    aleph = rho / ( r_tld' * v );
    s = r - aleph * v;
%
%  Early convergence check.
%
    if ( norm ( s ) < tol )

      flag = 0;

      x = x + aleph * p_hat;
      resid = norm( s ) / bnrm2;

      error_norm = norm ( s ) / bnrm2;
      errorhist(iter+1) = error_norm;

      break;

    end

    s_hat = s;
    t = A * s_hat;
    omega = ( t' * s ) / ( t'*t );
%
%  Update the approximate solution.
%
    x = x + aleph * p_hat + omega * s_hat;

    r = s - omega * t;
    error_norm = norm ( r ) / bnrm2;
    errorhist(iter+1) = error_norm;

    if ( error_norm <= tol )
      flag = 0;
      break
    end

    if ( omega == 0.0 )
      flag = -2;
      break
    end

    rho_1 = rho;

  end

  error_norm = errorhist;

  return
end
