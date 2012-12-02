function [ x, e_conn, index_u, index_c ] = oned_mesh ( xb, e_connb, rho )

%*****************************************************************************80
%
%% ONED_MESH generates a finite element mesh.
%
%  Discussion:
%
%    This function generates a mesh with a prescribed density.
%    It returns data of the same type as the input quantities XB and E_CONNB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2011
%
%  Author:
%
%    Jeff Borggaard
%
%  Parameters:
%
%    Input, xb, nodal coordinates for a background mesh.
%
%    Input, e_connb, connectivity for a background mesh.
%
%    Input, rho, a mesh density function, assumed piecewise constant for now.
%
%    Output, x, node coordinates of adapted mesh.
%
%    Output, e_conn, element connectivity of adapted mesh.
%
%    Output, index_u, node numbers of unknowns.
%
%    Output, index_c, node numbers of controls.
%
  [temp,dim] = size ( e_connb );
  dim        = dim - 1;
%
%  Force RHO to be a column vector.
%
  rho = rho(:);
%
%  Make sure the number of elements is integral.
%
  int_rho  = ( xb(e_connb(:,end),1)-xb(e_connb(:,1),1) )'*rho;
  new_elem = ceil ( int_rho );
  rho      = new_elem * rho / int_rho;

  x_front  = xb(1,1);
  int_rho  = 0;
  bg_elem  = 0;

  for k=1:new_elem

    if (dim == 1)
      e_conn(k,:) = [k, k+1];
    elseif (dim == 2)
      e_conn(k,:) = [2*k-1, 2*k, 2*k+1];
    elseif (dim == 3)
      e_conn(k,:) = [3*k-2, 3*k-1, 3*k, 3*k+1];
    end 

    while ( int_rho < 1 - sqrt ( eps ) )
      bg_elem  = bg_elem + 1;
      eint_rho = ( xb(e_connb(bg_elem,end),1)-xb(e_connb(bg_elem,1),1) )*...
               rho(bg_elem);
      int_rho  = int_rho + eint_rho;
    end
%
%  The new endpoint is in the current background element
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
