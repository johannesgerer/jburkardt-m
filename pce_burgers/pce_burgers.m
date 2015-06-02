function pce_burgers ( )

%*****************************************************************************80
%
%% PCE_BURGERS applies the polynomial chaos expansion to the Burgers equation.
%
%  Discussion:
%
%    The time-dependent viscous Burgers equation to be solved is:
%
%      du/dt = - d ( u*(1/2-u)) /dx + nu d2u/dx2
%
%    with boundary conditions
%
%      u(-3.0) = 0.0, u(+3.0) = 1.0.
%
%    The viscosity nu is assumed to be an uncertain quantity with
%    normal distribution of known mean and variance.
%
%    A polynomial chaos expansion is to be used, with Hermite polynomial
%    basis functions h(i,x), 0 <= i <= n.
%
%    Because the first two Hermite polynomials are simply 1 and x, 
%    we have that 
%
%      nu = nu_mean * h(0,x) + nu_variance * h(1,x).
%
%    We replace the time derivative by an explicit Euler approximation,
%    so that the equation now describes the value of U(x,t+dt) in terms
%    of known data at time t.
%
%    Now assume that the solution U(x,t) can be approximated
%    by the truncated expansion:
%
%      U(x,t) = sum ( 0 <= i <= n ) c(i,t) * h(i,x)
%
%    In the equation, we replace U by its expansion, and then multiply
%    successively by each of the basis functions h(*,x) to get a set of
%    n+1 equations that can be used to determine the values of c(i,t+dt).
%
%    This process is repeated until the desired final time is reached.
%
%    At any time, the coefficients c(0,t) contain information definining
%    the expected value of u(x,t) at that time, while the higher order coefficients
%    can be used to deterimine higher moments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2012
%
%  Author:
%
%    Original FORTRAN90 version by Gianluca Iaccarino.
%    This MATLAB version is by John Burkardt.
%
%  Local parameters:
%
%    Local, real DT, the timestep.
%
%    Local, real DX, the spacing between grid points.
%
%    Local, integer N, the number of intervals in the spatial domain.
%
%    Local, real NUMEAN, the mean of viscosity.
%
%    Local, real NUVARIANCE, the variance of viscosity.
%
%    Local, integer P, the order of the PC expansion.
%
%    Local, real T, the current time.
%
%    Local, real TF, the final integration time.
%
%    Local, real U1(N+1,P+1), the PCE representation at the current time.
%
%    Local, real U2(N+1,P+1), the PCE representation for the next time.
%
%    Local, real X(N+1,1), the grid points.
%
  p = 5;
  n = 32;
  nt = 2000;
  ti = 0.0;
  tf = 2.0;
  dt = ( tf - ti ) / nt;
  numean = 0.25;
  nuvariance = 0.08;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PCE_BURGERS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Polynomial Chaos Expansion\n' );
  fprintf ( 1, '  1D Burgers equation\n' );
  fprintf ( 1, '  Original version by Gianluca Iaccarino\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PCE order       = %d\n', p );
  fprintf ( 1, '  Number of cells = %d\n', n );
  fprintf ( 1, '  Time step       = %g\n', dt );
  fprintf ( 1, '  Initial time    = %g\n', ti );
  fprintf ( 1, '  Final time      = %g\n', tf );
  fprintf ( 1, '  Viscosity Mean  = %g\n', numean );
  fprintf ( 1, '  Viscosity Var   = %g\n', nuvariance );
  fprintf ( 1, '\n' );
%
%  Define some numerical parameters.
%
  dx = 6.0 / n;
  conv = dt / ( 2.0 * dx );

  visc = zeros ( p + 1, 1 );
  visc(1) = numean * dt / ( dx * dx );
  visc(2) = nuvariance * dt / ( dx * dx );
%
%  Define a uniform grid.
%
  x = ( linspace ( - 3.0, + 3.0, n + 1 ) )';
%
%  Set the initial conditions.
%
  u1 = zeros ( n + 1, p + 1 );
  u1(1:n+1,1) = 0.5 + x(1:n+1,1) / 6.0;

  u2 = zeros ( n + 1, p + 1 );
