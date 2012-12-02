function chrpak_test105 ( )

%*****************************************************************************80
%
%% TEST105 tests S_INC_C.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST105\n' );
  fprintf ( 1, '  S_INC_C can "increment" the characters in a string.\n' );

  s = 'Tax';
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting string: "%s"\n', s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Incremented forms:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    s = s_inc_c ( s );
    fprintf ( 1, '  "%s"\n', s );
  end

  s = 'aB34c* 8zY';

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Starting string: "%s"\n', s );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Incremented forms:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5
    s = s_inc_c ( s );
    fprintf ( 1, '  "%s"\n', s );
  end

  return
end
