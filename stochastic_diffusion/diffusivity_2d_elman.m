function dc = diffusivity_2d_elman ( a, cl, dc0, m_1d, omega, n1, n2, x, y )

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
%    Input, real CL, the correlation length.
%    0 < CL.
%
%    Input, real DC0, the constant term in the expansion of the 
%    diffusion coefficient.  Take DC0 = 10.
%
%    Input, integr M_1D, the first and second dimensions of the stochastic
%    parameter array.
%
%    Input, real OMEGA(M_1D*M_1D), the stochastic parameters.
%
%    Input, integer N1, N2, the dimensions of the X and Y arrays.
%
%    Input, real X(N1,N2), Y(N1,N2), the points where the diffusion coefficient is to 
%    be evaluated.
%
%    Output, real DC(N1,N2), the value of the diffusion coefficient at X.
%

%
%  Compute THETA.
%
  theta_1d = theta_solve ( a, cl, m_1d );
%
% m = m_1d * m_1d;
% theta_1d = theta_solve ( a, cl, m );
%
%  Compute LAMBDA_1D.
%
  lambda_1d(1:m_1d) = 2.0 * cl ./ ( 1.0 + cl^2 * theta_1d(1:m_1d).^2 );
%
%  Compute C_1DX(1:M1D)  and C_1DY(1:M1D) at (X,Y).
%
  c_1dx = zeros ( m_1d, n1, n2 );
  c_1dy = zeros ( m_1d, n1, n2 );

  k = 0;

  while ( 1 )

    if ( m_1d <= k )
      break
    end

    k = k + 1;
    c_1dx(k,1:n1,1:n2) = cos ( theta_1d(k) * a * x(1:n1,1:n2) ) ...
      / sqrt ( a + sin ( 2.0 * theta_1d(k) * a ) / ( 2.0 * theta_1d(k) ) );
    c_1dy(k,1:n1,1:n2) = cos ( theta_1d(k) * a * y(1:n1,1:n2) ) ...
      / sqrt ( a + sin ( 2.0 * theta_1d(k) * a ) / ( 2.0 * theta_1d(k) ) );

    if ( m_1d <= k )
      break
    end

    k = k + 1;
    c_1dx(k,1:n1,1:n2) = sin ( theta_1d(k) * a * x(1:n1,1:n2) ) ...
      / sqrt ( a - sin ( 2.0 * theta_1d(k) * a ) / ( 2.0 * theta_1d(k) ) );
    c_1dy(k,1:n1,1:n2) = sin ( theta_1d(k) * a * y(1:n1,1:n2) ) ...
      / sqrt ( a - sin ( 2.0 * theta_1d(k) * a ) / ( 2.0 * theta_1d(k) ) );

  end
%
%  Evaluate the diffusion coefficient DC at (X,Y).
%  This nonsense of fussy array shapes really frustrates me!
%
  k = 0;
  dc = dc0 * ones ( 1, n1, n2 );
  for j = 1 : m_1d
    for i = 1 : m_1d
      k = k + 1;
      dc(1,1:n1,1:n2) = dc(1,1:n1,1:n2) + sqrt ( lambda_1d(i) * lambda_1d(j) ) ...
        * c_1dx(i,1:n1,1:n2) .* c_1dy(j,1:n1,1:n2) * omega(k);
    end
  end

  dc = reshape ( dc, n1, n2 );

  return
end
function theta = theta_solve ( a, cl, m )

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
%      1/CL - THETA * TAN ( A * THETA ) = 0
%      THETA - 1/CL * TAN ( A * THETA ) = 0
%
%    A and CL are taken to be positive.  Over each open interval 
%
%      ( n - 1/2 pi, n + 1/2 pi ) / A, for N = 0, 1, ...
%
%    the function TAN ( A * THETA ) monotonically rises from -oo to +00; 
%    therefore, it can be shown that there is one root of each equation 
%    in every interval of this form.  Moreover, because of the positivity
%    of A and CL, we can restrict our search to the interval 
%
%      [ n pi, n + 1/2 pi ) / A, for N = 0, 1, ...
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
%    20 July 2013
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
%    Input, real CL, the correlation length.
%    0 < CL.
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
  xa_init = 0.0;
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
    fa = 1.0 / cl - xa * tan ( a * xa );
    ftol = eps * ( abs ( fa ) + 1.0 );
    xb = xb_init;
    fb = - fa;
    fc = fa;
    bmatol = 100.0 * eps * ( abs ( xa ) + abs ( xb ) );

    while ( bmatol < xb - xa )

      xc = ( xa + xb ) / 2;
      fc = 1.0 / cl - xc * tan ( a * xc );

      if ( abs ( fc ) <= ftol )
        break
      elseif ( 0 < fc )
        xa = xc;
      else
        xb = xc;
      end

    end

    theta(k) = xc;
%
%  Seek root of equation 2 in interval.
%
    if ( m <= k )
      break
    end

    k = k + 1;
%
%  In the first interval, we need to skip the zero root of equation 2.
%
    if ( k == 2 )

      k = k - 1;

    else

      xa = xa_init;
      fa = xa - tan ( a * xa ) / cl;
      ftol = eps * ( abs ( fa ) + 1.0 );
      xb = xb_init;
      fb = - fa;

      while ( bmatol < xb - xa )

        xc = ( xa + xb ) / 2;
        fc = xc - tan ( a * xc ) / cl;

        if ( abs ( fc ) <= ftol )
          break
        elseif ( 0 < fc )
          xa = xc;
        else
          xb = xc;
        end

      end

      theta(k) = xc;

    end
%
%  Advance the interval.
%
    xa_init = xa_init + pi / a;
    xb_init = xb_init + pi / a;

  end

  return
end
