function obj_write ( output_file_name, node_num, face_num, normal_num, ...
  order_max, node_xyz, face_order, face_node, normal_vector, vertex_normal )

%*****************************************************************************80
%
%% OBJ_WRITE writes graphics information to an Alias OBJ file.
%
%  Discussion:
%
%    If no normal vectors are supplied (NORMAL_NUM <= 0) then
%    a simple format is used for the "F" records.  Otherwise,
%    the "v//vn" format is used.
%
%  Example:
%
%    #  no_normals.obj
%
%    g Group002
%
%    v -3.269770 -39.572201 0.876128
%    v -3.263720 -39.507999 2.160890
%    ...
%    v 0.000000 -9.988540 0.000000
%
%    f 8 9 11 10
%    f 12 13 15 14
%    ...
%    f 788 806 774
%
%    #  normals_supplied.obj
%
%    g Group001
%
%    v -3.269770 -39.572201 0.876128
%    v -3.263720 -39.507999 2.160890
%    ...
%    v 0.000000 -9.988540 0.000000
%
%    vn 0.0 1.0 0.0
%    vn 1.0 0.0 0.0
%    ...
%    vn 0.0 0.0 1.0
%
%    f 8//1 9//2 11//3 10//4
%    f 12//5 13//6 15//7 14//8
%    ...
%    f 788//800 806//803 774//807
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string OUTPUT_FILE_NAME, the name of the output file.
%
%    Input, integer NODE_NUM, the number of points.
%
%    Input, integer FACE_NUM, the number of faces.
%
%    Input, integer NORMAL_NUM, the number of normal vectors.
%
%    Input, integer ORDER_MAX, the maximum number of vertices per face.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates of points.
%
%    Input, integer FACE_ORDER(FACE_NUM), the number of vertices per face.
%
%    Input, integer FACE_NODE(ORDER_MAX,FACE_NUM), the nodes making faces.
%
%    Input, real NORMAL_VECTOR(3,NORMAL_NUM), normal vectors.
%
%    Input, integer VERTEX_NORMAL(ORDER_MAX,FACE_NUM), the indices of normal
%    vectors per vertex.
%
  output_file_unit = fopen ( output_file_name, 'wt' );

  if ( output_file_unit < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'OBJ_WRITE - Fatal error!\n' );
    fprintf ( 1, '  Could not open the output file "%s".\n', ...
      output_file_name );
    return
  end

  text_num = 0;

  fprintf ( output_file_unit, '# %s\n', output_file_name );
  fprintf ( output_file_unit, '#  created by OBJ_WRITE.\n' );
  fprintf ( output_file_unit, '\n' );
  fprintf ( output_file_unit, 'g Group001\n' );

  text_num = text_num + 4;
%
%  V: vertex coordinates.
%  For some reason, a fourth "coordinate" may be recommended.
%  What is its meaning?
%
  if ( 0 < node_num )
    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;
  end

  w = 1.0;
  for node = 1 : node_num
    fprintf ( output_file_unit, 'v  %f  %f  %f  %f\n',  node_xyz(1:3,node), w );
    text_num = text_num + 1;
  end
%
%  VN: normal vectors.
%
  if ( 0 < normal_num )

    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;

    for normal = 1 : normal_num
      fprintf ( output_file_unit, 'vn  %f  %f  %f\n', normal_vector(1:3,normal) );
      text_num = text_num + 1;
    end

  end
%
%  F: Faces, specified as a list of triples, one triple for each vertex:
%    vertex index/vertex texture index/vertex normal index
%
  if ( 0 < face_num )
    fprintf ( output_file_unit, '\n' );
    text_num = text_num + 1;
  end

  for face = 1 : face_num

    text = 'f';

    if ( normal_num <= 0 )

      for vertex = 1 : face_order(face)
        fprintf ( output_file_unit, '  %d', face_node(vertex,face) );
      end
      fprintf ( output_file_unit, '\n' );
      text_num = text_num + 1;

    else

      for vertex = 1 : face_order(face)
        fprintf ( output_file_unit, '  %d//%d', ...
          face_node(vertex,face), vertex_normal(vertex,face) );
      end
      fprintf ( output_file_unit, '\n' );
      text_num = text_num + 1;

    end

  end

  fclose ( output_file_unit );
%
%  Report.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OBJ_WRITE:\n' );
  fprintf ( 1, '  Wrote %d text lines to "%s".\n', ...
    text_num, output_file_name );

  return
end
