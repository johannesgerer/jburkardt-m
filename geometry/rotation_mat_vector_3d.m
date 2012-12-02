function w = rotation_mat_vector_3d ( a, v )

%*****************************************************************************80
%
%% ROTATION_MAT_VECTOR_3D applies a marix rotation to a vector in 3d.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3,3), the matrix defining the rotation.
%
%    Input, real V(3), the vector to be rotated.
%
%    Output, real W(3), the rotated vector.
%
  dim_num = 3;
%
%  We want V to be a ROW vector.
%  If MATLAB idiocies make it look like a COLUMN vector, please fix that.
%
  if ( size ( v, 2 ) == 1 )
    v = v';
  end
  
  w(1:dim_num) = a(1:dim_num,1:dim_num) * v(1:dim_num)';

  return
end
