function feynman_kac_2d ( )

%*****************************************************************************80
%
%% MAIN is the main program for FEYNMAN_KAC_2D.
%
%  Discussion:
%
%    This program is derived from section 2.5, exercise 2.2 of Petersen and Arbenz.
%
%    The problem is to determine the solution U(X,Y) of the following
%    partial differential equation:
%
%      (1/2) Laplacian U - V(X,Y) * U = 0,
%
%    inside the elliptic domain D:
%
%      D = { (X,Y) | (X/A)^2+(Y/B)^2 <= 1 }
%
%    with the boundary condition U(boundary(D)) = 1.
%
%    The V(X,Y) is the potential function:
%
%      V = 2 * ( (X/A^2)^2 + (Y/B^2)^2 ) + 1/A^2 + 1/B^2.
%
%    The analytic solution of this problem is already known:
%
%      U(X,Y) = exp ( (X/A)^2 + (Y/B)^2 - 1 ).
%
%    Our method is via the Feynman-Kac Formula.
%
%    The idea is to start from any (x,y) in D, and
%    compute (x+Wx(t),y+Wy(t)) where 3-D Brownian motion
%    (Wx,Wy) is updated each step by sqrt(h)*(z1,z2),
%    each z1,z2 are independent approximately Gaussian
%    random variables with zero mean and variance 1.
%
%    Each (x1(t),x2(t)) is advanced until (x1,x2) exits the domain D.
%
%    Upon its first exit from D, the sample path (x1,x2) is stopped and a
%    new sample path at (x,y) is started until N such paths are completed.
%
%    The Feynman-Kac formula gives the solution here as
%
%      U(X,Y) = (1/N) sum(1 <= I <= N) Y(tau_i),
%
%    where
%
%      Y(tau) = exp( -int(s=0..tau) v(x1(s),x2(s)) ds),
%
%    and tau = first exit time for path (x1,x2).
%
%    The integration procedure is a second order weak accurate method:
%
%      X(t+h)  = [ x1(t) + sqrt ( h ) * z1 ]
%                [ x2(t) + sqrt ( h ) * z2 ]
%
%    Here Z1, Z2 are approximately normal univariate Gaussians.
%
%    An Euler predictor approximates Y at the end of the step
%
%      Y_e     = (1 - h*v(X(t)) * Y(t),
%
%    A trapezoidal rule completes the step:
%
%      Y(t+h)  = Y(t) - (h/2)*[v(X(t+h))*Y_e + v(X(t))*Y(t)].
%
%    Grateful thanks to Arno Petri, who pointed out, on 30 July 2012, that
%    this program could be substantially speeded up by
%    * calling the system random number generator "rand()" instead of
%      r8_uniform_01();
%    * suppressing the "return" statements, which apparently result in
%      a massive amount of worthless overhead.
%
%    Further suggestions by Arno Petri included a more economical determination
%    of the random step (dx,dy) and the use of the explicit stochastic Euler scheme.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    Original C version by Wesley Petersen.
%    MATLAB version by John Burkardt.
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
%  Local parameters:
%
%    Local, int GENERATOR, chooses the random number generator.
%    0, use Matlab's rand() (faster);
%    nonzero, use r8_uniform_01() (portable).
%
  tic

  GENERATOR = 0;

  if ( GENERATOR == 0 )
    rand ( 'state', 0 )
  else
    seed = 123456789;
  end

  a = 2.0;
  b = 1.0;
  dim = 2;
  h = 0.001;
  n = 10000;

  timestamp ( )

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEYNMAN_KAC_2D:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Program parameters:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The calculation takes place inside a 2D ellipse.\n' );
  fprintf ( 1, '  A rectangular grid of points will be defined.\n' );
  fprintf ( 1, '  The solution will be estimated for those grid points\n' );
  fprintf ( 1, '  that lie inside the ellipse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '  Each solution will be estimated by computing %d trajectories\n', n );
  fprintf ( 1, '  from the point to the boundary.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    (X/A)^2 + (Y/B)^2 = 1\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The ellipse parameters A, B are set to:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    A = %f\n', a );
  fprintf ( 1, '    B = %f\n', b );
  fprintf ( 1, '  Stepsize H = %f\n', h );
%
%  RTH is the scaled stepsize.
%
  rth = sqrt ( dim * h );
%
%  Choose the spacing so we have about 10 points in the shorter direction.
%
  if ( a < b )
    ni = 6;
    nj = 1 + ceil ( b / a ) * ( ni - 1 );
  else
    nj = 6;
    ni = 1 + ceil ( a / b ) * ( nj - 1 );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X coordinate marked by %d points\n', ni );
  fprintf ( 1, '  Y coordinate marked by %d points\n', nj );
%
%  Loop over the grid points.
%
  err = 0.0;
  n_inside = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '        X             Y             W             W             Error    Average\n' );
  fprintf ( 1, ...
    '                                    approx        exact                    Steps\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ni

    x = ( ( ni - i     ) * ( - a ) ...
        + (      i - 1 ) *     a ) ...
        / ( ni     - 1 );

    for j = 1 : nj

      y = ( ( nj - j     ) * ( - b ) ...
          + (      j - 1 ) *     b ) ...
          / ( nj     - 1 );

      chk = ( x / a )^2 + ( y / b )^2;

      if ( 1.0 < chk )
        w_exact = 1.0;
        wt = 1.0;
        steps_ave = 0;
        fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f  %8d\n', ...
          x, y, wt, w_exact, abs ( w_exact - wt ), steps_ave );
        continue;
      end

      n_inside = n_inside + 1;
%
%  Compute the exact solution at this point (x,y).
%
      w_exact = exp ( ( x / a )^2 + ( y / b )^2 - 1.0 );
%
%  Now try to estimate the solution at this point.
%
      wt = 0.0;
      steps = 0;

      for k = 1 : n

        x1 = x;
        x2 = y;
%
%  W = exp(-int(s=0..t) v(X)ds)
%
        w = 1.0;
%
%  CHK is < 1.0 while the point is inside the ellipsoid.
%
        chk = 0.0;

        while ( chk < 1.0 )
%
%  Determine DX, DY.
%
%  With the current parameters, if we uncomment the following statements,
%  the resulting test adds 10 seconds to a 75 second run!
%
%         if ( GENERATOR == 0 )
            ut = rand ( );
%         else
%           [ ut, seed ] = r8_uniform_01 ( seed );
%         end

          if ( ut < 0.25 )
            dx = - rth;
            dy = 0.0;
          elseif ( ut < 0.50 )
            dx = + rth;
            dy = 0.0;
          elseif ( ut < 0.75 )
            dx = 0.0;
            dy = - rth;
          else
            dx = 0.0;
            dy = + rth;
          end

          vs = potential ( a, b, x1, x2 );
%
%  Move to the new point.
%
          x1 = x1 + dx;
          x2 = x2 + dy;

          steps = steps + 1;
%
%  Use an explicit stochastic Euler scheme,
%  recommended by Arno Petri.
%
          w = w - vs * w * h;

%         vh = potential ( a, b, x1, x2 );
%         we = ( 1.0 - h * vs ) * w;
%         w = w - 0.5 * h * ( vh * we + vs * w );

          chk = ( x1 / a )^2 + ( x2 / b )^2;

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

      fprintf ( 1, '  %12f  %12f  %12f  %12f  %12f  %8d\n', ...
        x, y, wt, w_exact, abs ( w_exact - wt ), steps_ave );

    end
  end
%
%  Compute the RMS error for all the points.
%
  err = sqrt ( err / n_inside );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS absolute error in solution = %f\n', err );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEYNMAN_KAC_2D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );

  toc

  timestamp ( );

%  return
end
function v = potential ( a, b, x, y )

%*****************************************************************************80
%
%% POTENTIAL evaluates the potential function V(X,Y).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters that define the ellipse.
%
%    Input, real X, Y, the coordinates of the point.
%
%    Output, real V, the value of the potential function.
%
  v = 2.0 * ( ( x / a^2 )^2 + ( y / b^2 )^2 ) + 1.0 / a^2 + 1.0 / b^2;

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
%    21 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Bratley, Bennett Fox, Linus Schrage,
%    A Guide to Simulation,
%    Second Edition,
%    Springer, 1987,
%    ISBN: 0387964673,
%    LC: QA76.9.C65.B73.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, December 1986, pages 362-376.
%
%    Pierre L'Ecuyer,
%    Random Number Generation,
%    in Handbook of Simulation,
%    edited by Jerry Banks,
%    Wiley, 1998,
%    ISBN: 0471134031,
%    LC: T57.62.H37.
%
%    Peter Lewis, Allen Goodman, James Miller,
%    A Pseudo-Random Number Generator for the System/360,
%    IBM Systems Journal,
%    Volume 8, Number 2, 1969, pages 136-143.
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
  i4_huge = 2147483647;

  if ( seed == 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_01 - Fatal error!\n' );
    fprintf ( 1, '  Input SEED = 0!\n' );
    error ( 'R8_UNIFORM_01 - Fatal error!' );
  end

  seed = floor ( seed );

  seed = mod ( seed, i4_huge );

  if ( seed < 0 ) 
    seed = seed + i4_huge;
  end 

  k = floor ( seed / 127773 );

  seed = 16807 * ( seed - k * 127773 ) - k * 2836;

  if ( seed < 0 )
    seed = seed + i4_huge;
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
%    14 February 2003
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
