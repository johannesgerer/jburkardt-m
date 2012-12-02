function volume = p00_volume ( problem, dim_num )

%*****************************************************************************80
%
%% P00_VOLUME returns the volume of the integration region.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the number of the desired test problem.
%
%    Input, integer DIM_NUM, the dimension of the problem.
%
%    Output, real VOLUME, the volume of the integration region.
%
  if ( 1 <= problem & problem <= 20 )

    [ a, b ] = p00_lim ( problem, dim_num );

    volume = prod ( b(1:dim_num) - a(1:dim_num) );

  elseif ( problem == 21 )

    volume = sphere_unit_area_nd ( dim_num );

  elseif ( problem == 22 )

    r = 0.0;
    r = p22_r8 ( 'G', 'R', r );

    volume = sphere_volume_nd ( dim_num, r );

  elseif ( problem == 23 )

    volume = simplex_unit_volume_nd ( dim_num );

  elseif ( 24 <= problem & problem <= 32 )

    [ a, b ] = p00_lim ( problem, dim_num );

    volume = prod ( b(1:dim_num) - a(1:dim_num) );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_VOLUME - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of PROBLEM.\n' );
    error ( 'P00_VOLUME - Fatal error!' )

  end

  return
end
