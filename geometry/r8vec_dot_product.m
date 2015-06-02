function dot = r8vec_dot_product ( dim_num, v1, v2 )

%*****************************************************************************80
%
%% R8VEC_DOT_PRODUCT finds the dot product of a pair of R8VEC's.
%
%  Discussion:
%
%    In FORTRAN, the system routine DOT_PRODUCT should be called
%    directly.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the size of the vectors.
%
%    Input, real V1(DIM_NUM), V2(DIM_NUM), the vectors.
%
%    Output, real DOT, the dot product.
%
  dot = 0.0;
  for i = 1 : dim_num
    dot = dot + v1(i) * v2(i);
  end

  return
end
