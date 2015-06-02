function feynman_kac_1d ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEYNMAN_KAC_1D.
%
%  Discussion:
%
%    This program is derived from section 2.5, exercise 2.2 of Petersen 
%    and Arbenz.
%
%    The problem is to determine the solution U(X) of the following 
%    partial differential equation:
%
%      (1/2) Laplacian U - V(X) * U = 0,
%
%    inside the 1d interval D:
% 
%      D = { (X) | (X/A)^2 <= 1 }
%   
%    with the boundary condition U(boundary(D)) = 1.
%
%    V(X) is the potential function:
%
%      V = 2 * ( (X/A^2)^2 + 1/A^2.
%
%    The analytic solution of this problem is already known:
%
%      U(X) = exp ( (X/A)^2 - 1 ).
%
%    Our method is via the Feynman-Kac Formula.
%
%    The idea is to start from any x in D, and
%    compute x+Wx(t) where 1D Brownian motion
%    Wx is updated each step by sqrt(h)*z1,
%    each z1 is a Gaussian 
%    random variable with zero mean and variance 1. 
%
%    Each x1(t) is advanced until x1 exits the domain D.  
%
%    Upon its first exit from D, the sample path x1 is stopped and a 
%    new sample path at x is started until N such paths are completed.
% 
%    The Feynman-Kac formula gives the solution here as
%
%      U(X) = (1/N) sum(1 <= I <= N) Y(tau_i),
%
%    where
%
%      Y(tau) = exp( -int(s=0..tau) v(x1(s)) ds),
%
%    and tau = first exit time for path (x1). 
%
%    The integration procedure is a second order weak accurate method:
%
%      X(t+h)  = x1(t) + sqrt ( h ) * z
%
%    Here Z is an approximately normal univariate Gaussian. 
%
%    An Euler predictor approximates Y at the end of the step
%
%      Y_e     = (1 - h*v(X(t)) * Y(t), 
%
%    A trapezoidal rule completes the step:
%
%      Y(t+h)  = Y(t) - (h/2)*[v(X(t+h))*Y_e + v(X(t))*Y(t)].
%
%    Thank you to Arno Petri for pointing out that this program will run
%    much faster if the MATLAB random number generator rand() is called,
%    and also for asking why the randn() generator should not be used,
%    and for trying to do so and noting that randn() seems to give less
%    accurate results for this problem, 30 July 2012.
%
%    Note that the use of explicit "return" statements in this file
%    seems to result in a large and pointless overhead.  Commenting out
%    the return statements makes the program run a lot faster.  It
%    seems like black magic.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    Original C 3D version by Wesley Petersen.
%    MATLAB 1D version by John Burkardt.
%
%  Reference:
%
%    Peter Arbenz, Wesley Petersen,
%    Introduction to Parallel Computing:
%    A Practical Guide with Examples in C,
%    Oxford, 2004,
%    ISBN: 0-19-851577-4,
%    LC: QA76.59.P47.
%
  GENERATOR = 0;

  a = 2.0;
%
%  We want to use H = 0.0001!
%  However, we will use H = 0.01 for now, because this MATLAB version
%  of the code does not run very fast.
%
  if ( 0 )
    h = 0.0001;
  else
    h = 0.01;
  end
%
%  We want to use N = 10,000!
%  We could reduce this value as well, to get the code to run faster.
%  However, a large N seems to help the accuracy more than a small H does.
%
  n = 10000;
  
  if ( GENERATOR == 0 )
    rand ( 'state', 0 );
  elseif ( GENERATOR == 1 )
    rand ( 'state', 0 );
  else
    seed = 123456789;
  end

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEYNMAN_KAC_1D:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Program parameters:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The calculation takes place inside an interval.\n' );
  fprintf ( 1, '  The solution will be estimated at NG points\n' );
  fprintf ( 1, '  on a regular spaced grid within the interval.\n' );
  fprintf ( 1, '  Each solution will be estimated by computing %d trajectories\n', n );
  fprintf ( 1, '  from the point to the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (X/A)^2 = 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The interval parameter A is:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A = %g\n', a );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Path stepsize H = %g\n', h );
  if ( GENERATOR == 0 )
    fprintf ( 1, '  The random number generator being used is rand().\n' );
  elseif ( GENERATOR == 1 )
    fprintf ( 1, '  The random number generator being used is randn().\n' );
  else
    fprintf ( 1, '  The random number generator being used is r8_uniform_01().\n' );
  end

%
%  Choose the spacing so we have about ni points on or in the interval.
%
  ni = 21;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X coordinate discretized by %d points\n', ni + 2 );
%
%  RTH is the scaled stepsize.
%
  rth = sqrt ( h );

  err = 0.0;
%
%  Loop over the points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     K       X           W exact' );
  fprintf ( 1, '      W Approx        Error      Ave Steps  Test\n' );
  fprintf ( 1, '\n' );

  tic;
  k = 0;
  n_int = 0;

  for i = 0 : ni + 1

    x = ( ( ni - i     ) * ( - a ) ...
        + (      i - 1 ) *     a ) ...
        / ( ni     - 1 );

    k = k + 1;

    test = a * a - x * x;

    if ( test < 0.0  )
      w_exact = 1.0;
      wt = 1.0;
      steps_ave = 0;
      fprintf ( 1, '  %4d  %4d  %12g  %12g  %12g  %12g  %8d  %8g\n', ...
        i, k, x, w_exact, wt, abs ( w_exact - wt ), steps_ave, test );
      continue
    end

    n_int = n_int + 1;
%
%  Compute the exact solution at this point (x,y,z).
%
    w_exact = exp ( ( x / a )^2 - 1.0 );
%
%  Now try to estimate the solution at this point.
%
    wt = 0.0;
    steps = 0;

    for it = 1 : n

      x1 = x;
% 
%  W = exp(-int(s=0..t) v(X)ds) 
%
      w = 1.0;
%
%  CHK is < 1.0 while the point is inside the interval.
%
      chk = 0.0;

      while ( chk < 1.0 )
%
%  Determine DX.
%
        if ( GENERATOR == 0 )
          us = rand ( );
        elseif ( GENERATOR == 1 )
          us = randn ( );
        else
          [ us, seed ] = r8_uniform_01 ( seed );
       end 

        us = us - 0.5;

        if ( us < 0.0 )
          dx = - rth;
        else
          dx = + rth;
        end

        vs = potential ( a, x1 );
%
%  Move to the new point.
%
        x1 = x1 + dx;

        steps = steps + 1;

        vh = potential ( a, x1 );

        we = ( 1.0 - h * vs ) * w;
        w = w - 0.5 * h * ( vh * we + vs * w );

        chk = ( x1 / a )^2;

      end

      wt = wt + w;

    end
%
%  WT is the average of the sum of the different trials.
%
    wt = wt / n;
    steps_ave = floor ( steps / n );
%
%  Add error in WT to the running L2 error in the solution.
%
    err = err + ( w_exact - wt )^2;

    fprintf ( 1, '  %4d  %4d  %12g  %12g  %12g  %12g  %8d  %8g\n', ...
      i, k, x, w_exact, wt, abs ( w_exact - wt ), steps_ave, test );

  end

  toc
%
%  Compute the RMS error for all the points.
%
  err = sqrt ( err / n_int );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS absolute error in solution = %g\n', err );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEYNMAN_KAC_1D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

%  return
end
function v = potential ( a, x )

%*****************************************************************************80
%
%% POTENTIAL evaluates the potential function V(X,).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameters that define the ellipse.
%
%    Input, real X, the coordinates of the point.
%
%    Output, real V, the value of the potential function at X.
%
  v = 2.0 * ( x / a / a )^2 + 1.0 / a / a;

%  return
end
function [ r, seed ] = r8_uniform_01 ( seed )

%*****************************************************************************80
%
%% R8_UNIFORM_01 returns a unit pseudorandom R8.
%
%  Discussion:
%
%    This routine implements the recursion
%
%      seed = 16807 * seed mod ( 2^31 - 1 )
%      r8_uniform_01 = seed / ( 2^31 - 1 )
%
%    The integer arithmetic never requires more than 32 bits,
%    including a sign bit.
%
%    If the initial seed is 12345, then the first three computations are
%
%      Input     Output      R8_UNIFORM_01
%      SEED      SEED
%
%         12345   207482415  0.096616
%     207482415  1790989824  0.833995
%    1790989824  2035175616  0.947702
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Springer Verlag, pages 201-202, 1983.
%
%    Pierre LEcuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley Interscience, page 95, 1998.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, pages 136-143, 1969.
%
%  Parameters:
%
%    Input, integer SEED, the integer "seed" used to generate
%    the output random number.  SEED should not be 0.
%
%    Output, real R, a random value between 0 and 1.
%
%    Output, integer SEED, the updated seed.  This would
%    normally be used as the input seed on the next call.
%
  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM_01 - Fatal error!' );
  end

  seed = floor ( seed );

  seed = mod ( seed, 2147483647 );

  if ( seed < 0 ) 
    seed = seed + 2147483647;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + 2147483647;
  end

  r = seed * 4.656612875E-10;

%  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

%  return
end