%
%  Time integration.
%
  t1 = ti;
%
%  Write the current solution.
%
  output_filename = 'burgers.history.txt';
  output_unit = fopen ( output_filename, 'wt' );
  fprintf ( output_unit, '----------\n' );
  fprintf ( output_unit, 'T = %g\n', t1 );
  for i = 1 : n + 1
    fprintf ( output_unit, '  %10g', x(i) );
    for k = 1 : p + 1
      fprintf ( output_unit, '  %10g', u1(i,k) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Time integration.
%
  for it = 1 : nt

    t2 = ( ( nt - it ) * ti   ...
         + (      it ) * tf ) ...
         / ( nt      );
%
%  Boundary conditions.
%
    u2(1,1:p+1) = 0.0;
    u2(n+1,1) = 1.0;
    u2(n+1,2:p+1) = 0.0;

    for k = 1 : p + 1

      dp = he_double_product_integral ( k - 1, k - 1 );

      for ix = 2 : n
%
%  Viscous term.
%
        term1 = visc(1) * ( u1(ix+1,k) - 2.0 * u1(ix,k) + u1(ix-1,k) );
        i = 2;
        for j = 1 : p + 1
          tp = he_triple_product_integral ( i - 1, j - 1, k - 1 );
          term1 = term1 + visc(i) * ( u1(ix+1,j) - 2.0 * u1(ix,j) + u1(ix-1,j) ) * tp / dp;
        end
%
%  Convective term.
%
        term2 = - conv * 0.5 * ( u1(ix+1,k) - u1(ix-1,k) );
        for j = 1 : p + 1
          for i = 1 : p + 1
            tp = he_triple_product_integral ( i - 1, j - 1, k - 1 );
            term2 = term2 + ( conv * u1(ix,i) * ( u1(ix+1,j) - u1(ix-1,j) ) * tp ) / dp;
          end
        end

        u2(ix,k) = u1(ix,k) + term1 + term2;

      end

    end

    t1 = t2;
    u1(1:n+1,1:p+1) = u2(1:n+1,1:p+1);
%
%  Print solution every 100 time steps.
%
    if ( mod ( it, 100 ) == 0 )
      fprintf ( output_unit, '----------\n' );
      fprintf ( output_unit, 'T = %g\n', t1 );
      for i = 1 : n + 1
        fprintf ( output_unit, '  %10g', x(i) );
        for k = 1 : p + 1
          fprintf ( output_unit, '  %10g', u1(i,k) );
        end
        fprintf ( output_unit, '\n' );
      end
    end

  end

  fclose ( output_unit );
  fprintf ( 1, '  Time history in "%s".\n', output_filename );
%
%  Compute the mean and variance.
%
  umean(1:n+1,1) = u1(1:n+1,1);

  uvariance = zeros ( n + 1, 1 );

  for i = 1 : n + 1
    for j = 2 : p + 1
      dp = he_double_product_integral ( j - 1, j - 1 );
      uvariance(i) = uvariance(i) + u1(i,j).^2 * dp;
    end
  end
%
%  Save the solution at the final time.
%
  output_filename = 'burgers.moments.txt';
  output_unit = fopen ( output_filename, 'wt' );
  fprintf ( output_unit, ' X E[U] Var[U]\n' );
  for i = 1 : n + 1
    fprintf ( output_unit, '  %18.8g  %18.8g  %18.8g\n', ...
      x(i), umean(i), uvariance(i) );
  end
  fclose ( output_unit );
  fprintf ( 1, '  Moments in "%s".\n', output_filename );

  output_filename = 'burgers.modes.txt';
  output_unit = fopen ( output_filename, 'wt' );
  fprintf ( output_unit, ' X U_0 ... U_P \n' );
  for i = 1 : n + 1
    fprintf ( output_unit, '  %10g', x(i) );
    for k = 1 : p + 1
      fprintf ( output_unit, '  %10g', u1(i,k) );
    end
    fprintf ( output_unit, '\n' );
  end
  fclose ( output_unit );
  fprintf ( 1, '  Final modes in "%s".\n', output_filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PCE_BURGERS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
