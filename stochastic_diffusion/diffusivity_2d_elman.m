function dc = diffusivity_2d_elman ( a, b, dc0, omega, x )

%*****************************************************************************80
%
%% DIFFUSIVITY_2D_ELMAN evaluates a 2D stochastic diffusivity function.
%
%  Discussion:
%
%    The 2D diffusion equation has the form
%
%      - Del ( DC(X,Y) Del U(X,Y) ) = F(X,Y)
%
%    where DC(X,Y) is a function called the diffusivity.
%
%    In the stochastic version of the problem, the diffusivity function
%    includes the influence of stochastic parameters:
%
%      - Del ( DC(X,Y;OMEGA) Del U(X,Y;OMEGA) ) = F(X,Y).
%
%    In this function, the domain is assumed to be the square [-A,+A]x[-A,+A].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Elman, Darran Furnaval,
%    Solving the stochastic steady-state diffusion problem using multigrid,
%    IMA Journal on Numerical Analysis,
%    Volume 27, Number 4, 2007, pages 675-688.
%
%    Roger Ghanem, Pol Spanos,
%    Stochastic Finite Elements: A Spectral Approach,
%    Revised Edition,
%    Dover, 2003,
%    ISBN: 0486428184,
%    LC: TA347.F5.G56.
%
%  Parameters:
%
%    Input, real A, the "radius" of the square region.  The region
%    is assumed to be [-A,+A]x[-A,+A].
%    0 < A.
%
%    Input, real B, the correlation length.
%    0 < B.
%
%    Input, real DC0, the constant term in the expansion of the 
%    diffusion coefficient.  Take DC0 = 10.
%
%    Input, real OMEGA(M), the stochastic parameters.
%
%    Input, real X(2), the point where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real DC, the value of the diffusion coefficient at X.
%
  m = length ( omega );
%
%  Compute THETA.
%
  theta = theta_solve ( a, b, m );
%
%  Compute LAMBDA_1D.
%
  for k = 1 : m_1d
    lambda_1d(k) = 2.0 * b / ( 1.0 + b^2 * theta(k)^2 );
  end
%
%  Compute C_1D.
%
  k = 0;
  while ( 1 )
    if ( m_1d <= k )
      break
    end
    k = k + 1;
    c_1d(k,1) = cos ( theta_1d(k) * a * x(1) ) ...
      / sqrt ( a + sin ( 2 * theta(k) * a ) / ( 2 * theta(k) ) );
    c_1d(k,2) = cos ( theta_1d(k) * a * x(2) ) ...
      / sqrt ( a + sin ( 2 * theta(k) * a ) / ( 2 * theta(k) ) );
    if ( m_1d <= k )
      break
    end
    k = k + 1;
    c_1d(k,1) = sin ( theta_1d(k) * a * x(1) ) ...
      / sqrt ( a - sin ( 2 * theta(k) * a ) / ( 2 * theta(k) ) );
    c_1d(k,2) = sin ( theta_1d(k) * a * x(2) ) ...
      / sqrt ( a - sin ( 2 * theta(k) * a ) / ( 2 * theta(k) ) );
  end
%
%  Evaluate the diffusion coefficient at (X,Y):
%
  dc = dc0;
  for i = 1 : m_1d
    for j = 1 : m_1d
      k = k + 1;
      dc = dc + sqrt ( lambda_1d(i) * lambda_1d(j) ) * c_1d(i,1) * c_1d(j,2) * omega(k);
    end
  end

  return
end
function theta = theta_solve ( a, b, m )

%*****************************************************************************80
%
%% THETA_SOLVE solves a pair of transcendental equations.
%
%  Discussion:
%
%    The vector THETA returned by this function is needed in order to define
%    the terms in a Karhunen-Loeve expansion of a diffusion coefficient.
%
%    The two equations are:
%
%      1/B - THETA * TAN ( A * THETA ) = 0
%      THETA - 1/B * TAN ( A * THETA ) = 0
%
%    A and B are taken to be positive.  Over each open interval 
%
%      ( n - 1/2 pi, n + 1/2 pi ) / A, 
%
%    the function TAN ( A * THETA ) monotonically rises from -oo to +00; 
%    therefore, it can be shown that there is one root of each equation 
%    in every interval of this form.  Moreover, because of the positivity
%    of A and B, we can restrict our search to the interval 
%
%      [ n pi, n + 1/2 pi ) / A.
%
%    This function computes K such roots, starting in the first interval,
%    finding those two roots, moving to the next interval, and so on, until
%    the requested number of roots have been found.  Odd index roots will
%    correspond to the first equation, and even index roots to the second.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Howard Elman, Darran Furnival,
%    Solving the Stochastic Steady-State Diffusion Problem Using Multigrid,
%    University of Maryland Department of Computer Science,
%    Technical Report TR-4786.
%
%  Parameters:
%
%    Input, real A, the "radius" of the domain, D = (-A,A)x(-A,A).
%    0 < A.
%
%    Input, real B, the correlation length.
%    0 < B.
%
%    Input, integer M, the number of values to compute.
%
%    Output, real THETA(M), the values of Theta.
%
  k = 0;
  theta = zeros(m,1);
%
%  [ XA_INIT, XB_INIT] = [ n * pi, n+1/2 pi ] / a, n = 0, 1, 2, ...
%
  xa_init = 0;
  xb_init = ( pi / 2 ) / a;

  while ( 1 )
%
%  Seek root of equation 1 in interval.
%
    if ( m <= k )
      break
    end

    k = k + 1;
    xa = xa_init;
    fa = 1 / b - xa * tan ( a * xa );
    ftol = eps * ( abs ( fa ) + 1.0 );
    xb = xb_init;
    fb = - fa;
    fc = fa;
    bmatol = 100.0 * eps * ( xb );

    while ( bmatol < xb - xa )

      xc = ( xa + xb ) / 2;
      fc = 1 / b - xc * tan ( a * xc );

      if ( abs ( fc ) <= ftol )
        break
      elseif ( 0 < fc )
        xa = xc;
      else
        xb = xc;
      end

    end

    theta(k) = xc;

    fprintf ( 1, '  xc = %f, fc = %e\n', xc, fc );
%
%  Seek root of equation 2 in interval.
%
    if ( m <= k )
      break
    end

    k = k + 1;
%
%  Special case in first interval.
%
    if ( k == 2 )
      xc = 0.0;
      fc = 0.0;
    else
      xa = xa_init;
      fa = xa - tan ( a * xa ) / b;
      ftol = eps * ( abs ( fa ) + 1.0 );
      xb = xb_init;
      fb = - fa;

      while ( bmatol < xb - xa )

        xc = ( xa + xb ) / 2;
        fc = xc - tan ( a * xc ) / b;

        if ( abs ( fc ) <= ftol )
          break
        elseif ( 0 < fc )
          xa = xc;
        else
          xb = xc;
        end

      end

    end

    theta(k) = xc;
    fprintf ( 1, '  xc = %f, fc = %e\n', xc, fc );
%
%  Advance the interval.
%
    xa_init = xa_init + pi/a;
    xb_init = xb_init + pi/a;

  end

  return
end
