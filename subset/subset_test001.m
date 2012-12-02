function subset_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests ASM_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2009
%
%  Author:
%
%    John Burkardt
%
  max_n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  ASM_ENUM returns the number of alternating sign\n' );
  fprintf ( 1, '  matrices of a given order.\n' );

  fprintf ( 1, '\n' );
  for n = 0 : max_n
    asm_num = asm_enum ( n );
    fprintf ( 1, '  %2d  %8d\n', n, asm_num );
  end

  return
end
