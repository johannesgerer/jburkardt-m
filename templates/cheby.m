function [ x, error_norm, iter, flag ] = cheby ( A, x, b, M, max_it, tol )

%*****************************************************************************80
%
%% CHEBY applies the Chebyshev iteration to the SPD system A*x=b.
%
%  Discussion:
%
%    We can't use ALPHA for a variable, apparently, because there is
%    a MATLAB function (for the alpha channel of graphics images)
%    that is claiming it!
%
%  Modified:
%
%    27 March 2005
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
%    Input, real M, the preconditioner matrix.
%    Set M to the identity matrix for no preconditioning.
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

  eigs = eig ( inv ( M ) * A );
  eigmax = max ( eigs );
  eigmin = min ( eigs );

  c = ( eigmax - eigmin ) / 2.0;
  d = ( eigmax + eigmin ) / 2.0;

  for iter = 1 : max_it

    z =  M \ r;
%
%  Compute direction vectors.
%
    if ( 1 < iter )
      beta = ( c * aleph / 2.0 )^2;
      aleph = 1.0 / ( d - beta );
      p = z + beta * p;
    else
      p = z;
      aleph = 2.0 / d;
    end
%
%  Update the approximate solution.
%
    x  = x + aleph * p;

    r = r - aleph * A * p;
    error_norm = norm ( r ) / bnrm2;
    errorhist(iter+1) = error_norm;

    if ( error_norm <= tol  )
      break 
    end

  end

  if ( tol < error_norm ) 
    flag = 1;
  end

  error_norm = errorhist;

  return
end
