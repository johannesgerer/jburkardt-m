function show ( elements3, coordinates, U, nt, t_start, t_final )

%*****************************************************************************80
%
%% SHOW displays the solution of the finite element computation.
%
%  Modified:
%
%    20 June 2007
%
%  Author:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken.
%
%  Reference:
%
%    Jochen Alberty, Carsten Carstensen, Stefan Funken,
%    Remarks Around 50 Lines of MATLAB:
%    Short Finite Element Implementation,
%    Numerical Algorithms,
%    Volume 20, pages 117-137, 1999.
%
%  Parameters:
%
%    Input, integer ELEMENTS3(N3,3), the nodes that make up each triangle.
%
%    Input, real COORDINATES(N,1:2), the coordinates of each node.
%
%    Input, real U(N,NT+1), the finite element coefficients which represent
%    the solution, for each time step.
%  
%    Input, integer NT, the number of time steps.
%
%    Input, real T_START, T_FINAL, the start and end times.
%
  umin = min ( min ( U ) );
  umax = max ( max ( U ) );

  for i = 0 : nt
%
%  Print the current time T to the command window, and in the plot title.
%
    t = ( ( nt - i     ) * t_start   ...
        + (      i     ) * t_final ) ...
        /   nt;

    fprintf ( 1, 'T = %f\n', t );
%
%  TRISURF will display surface plots of X, Y, Z data 
%  that has been grouped into triangles.
%
    picture = trisurf ( elements3, coordinates(:,1), coordinates(:,2), ...
      U(:,i+1)', 'EdgeColor', 'interp', 'FaceColor', 'interp' );
%
%  We want all the plots to use the same Z scale.
%
    axis ( [0 1 0 1 umin umax] );
%
%  Write some labels on the plot.
%
    xlabel ( 'X axis' );
    ylabel ( 'Y axis' );
    s = sprintf ( 'T = %8f', t );
    title ( s );
%
%  The GETFRAME command is normally used when saving a series of plots to make
%  a movie.  I don't actually know what I'm doing here, except that if I omit
%  this command, only the final plot shows up on the screen.  I don't know 
%  whether I am simply slowing down the calculation enough for the graphics
%  to be refreshed, or whether something deeper and smarter is going on.
%  
    getframe;

  end

  return
end
