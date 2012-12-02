function obj_normal_vector_print ( normal_num, normal_vector )

%*****************************************************************************80
%
%% OBJ_NORMAL_VECTOR_PRINT prints the normal vectors.
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
%    Input, integer NORMAL_NUM, the number of normal vectors.
%
%    Input, real NORMAL_VECTOR(3,NORMAL_NUM), the normal vectors.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normal Vectors:\n' );
  fprintf ( 1, '\n' );

  for normal = 1 : normal_num

    fprintf ( 1, '  %8d  %14f  %14f  %14f\n', ...
      normal,  normal_vector(1:3,normal) );

  end

  return
end
