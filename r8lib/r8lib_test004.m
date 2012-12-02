function r8lib_test004 ( )

%*****************************************************************************80
%
%% TEST004 tests R8_CEILING.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST004\n' );
  fprintf ( 1, '  R8_CEILING rounds a value up.\n' );
  fprintf ( 1, '\n' );

  for i = -6 : 6
    rval = i / 5.0;
    ival = r8_ceiling ( rval );
    fprintf ( 1, '  %14f  %8d\n', rval, ival );
  end

  return
end
