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
%    Input, real V1(2), V2(2), the vectors.
%
%    Output, real DOT, the dot product.
%
  dot = v1(1:dim_num) * v2(1:dim_num)';

  return
end
