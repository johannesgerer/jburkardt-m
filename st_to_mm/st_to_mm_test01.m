function st_to_mm_test01 ( )

%*****************************************************************************80
%
%% ST_TO_MM_TEST01 tests ST_TO_MM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ST_TO_MM_TEST01\n' );
  fprintf ( 1, '  Use ST_TO_MM to read an ST file,\n' );
  fprintf ( 1, '  and write an equivalent MM file.\n' );

  input_file = 'st_to_mm_test01.st';
  output_file = 'st_to_mm_test01.mm';

  st_to_mm ( input_file, output_file );

  return
end
