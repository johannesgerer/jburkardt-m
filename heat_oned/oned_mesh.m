function [ x, e_conn, index_u, index_c ] = oned_mesh ( xb, e_connb, rho )

%*****************************************************************************80
%
%% ONED_MESH generates a mesh with a prescribed density.
%
%  Discussion:
%
%    This routine returns elements of the same type as 
%    xb, e_connb (linear or quadratic).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 December 2012
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, real XB(), coordinates of the nodes for the background mesh.
%
%    Input, integer E_CONNB(), the connectivity for the background mesh.
%
%    Input, real RHO(), a mesh density function, assumed piecewise constant
%    for now.
%
%    Output, real X(), the coordinates of the nodes for the mesh.
%
%    Output, integer E_CONN(), the connectivity for the mesh.
%
%    Output, integer INDEX_U(), the node numbers of the unknowns.
%
%    Output, integer INDEX_C(), the node numbers of the controls.
%
  [ temp, dim ] = size ( e_connb );
  dim = dim - 1;
%
%  Force RHO to be a column vector.
%
  rho = rho(:);
%
%  Make sure the number of elements is integral.
%
  int_rho  = ( xb(e_connb(:,end),1) - xb(e_connb(:,1),1) )' * rho;
  new_elem = ceil ( int_rho );
  rho = new_elem * rho / int_rho;

  x_front  = xb(1,1);
  int_rho  = 0;
  bg_elem  = 0;

  for k = 1 : new_elem

    if (dim == 1)
      e_conn(k,:) = [k, k+1];
    elseif (dim == 2)
      e_conn(k,:) = [2*k-1, 2*k, 2*k+1];
    elseif (dim == 3)
      e_conn(k,:) = [3*k-2, 3*k-1, 3*k, 3*k+1];
    end 

    while (int_rho<1-sqrt(eps))
      bg_elem  = bg_elem + 1;
      eint_rho = ( xb(e_connb(bg_elem,end),1)-xb(e_connb(bg_elem,1),1) )*...
        rho(bg_elem);
      int_rho  = int_rho + eint_rho;
    end
%
%  The new endpoint is in the current background element.
%
    x_t     = max(x_front,xb(e_connb(bg_elem,1)));
    int_rho = int_rho-1;

    x_right = x_t + min(1,eint_rho-int_rho)/eint_rho*...
      ( xb(e_connb(bg_elem,end),1)-xb(e_connb(bg_elem,1),1) );
    x_nodes = linspace(x_front,x_right,dim+1);
    x(e_conn(k,:),1) = x_nodes';
%
%  Advance the front.
%
    x_front = x_right;

  end

  [n_nodes,dim] = size(x);
  index_u = [2:n_nodes-1];
  index_c = [1, n_nodes];

  return
end

