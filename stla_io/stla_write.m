function stla_write ( output_file_name, node_num, face_num, node_xyz, ...
  face_node, face_normal )

%*****************************************************************************80
%
%% STLA_WRITE writes graphics information to an ASCII StereoLithography file.
%
%  Example:
%
%    solid MYSOLID
%      facet normal 0.4 0.4 0.2
%        outerloop
%          vertex  1.0 2.1 3.2
%          vertex  2.1 3.7 4.5
%          vertex  3.1 4.5 6.7
%        end loop
%      end facet
%      ...
%      facet normal 0.2 0.2 0.4
%        outerloop
%          vertex  2.0 2.3 3.4
%          vertex  3.1 3.2 6.5
%          vertex  4.1 5.5 9.0
%        end loop
%      end facet
%    end solid MYSOLID
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    3D Systems, Inc,
%    Stereolithography Interface Specification,
%    October 1989.
%
%  Parameters:
%
%    Input, string OUTPUT_FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer FACE_NODE(3,FACE_NUM), the nodes making faces.
%
%    Input, integer FACE_MAX, the maximum number of faces.
%
%    Input, real FACE_NORMAL(3,FACE_NUM), the normal vector at each face.
%
  text_num = 0;
%
%  Open the file.
%
  iunit = fopen ( output_file_name, 'wt' );

  if ( iunit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'STLA_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', output_file_name );
    error ( 'STLA_WRITE - Fatal error!' );
  end

  fprintf ( iunit, 'solid MYSOLID\n' );
  text_num = text_num + 1;

  for face = 1 : face_num

    fprintf ( iunit, '  facet normal  %14f  %14f  %14f\n', ...
      face_normal(1:3,face) );
    text_num = text_num + 1;

    fprintf ( iunit, '    outer loop\n' );
    text_num = text_num + 1;

    for vertex = 1 : 3

      node = face_node(vertex,face);

      fprintf ( iunit, '      vertex    %14f  %14f  %14f\n', ...
        node_xyz(1:3,node) );
      text_num = text_num + 1;

    end

    fprintf ( iunit, '    end loop\n' );
    text_num = text_num + 1;
    fprintf ( iunit, '  end facet\n' );
    text_num = text_num + 1;

  end

  fprintf ( iunit, 'end solid MYSOLID\n' );
  text_num = text_num + 1;

  fclose ( iunit );

  return
end
