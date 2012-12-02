function [ h_array, uh_array, x, t ] = shallow_water_1d ( nx, nt, x_length, ...
  t_length, g )

%*****************************************************************************80
%
%% SHALLOW_WATER_1D approximates the 1D shallow water equations.
%
%  Discussion:
%
%    This code can be considered a 1D version of Cleve Moler's shallow
%    water equation solver.
%
%    The version of the shallow water equations being solved here is in
%    conservative form, and omits the Coriolis force.  The state variables
%    are H (the height) and UH (the mass velocity).
%
%    The equations have the form
%
%      dH/dt + d UH/dx = 0
%
%      d UH/dt + d ( U^2 H + 1/2 g H^2 )/dx = 0
%
%    Here U is the ordinary velocity, U = UH/H, and g is the gravitational
%    acceleration.
%
%    The initial conditions are used to specify ( H, UH ) at an equally
%    spaced set of points, and then the Lax-Wendroff method is used to advance
%    the solution through a number of equally spaced points in time, with 
%    boundary conditions supplying the first and last spatial values.
%
%
%    Some input values will result in an unstable calculation that
%    quickly blows up.  This is related to the Courant-Friedrichs-Lewy
%    condition, which requires that DT be small enough, relative to DX and
%    the velocity, that information cannot cross an entire cell.
%
%    A "reasonable" set of input quantities is
%
%      shallow_water_1d ( 41, 100, 1.0, 0.2, 9.8 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    "The Shallow Water Equations",
%    Experiments with MATLAB.
%
%  Parameters:
%
%    Input, integer NX, the number of spatial nodes.
%
%    Input, integer NT, the number of times steps.
%
%    Input, real X_LENGTH, the length of the region.
%
%    Input, real T_LENGTH, the time extent.
%
%    Input, real G, the gravity constant.  G = 9.8 meters per second^2.
%
%    Output, real H_ARRAY(NX,NT+1), the height for all space and time points.
%
%    Output, real UH_ARRAY(NX,NT+1), the mass velocity for all space and time points.
%
%    Output, real X(NX), the X coordinates.
%
%    Output, real T(NT+1), the T coordinates.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHALLOW_WATER_1D:\n' );
  fprintf ( 1, '  MATLAB version.\n' );

  if ( nargin < 5 )
    fprintf ( 1, '\n' );
  end
  if ( nargin < 1 )
    nx = 41;
    fprintf ( 1, '  Missing input NX defaults to %d\n', nx );
  end
  if ( nargin < 2 )
    nt = 100;
    fprintf ( 1, '  Missing input NT defaults to %d\n', nt );
  end
  if ( nargin < 3 )
    x_length = 1.0;
    fprintf ( 1, '  Missing input X_LENGTH defaults to %g\n', x_length );
  end
  if ( nargin < 4 )
    t_length = 0.2;
    fprintf ( 1, '  Missing input T_LENGTH defaults to %g\n', t_length );
  end
  if ( nargin < 5 )
    g = 9.8;
    fprintf ( 1, '  Missing input G defaults to %g\n', g );
  end
%
%  Force all vectors to be COLUMN vectors!
%
  h = zeros ( nx, 1 );
  uh = zeros ( nx, 1 );
  hm = zeros ( nx - 1, 1 );
  uhm = zeros ( nx - 1, 1 );
  x = zeros ( nx, 1 );
  t = zeros ( nt+1, 1 );
  h_array = zeros ( nx, nt + 1 );
  uh_array = zeros ( nx, nt + 1 );
%
%  Define the locations of the nodes and time steps and the spacing.
%
  x = ( linspace ( 0, x_length, nx ) )';
  t = ( linspace ( 0, t_length, nt + 1 ) )';

  dx = x_length / ( nx - 1 );
  dt = t_length / nt;
%
%  Apply the initial conditions.
%
  [ h, uh ] = initial_conditions ( nx, nt, h, uh, x );
%
%  Apply the boundary conditions.
%
  [ h, uh ] = boundary_conditions ( nx, nt, h, uh, t(1) );
%
%  Store the first time step into H_ARRAY and UH_ARRAY.
%
  h_array(1:nx,1) = h(1:nx);
  uh_array(1:nx,1) = uh(1:nx);
%
%  Take NT more time steps.
%
  for it = 1 : nt
%
%  Take a half time step, estimating H and UH at the NX-1 spatial midpoints.
%
    hm(1:nx-1) = ( h(1:nx-1) + h(2:nx) ) / 2.0 ...
      - ( dt / 2.0 ) * ( uh(2:nx) - uh(1:nx-1) ) / dx;

    uhm(1:nx-1) = ( uh(1:nx-1) + uh(2:nx) ) / 2.0 ...
      - ( dt / 2.0 ) * ( ...
        uh(2:nx).^2    ./ h(2:nx)   + 0.5 * g * h(2:nx).^2 ...
      - uh(1:nx-1).^2  ./ h(1:nx-1) - 0.5 * g * h(1:nx-1).^2 ) / dx;
%
%  Take a full time step, evaluating the derivative at the half time step,
%  to estimate the solution at the NX-2 nodes.
%
    h(2:nx-1) = h(2:nx-1) ...
      - dt * ( uhm(2:nx-1) - uhm(1:nx-2) ) / dx;

    uh(2:nx-1) = uh(2:nx-1) ...
      - dt * ( ...
        uhm(2:nx-1).^2  ./ hm(2:nx-1) + 0.5 * g * hm(2:nx-1).^2 ...
      - uhm(1:nx-2).^2  ./ hm(1:nx-2) - 0.5 * g * hm(1:nx-2).^2 ) / dx;
%
%  Update the boundary conditions.
%
    [ h, uh ] = boundary_conditions ( nx, nt, h, uh, t(it+1) );
%
%  Copy data into the big arrays.
%
    h_array(1:nx,it+1) = h(1:nx);
    uh_array(1:nx,it+1) = uh(1:nx);
    
  end
%
%  Write data.
%
  filename_x = 'sw1d_x.txt';
  filename_t = 'sw1d_t.txt';
  filename_h = 'sw1d_h.txt';
  filename_uh = 'sw1d_uh.txt';

  r8vec_write ( filename_x, nx, x );
  r8vec_write ( filename_t, nt + 1, t );
  r8mat_write ( filename_h, nx, nt + 1, h_array );
  r8mat_write ( filename_uh, nx, nt + 1, uh_array );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X  values saved in file "%s"\n', filename_x );
  fprintf ( 1, '  T  values saved in file "%s"\n', filename_t );
  fprintf ( 1, '  H  values saved in file "%s"\n', filename_h );
  fprintf ( 1, '  UH values saved in file "%s"\n', filename_uh );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHALLOW_WATER_1D:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function [ h, uh ] = boundary_conditions ( nx, nt, h, uh, t )

%*****************************************************************************80
%
%% INITIAL_CONDITIONS sets the initial conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, the number of spatial nodes.
%
%    Input, integer NT, the number of times steps.
%
%    Input, real H(NX), the height for all space.
%
%    Input, real UH(NX), the mass velocity for all space.
%
%    Input, real T, the current time.
%
%    Output, real H(NX), the height, with H(1) and H(NX) adjusted for
%    boundary conditions.
%
%    Output, real UH(NX), the mass velocity, with UH(1) and UH(NX)
%    adjusted for boundary conditions.
%
  bc = 1;
%
%  Periodic boundary conditions on H and UH.
%
  if ( bc == 1 )
    h(1) = h(nx-1);
    h(nx) = h(2);
    uh(1) = uh(nx-1);
    uh(nx) = uh(2);
%
%  Free boundary conditions on H and UH.
%
  elseif ( bc == 2 )
    h(1) = h(2);
    h(nx) = h(nx-1);
    uh(1) = uh(2);
    uh(nx) = uh(nx-1);
%
%  Reflective boundary conditions on UH, free boundary conditions on H.
%
  elseif ( bc == 3 )
    h(1) = h(2);
    h(nx) = h(nx-1);
    uh(1) = - uh(2);
    uh(nx) = - uh(nx-1);
  end

  return
end
function [ h, uh ] = initial_conditions ( nx, nt, h, uh, x )

%*****************************************************************************80
%
%% INITIAL_CONDITIONS sets the initial conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NX, the number of spatial nodes.
%
%    Input, integer NT, the number of times steps.
%
%    Input, real H(NX,1), an array to hold the height.
%
%    Input, real UH(NX,1), an array to hold the mass velocity.
%
%    Input, real X(NX,1), the coordinates of the nodes.
%
%    Output, real H(NX,1), the initial height for all space.
%
%    Output, real UH(NX,1), the initial mass velocity for all space.
%
  h(1:nx) = 2.0 + sin ( 2 * pi * x(1:nx) );
  uh(1:nx) = 0.0;

  return
end
function r8mat_write ( output_filename, m, n, table )

%*****************************************************************************80
%
%% R8MAT_WRITE writes an R8MAT file.
%
%  Discussion:
%
%    An R8MAT is an array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real TABLE(M,N), the points.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8MAT_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8MAT_WRITE - Error!' );
  end
%
%  Write the data.
%
%  For smaller data files, and less precision, try:
%
%     fprintf ( output_unit, '  %14.6e', table(i,j) );
%
  for j = 1 : n
    for i = 1 : m
      fprintf ( output_unit, '  %24.16e', table(i,j) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  Close the file.
%
  fclose ( output_unit );

  return
end
function r8vec_write ( output_filename, n, x )

%*****************************************************************************80
%
%% R8VEC_WRITE writes an R8VEC file.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILENAME, the output filename.
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the vector.
%

%
%  Open the file.
%
  output_unit = fopen ( output_filename, 'wt' );

  if ( output_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_WRITE - Error!\n' );
    fprintf ( 1, '  Could not open the output file.\n' );
    error ( 'R8VEC_WRITE - Error!' );
  end

  for j = 1 : n
    fprintf ( output_unit, '  %24.16g\n', x(j) );
  end
%
%  Close the file.
%
  fclose ( output_unit );

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
