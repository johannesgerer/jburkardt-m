function r8vec_mask_print ( n, a, mask_num, mask, title )

%*****************************************************************************80
%
%% R8VEC_MASK_PRINT prints a masked R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of components of the vector.
%
%    Input, real A(N), the vector to be printed.
%
%    Input, integer MASK_NUM, the number of masked elements.
%
%    Input, integer MASK(MASK_NUM), the indices of the vector to be printed.
%
%    Input, string TITLE, a title.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Masked vector printout:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );

  for i = 1 : mask_num
    fprintf ( 1, '  %6d: %6d  %14g\n', i, mask(i), a(mask(i)) );
  end

  return
end
