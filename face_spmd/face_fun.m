function F_conn = ...
               face_fun ( x, e_conn, ii, val_ii, xj_lb, xj_ub, xk_lb, xk_ub )

%*****************************************************************************80
%
%% FACE_FUN seeks triangular faces that lie on a boundary of the region.
%
%  Discussion:
%
%    Locate faces of the tetrahedral elements (triangles) that are within
%    a rectangular box on a 'max' face in x, y, or z.  We make a list of these
%    (oriented) triangles and the associated nodal points.
%
%    Note ii,j, k in cyclic order
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 June 2010
%
%  Author:
%
%    Gene Cliff, John Burkardt
%
%  Parameters:
%
%    Input, real x(n_nodes,3), the nodal coordinates.
%
%    Input, integer e_conn(3,n_elements), the element connectivity.
%
%    Input, integer ii, 1, 2 or 3 for 'x', 'y', or 'z' being the
%    coordinate that is fixed.
%
%    Input, real val_ii, the value of the coordinate that is fixed.
%
%    Input, real xj_lb, the lower bound for 'j' coordinate
%
%    Input, real xj_ub, the upper bound for 'j' coordinate
%
%    Input, real xk_lb, the lower bound for 'k' coordinate
%
%    Input, real xk_ub, the upper bound for 'k' coordinate
%
%    Output, integer F_conn(3,nf_max), the nodal coordinates 
%    of triangles that lie on the face.
%
  n_elements = size(e_conn, 2); 
  nf = 0;
  val_ii = val_ii - sqrt(eps); % tolerance - small but not too small

  spmd
%
%  Allocate the elements among the labs
%
    lab_els = getLocalPart(codistributed.colon(1, n_elements));

    f_conn = zeros(3, floor(n_elements/(20*numlabs())));  % pre-allocation
%
%  Loop over the tetrahedral elements assigned to this lab.
%
    for ne = lab_els
%
%  Make a short list of the 4 nodes used in this element.
%
      nodes_loc = e_conn(:, ne);
      x_nodes   = x(nodes_loc,:);
%
%  Check to see if one of the four faces is 'on' this boundary.
%
      if     all(x_nodes([1 3 2], ii) >= val_ii )

        if in_box(x_nodes([1 3 2],:), ii, xj_lb, xj_ub, xk_lb, xk_ub)
          nf = nf + 1;
          f_conn(:, nf) = nodes_loc([1 3 2])';
        end

      elseif all(x_nodes([1 2 4], ii) >= val_ii )

        if in_box(x_nodes([1 2 4],:), ii, xj_lb, xj_ub, xk_lb, xk_ub)
          nf = nf + 1;
          f_conn(:, nf) = nodes_loc([1 2 4])';
        end

      elseif all(x_nodes([1 4 3], ii) >= val_ii )

        if in_box(x_nodes([1 4 3],:), ii, xj_lb, xj_ub, xk_lb, xk_ub)
          nf = nf + 1;
          f_conn(:, nf) = nodes_loc([1 4 3])';
        end

      elseif all(x_nodes([2 3 4], ii) >= val_ii )

        if in_box(x_nodes([2 3 4],:), ii, xj_lb, xj_ub, xk_lb, xk_ub)
          nf = nf + 1;
          f_conn(:, nf) = nodes_loc([2 3 4])';
        end

      end % if

    end % for
%
%  We probably allocated too much space for f_conn.
%  To simply the client's assembly process, 
%  contract the array to the size we needed.
%
    f_conn = f_conn(:,1:nf);

  end %  spmd
%
%  The client assembles the partial results into a single list.
%
  F_conn = [];
  for j = 1 : length ( nf )
    F_conn = [ F_conn, f_conn{j} ];
  end

  return
end
function is_in = in_box ( f_nodes, ii, xj_lb, xj_ub, xk_lb, xk_ub )

%*****************************************************************************80
%
%% IN_BOX checks whether the nodes of a face are within the box.
%
  loc_eps = sqrt(eps); % tolerance - small but not too small

  xj_lb = xj_lb - loc_eps; 
  xj_ub = xj_ub + loc_eps;
  xk_lb = xk_lb - loc_eps; 
  xk_ub = xk_ub + loc_eps;

  switch ii

    case 1 % on an x surface, check y and z
      is_in = ...
        all(f_nodes(:, 2) >= xj_lb) && all(f_nodes(:, 2) <= xj_ub) &&...
        all(f_nodes(:, 3) >= xk_lb) && all(f_nodes(:, 3) <= xk_ub);

    case 2 % on a  y surface, check z and x
      is_in = ...
        all(f_nodes(:, 3) >= xj_lb) && all(f_nodes(:, 3) <= xj_ub) &&...
        all(f_nodes(:, 1) >= xk_lb) && all(f_nodes(:, 1) <= xk_ub);

    case 3 % on a  z surface, check x and y
      is_in = ...
        all(f_nodes(:, 1) >= xj_lb) && all(f_nodes(:, 1) <= xj_ub) &&...
        all(f_nodes(:, 2) >= xk_lb) && all(f_nodes(:, 2) <= xk_ub);

    otherwise
      fprintf( 1, '\n Unknown value in check box: ii = %d \n', ii);

  end

  return
end