function poisson_serial ( )

%*****************************************************************************80
%
%% MAIN is the main program for POISSON_SERIAL.
%
%  Discussion:
%
%    POISSON_SERIAL is a program for solving the Poisson problem.
%
%    This program runs serially.  Its output is used as a benchmark for
%    comparison with similar programs run in a parallel environment.
%
%    The Poisson equation
%
%      - DEL^2 U(x,y) = F(x,yY)
%
%    is solved on the unit square [0,1] x [0,1] using a grid of NX by
%    NX evenly spaced points.  The first and last points in each direction
%    are boundary points.
%
%    The boundary conditions and F are set so that the exact solution is
%
%      U(x,y) = sin ( pi * x * y )
%
%    so that
%
%      - DEL^2 U(x,y) = pi^2 * ( x^2 + y^2 ) * sin ( pi * x * y )
%
%    The Jacobi iteration is repeatedly applied until convergence is detected.
%
%    For convenience in writing the discretized equations, we assume that NX = NY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Local parameters:
%
%    Local, real DX, DY, the X and Y spacing.
%
  nx = 11;
  ny = nx;
  dx = 1.0 / ( nx - 1 );
  dy = dx;
  it_max = 1000;
  tolerance = 0.000001;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_SERIAL:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  A program for solving the Poisson equation:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  -DEL^2 U = F(X,Y)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  on the rectangle 0 <= X <= 1, 0 <= Y <= 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X,Y) = pi^2 * ( x^2 + y^2 ) * sin ( pi * x * y )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of X grid points is %d\n', nx );
  fprintf ( 1, '  The number of Y grid points is %d\n', ny );
  fprintf ( 1, '  The X grid spacing is %f\n', dx );
  fprintf ( 1, '  The Y grid spacing is %f\n', dy );
%
%  Set the right hand side.
%
  f = rhs ( nx, ny );
%
%  Set the initial solution estimate.
%  We are "allowed" to pick up the boundary conditions exactly.
%
  unew = zeros ( nx, ny );

  unew(1,   1:ny) = f(1,   1:ny);
  unew(  nx,1:ny) = f(  nx,1:ny);
  unew(1:nx,1)    = f(1:nx,1);
  unew(1:nx,  ny) = f(1:nx,  ny);

  unew_norm = r8mat_rms ( nx, ny, unew );
%
%  Set up the exact solution.
%
  x = linspace ( 0, 1, nx );
  y = linspace ( 0, 1, ny );
  [ X, Y ] = meshgrid ( x, y );
  uexact = u_exact ( X, Y );
  unorm = r8mat_rms ( nx, ny, uexact );
  fprintf ( 1, '  RMS of exact solution U = %g\n', unorm );
%
%  Do the iteration.
%
  converged = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Step    ||Unew||     ||Unew-U||     ||Unew-Exact||\n' );
  fprintf ( 1, '\n' );

  error = r8mat_rms ( nx, ny, unew - uexact );
  fprintf ( 1, '%4d  %12g                %12g\n', 0, unew_norm, error );

  for it = 1 : it_max

    u = unew;
%
%  Perform one Jacobi sweep.
%
    unew = sweep ( nx, ny, dx, dy, f, u );
%
%  Check for convergence.
%
    u_norm = unew_norm;
    unew_norm = r8mat_rms ( nx, ny, unew );
    diff = r8mat_rms ( nx, ny, unew - u );
    error = r8mat_rms ( nx, ny, unew - uexact );

    fprintf ( 1, '%3d  %12g  %12g  %12g\n', it, unew_norm, diff, error );

    if ( diff <= tolerance )
      converged = 1;
      break
    end

  end

  if ( converged )
    fprintf ( 1, '  The iteration has converged.\n' );
  else
    fprintf ( 1, '  The iteration has NOT converged.\n' );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POISSON_SERIAL:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = r8mat_rms ( nx, ny, a )

