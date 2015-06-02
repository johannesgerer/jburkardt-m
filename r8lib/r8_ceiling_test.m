function r8_ceiling_test ( )

%*****************************************************************************80
%
%% R8_CEILING_TEST tests R8_CEILING.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_CEILING_TEST\n' );
  fprintf ( 1, '  R8_CEILING rounds a value up.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         X         R8_CEILING(X)\n' );
  fprintf ( 1, '\n' );

  for i = -6 : 6
    rval = i / 5.0;
    ival = r8_ceiling ( rval );
    fprintf ( 1, '  %14f  %8d\n', rval, ival );
  end

  return
end
