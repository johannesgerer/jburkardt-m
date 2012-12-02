function value = r8vec_length ( dim_num, x )

%*****************************************************************************80
%
%% R8VEC_LENGTH returns the Euclidean length of an R8VEC
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real X(DIM_NUM), the vector.
%
%    Output, real VALUE, the Euclidean length of the vector.
%
  value = sqrt ( sum ( ( x(1:dim_num) ).^2 ) );

  return
end
