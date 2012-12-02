function v = vector_unit_nd ( dim_num, v )

%*****************************************************************************80
%
%% VECTOR_UNIT_ND normalizes a vector in ND.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of entries in the vector.
%
%    Input, real V(DIM_NUM), the vector to be normalized.
%
%    Output, real V(DIM_NUM), the normalized vector.
%
  norm = sqrt ( sum ( v(1:dim_num).^2 ) );

  if ( norm ~= 0.0 )
    v(1:dim_num) = v(1:dim_num) / norm;
  end

  return
end
