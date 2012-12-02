function singularity = p00_singularity ( problem )

%*****************************************************************************80
%
%% P00_SINGULARITY warns of common singularities for any problem.
%
%  Discussion:
%
%    This routine can be used to check whether the integrand function
%    for a given problem has singularities at the vertices or along
%    the edges of the triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Output, integer SINGULARITY.
%    0, there are no vertex or edge singularities.
%    1, there are singularities at one or more vertices, but not on edges.
%    2, there are singularities on one or more edges, possibly 
%       including vertices.
%    3, there are singularities somewhere inside or on the triangle.
%
  if ( problem == 1 )
    singularity = 0;
  elseif ( problem == 2 )
    singularity = 0;
  elseif ( problem == 3 )
    singularity = 0;
  elseif ( problem == 4 )
    singularity = 0;
  elseif ( problem == 5 )
    singularity = 0;
  elseif ( problem == 6 )
    singularity = 0;
  elseif ( problem == 7 )
    singularity = 0;
  elseif ( problem == 8 )
    singularity = 0;
  elseif ( problem == 9 )
    singularity = 0;
  elseif ( problem == 10 )
    singularity = 2;
  elseif ( problem == 11 )
    singularity = 1;
  elseif ( problem == 12 )
    singularity = 2;
  elseif ( problem == 13 )
    singularity = 2;
  elseif ( problem == 14 )
    singularity = 2;
  elseif ( problem == 15 )
    singularity = 2;
  elseif ( problem == 16 )
    singularity = 2;
  elseif ( problem == 17 )
    singularity = 3
  elseif ( problem == 18 )
    singularity = 1;
  elseif ( problem == 19 )
    singularity = 0;
  elseif ( problem == 20 )
    singularity = 0;
  elseif ( problem == 21 )
    singularity = 1;
  elseif ( problem == 22 )
    singularity = 1;
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P00_SINGULARITY - Fatal error!\n' );
    fprintf ( 1, '  Illegal problem number = %d\n', problem );
    error ( 'P00_SINGULARITY - Fatal error!' );
  end

  return
end
