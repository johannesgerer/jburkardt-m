function  [ p_xy, p_type ] = state_initialize ( nb, ni, np, r );

%*****************************************************************************80
%
%% STATE_INITIALIZE initializes the state.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NB, the number of boundary points.
%
%    Input, integer NI, the number of interior points.
%
%    Input, integer NP, the total number of points.
%
%    Input, real R, the radius of the circle.
%
%    Output, real P_XY(2,NP), the coordinates of the points.
%
%    Output, integter P_TYPE(1,NP), the type of each point.
%    1, the point is constrained to the boundary.
%    2, the point is constrained to the interior.
%
  if ( 0 )
    p_xy = disk_sample_uniform ( np, r );
  else
    p_xy = disk_sample_nonuniform ( np, r );
  end

  p_type = zeros ( 1, np );
  p_type(1,1:nb)    = 1;
  p_type(1,nb+1:np) = 2;

  p_norm(1,1:np) = sqrt ( sum ( p_xy.^2, 1 ) );

  p_xy(1,1:nb) = r * p_xy(1,1:nb) ./ p_norm(1:nb);
  p_xy(2,1:nb) = r * p_xy(2,1:nb) ./ p_norm(1:nb);

  return
end