%*****************************************************************************80
%
%% R8MAT_RMS returns the root mean square of data stored as an R8MAT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 August 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns in A.
%
%    Input, real A(M,N), the data whose RMS is desired.
%
%    Output, real VALUE, the root mean square of A.
%
  value = sqrt ( sum ( sum ( a(1:nx,1:ny).^2 ) ) / ( nx * ny ) );

  return
end
function f = rhs ( nx, ny )

%*****************************************************************************80
%
%% RHS initializes the right hand side "vector".
%
%  Discussion:
%
%    It is convenient for us to set up RHS as a 2D array.  However, each
%    entry of RHS is really the right hand side of a linear system of the
%    form
%
%      A * U = F
%
%    In cases where U(I,J) is a boundary value, then the equation is simply
%
%      U(I,J) = F(i,j)
%
%    and F(I,J) holds the boundary data.
%
%    Otherwise, the equation has the form
%
%      (1/DX^2) * ( U(I+1,J)+U(I-1,J)+U(I,J-1)+U(I,J+1)-4*U(I,J) ) = F(I,J)
%
%    where DX is the spacing and F(I,J) is the value at X(I), Y(J) of
%
%      pi^2 * ( x^2 + y^2 ) * sin ( pi * x * y )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the X and Y grid dimensions.
%
%    Output, real F(NX,NY), the right hand side data.
%

%
%  The "boundary" entries of F store the boundary values of the solution.
%  The "interior" entries of F store the right hand sides of the Poisson equation.
%
  for j = 1 : ny
    y = ( j - 1 ) / ( ny - 1 );
    for i = 1 : nx
      x = ( i - 1 ) / ( nx - 1 );
      if ( i == 0 || i == nx || j == 0 || j == ny )
        f(i,j) = u_exact ( x, y );
      else
        f(i,j) = - uxxyy_exact ( x, y );
      end
    end
  end

  fnorm = r8mat_rms ( nx, ny, f );
  fprintf ( 1, '  RMS of F = %g\n', fnorm );

  return
end
function unew = sweep ( nx, ny, dx, dy, f, u )

%*****************************************************************************80
%
%% SWEEP carries out one step of the Jacobi iteration.
%
%  Discussion:
%
%    Assuming DX = DY, we can approximate
%
%      - ( d/dx d/dx + d/dy d/dy ) U(X,Y) 
%
%    by
%
%      ( U(i-1,j) + U(i+1,j) + U(i,j-1) + U(i,j+1) - 4*U(i,j) ) / dx / dy
%
%    The discretization employed below will not be correct in the general
%    case where DX and DY are not equal.  It's only a little more complicated
%    to allow DX and DY to be different, but we're not going to worry about 
%    that right now.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, NY, the X and Y grid dimensions.
%
%    Input, real DX, DY, the spacing between grid points.
%
%    Input, real F(NX,NY), the right hand side data.
%
%    Input, real U(NX,NY), the previous solution estimate.
%
%    Output, real UNEW(NX,NY), the updated solution estimate.
%

%
%  The boundary values are stored in F.  Copy them.
%
  unew = f;
%
%  The interior values are set by a Jacobi iteration.
%
  unew(2:nx-1,2:ny-1) = 0.25 * ( ...
      u(1:nx-2,2:ny-1) ...
    + u(2:nx-1,3:ny) ...
    + u(2:nx-1,1:ny-2) ...
    + u(3:nx,  2:ny-1) ...
    + f(2:nx-1,2:ny-1) * dx * dy );

  return
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

  return
end
function u = u_exact ( x, y )

%*****************************************************************************80
%
%% UEXACT evaluates the exact solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point.
%
%    Output, real U, the value of the exact solution at (X,Y).
%
  u = sin ( pi * x .* y );

  return
end
function uxxyy = uxxyy_exact ( x, y )

%*****************************************************************************80
%
%% UXXYY_EXACT evaluates ( d/dx d/dx + d/dy d/dy ) of the exact solution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, Y, the coordinates of a point.
%
%    Output, real UXXYY, the value of ( d/dx d/dx + d/dy d/dy ) of the
%    exact solution at (X,Y).
%
  uxxyy = - pi * pi * ( x .* x + y .* y ) .* sin ( pi * x .* y );

  return
end
