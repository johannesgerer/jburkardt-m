function [] = tet_mesh_boundary(mesh_root)
%%
%  tet_mesh_boundary - a function that reads in a tet_mesh along with neighbor
%                      information and produces lists of boundary nodes and 
%                      boundary edges.  The tet_mesh can correspond to either 
%                      linear (4 vertices with right-hand orientation) or 
%                      quadratic (4 vertices + 6 midside nodes).  In the
%                      latter case, we assume the following ordering:
%                        1  2  3  4 (1+2) (2+3) (1+3) (2+4) (3+4) (1+4).
%
%%


  e_conn = load(strcat(mesh_root,'.elem'));
  tet_adj = load(strcat(mesh_root,'.neighbors'));

  [n_elem,n_dof] = size(e_conn);


  [ boundary_faces ] = define_boundary_faces( e_conn, tet_adj );


  %  preallocate storage for boundary_nodes array
  [ n_faces, npf ] = size( boundary_faces );

  
  boundary_nodes = zeros( 1,n_faces*npf );
  boundary_nodes_counter = 0;

  for n_f=1:n_faces
    boundary_nodes( boundary_nodes_counter+1:boundary_nodes_counter+npf ) =...
      boundary_faces( n_f, 1:npf );
    boundary_nodes_counter = boundary_nodes_counter+npf;
  end

  [ boundary_nodes ] = unique( boundary_nodes );

  filename = strcat(mesh_root,'.boundary');
  [fid] = fopen(filename,'w');

  print_str = ' %10d\n ';

  fprintf(fid,print_str,boundary_nodes);

  fclose(fid);

end % function  tet_mesh_boundary
  



function [ boundary_faces ] = define_boundary_faces( e_conn, tet_adj )
%%
%  define_boundary_faces - a function that loops over elements, finds
%                          boundary faces from -1 entries to the
%                          adjacency array and stores information
%--------------------------------------------------------------------------
  [n_elem,n_dof] = size(e_conn);

  %  Estimate the number of boundary faces for preallocation
  %  (these will always be unique)
  boundary_faces = zeros(n_elem,1+n_dof/2);
  boundary_faces_counter = 0;

  if ( n_dof==4 )
    %----------------------------------------------------------------------
    %  Case: Linear Tetrahedron (4 vertices)
    %----------------------------------------------------------------------
    for n_el=1:n_elem
      % A 1-FACE
      if ( tet_adj(n_el,1) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 2)  e_conn(n_el, 3)  e_conn(n_el, 4)     ];
      end


      % A 2-FACE
      if ( tet_adj(n_el,2) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 3)  e_conn(n_el, 1)  e_conn(n_el, 4)     ];
      end


      % A 3-FACE
      if ( tet_adj(n_el,3) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 1)  e_conn(n_el, 2)  e_conn(n_el, 4)     ];
      end


      % A 4-FACE
      if ( tet_adj(n_el,4) < 0 )
        boundary_face_counter = boundary_face_counter+1;
        boundary_face(boundary_face_counter,:) = ...
         [ e_conn(n_el, 1)  e_conn(n_el, 3)  e_conn(n_el, 2)     ];
      end

    end % element loop

    % end linear tetrahedron case

  elseif ( n_dof==10 )
    %----------------------------------------------------------------------
    %  Case: Quadratic Tetrahedron (10 noded)
    %----------------------------------------------------------------------
    for n_el=1:n_elem
      % A 1-FACE
      if ( tet_adj(n_el,1) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 2)  e_conn(n_el, 3)  e_conn(n_el, 4)  ...
           e_conn(n_el, 6)  e_conn(n_el, 9)  e_conn(n_el, 8)     ];
      end


      % A 2-FACE
      if ( tet_adj(n_el,2) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 3)  e_conn(n_el, 1)  e_conn(n_el, 4)  ...
           e_conn(n_el, 7)  e_conn(n_el,10)  e_conn(n_el, 9)     ];
      end


      % A 3-FACE
      if ( tet_adj(n_el,3) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 1)  e_conn(n_el, 2)  e_conn(n_el, 4)  ...
           e_conn(n_el, 5)  e_conn(n_el, 8)  e_conn(n_el,10)     ];
      end


      % A 4-FACE
      if ( tet_adj(n_el,4) < 0 )
        boundary_faces_counter = boundary_faces_counter+1;
        boundary_faces(boundary_faces_counter,:) = ...
         [ e_conn(n_el, 1)  e_conn(n_el, 3)  e_conn(n_el, 2)  ...
           e_conn(n_el, 7)  e_conn(n_el, 6)  e_conn(n_el, 5)     ];
      end

    end % element loop

    % end quadratic tetrahedron case

  else

    error('tet_mesh_boundary: the routine only accounts for 4 noded\n')
    error('of 10 noded tetrahedra\n')

  end

  boundary_faces = boundary_faces(1:boundary_faces_counter,:);

end % function define_boundary_faces
