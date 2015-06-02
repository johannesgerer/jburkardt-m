function [ x, e_conn ] = geometry_1d ( x_l, x_r, elements_mesh )

%*****************************************************************************80
%
%% GEOMETRY defines the finite element geometry.
%
%  Discussion:
%
%    Internally, this function chooses quadratic elements, so that each 
%    element contains three nodes.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2011
%
%  Author:
%
%    Jeff Borggaard, John Burkardt, Catalin Trenchea, Clayton Webster
%
%  Parameters:
%
%    Input, real X_L, X_R, the left and right endpoints of the interval.
%
%    Input, integer ELEMENTS_MESH, the number of elements (subintervals)
%    into which the region is divided.
%
%    Local, real X(N_NODES,1), the nodes of the mesh.
%
%    Local, integer E_CONN(N_ELEMENT,NEL_DOF), the indices of the nodes 
%    in the elements.
%
%  Local parameters:
%
%    Local, integer E_CONNB(1,NEL_DOF), the indices of the nodes in the 
%    master element.
%
%    Local, string VARIABLE.ELEMENT, indicates the kind of element being used.
%    This currently defaults to 'continuous_quadratic'.
%    'continuous_linear'
%    'continuous_quadratic'
%    'continuous_cubic'
%
%    Local, real XB(NEL_DOF,1), the nodes of the master element.
%
  variable.element = 'continuous_quadratic';

  if ( strcmp(variable.element,'continuous_linear') )

    xb(:,1)      = [x_l; x_r];
    e_connb(1,:) = [1 2];
    rho(1)       = elements_mesh;
    [x,e_conn,index_u,index_c] = oned_mesh ( xb, e_connb, rho );

  elseif ( strcmp(variable.element,'continuous_quadratic') )

    xb(:,1)      = [x_l; .5*(x_l+x_r); x_r];
    e_connb(1,:) = [1 2 3];
    rho(1)       = elements_mesh;
    [x,e_conn,index_u,index_c] = oned_mesh ( xb, e_connb, rho );

  elseif ( strcmp(variable.element,'continuous_cubic') )

    xb(:,1)      = [x_l; (x_l+x_r)/3; 2*(x_l+x_r)/3; x_r];
    e_connb(1,:) = [1 2 3 4];
    rho(1)       = elements_mesh;
    [x,e_conn,index_u,index_c] = oned_mesh ( xb, e_connb, rho );

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'GEOMETRY - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized element choice.\n' );
    error ( 'GEOMETRY - Fatal error!' );

  end

  return
end
