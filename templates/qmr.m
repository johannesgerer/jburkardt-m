function [ x, error_norm, iter, flag ] = qmr ( A, x, b, M, max_it, tol )

%*****************************************************************************80
%
%% QMR usess the Quasi Minimal Residual Method with no preconditioning.
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
%    -1 = breakdown caused by RHO;
%    -2 = breakdown caused by BETA;
%    -3 = breakdown caused by GAMMA;
%    -4 = breakdown caused by DELTA;
%    -5 = breakdown caused by EP;
%    -6 = breakdown caused by XI;
%
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
    flag = 0;
    return
  end

  flag = 1;

  v_tld = r;
  y = v_tld;
  rho = norm ( y );

  w_tld = r;
  z = w_tld;
  xi = norm ( z );

  gamma = 1.0;
  eta = -1.0;
  theta =  0.0;

  for iter = 1 : max_it

    if ( rho == 0.0 )
      flag = -1;
      break
    end

    if ( xi == 0.0 )
      flag = -6;
      break
    end

    v = v_tld / rho;
    y = y / rho;

    w = w_tld / xi;
    z = z / xi;

    delta = z' * y;

    if ( delta == 0.0 )
      flag = -4;
      break
    end

    y_tld = y;
    z_tld = z;
%
%  Compute the direction vector.
%
    if ( 1 < iter )
      p = y_tld - ( xi * delta / ep ) * p;
      q = z_tld - ( rho * delta / ep ) * q;
    else
      p = y_tld;
      q = z_tld;
    end

    p_tld = A * p;
    ep = q' * p_tld;

    if ( ep == 0.0 )
      flag = -5;
      break
    end

    beta = ep / delta;

    if ( beta == 0.0 )
      flag = -2;
      break
    end

    v_tld = p_tld - beta * v;
    y = v_tld;
    rho_1 = rho;
    rho = norm ( y );
                
    w_tld = ( A' * q ) - ( beta * w );
    z = w_tld;
    xi = norm ( z );
    gamma_1 = gamma;
    theta_1 = theta;

    theta = rho / ( gamma_1 * beta );
    gamma = 1.0 / sqrt ( 1.0 + theta^2 );

    if ( gamma == 0.0 )
      flag = -3;
      break
    end

    eta = -eta * rho_1 * gamma^2 / ( beta * gamma_1^2 );

    if ( 1 < iter )
      d = eta * p + ( ( theta_1 * gamma )^2 ) * d;
      s = eta * p_tld + ( ( theta_1 * gamma )^2 ) * s;
    else
      d = eta * p;
      s = eta * p_tld;
    end
%
%  Update the approximate solution.
%
    x = x + d;
    r = r - s;

    error_norm = norm ( r ) / bnrm2;
    errorhist(iter+1) = error_norm;

    if ( error_norm <= tol )
      flag = 0;
      break
    end

  end

  error_norm = errorhist;

  return
end
