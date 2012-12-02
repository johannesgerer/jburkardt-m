function prob_test092 ( )

%*****************************************************************************80
%
%% TEST092 tests R8_CEILING.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST092\n' );
  fprintf ( 1, '  R8_CEILING rounds R8 values up.\n' );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X      R8_CEILING(X)\n' );
  fprintf ( 1, '\n' );

  for i = -6 : 6
    rval = i / 5.0;
    ival = r8_ceiling ( rval );
    fprintf ( 1, '  %14f  %6d\n', rval, ival );
  end

  return
end
