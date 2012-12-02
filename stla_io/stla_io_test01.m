function test01 ( input_file_name )

%*****************************************************************************80
%
%% TEST01 tests STLA_CHECK.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2005
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  STLA_CHECK makes some simple checks on a file.\n' );

  fprintf ( 1, '\n' );
  if ( stla_check ( input_file_name ) )
    fprintf ( 1, ...
      '  The file "%s" seems to be a legal ASCII STL file.\n', ...
      input_file_name ); 
  else
    fprintf ( 1, ...
      '  The file "%s" does NOT seem to be a legal ASCII STL file.\n', ...
      input_file_name );
  end

  return
end
