function subset_test048 ( )

%*****************************************************************************80
%
%% TEST048 tests INDEX_NEXT0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 3;
  hi = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST048\n' );
  fprintf ( 1, '  INDEX_NEXT0 generates all indices of an\n' );
  fprintf ( 1, '  array of given shape, with\n' );
  fprintf ( 1, '  lower limit 1 and given upper limit.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of index entries = %d\n', n );
  fprintf ( 1, '  Coordinate maximum HI =   %d\n', hi );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index arrays:\n' );
  fprintf ( 1, '\n' );

  a = [];
  more = 0;

  while ( 1 )

    [ a, more ] = index_next0 ( n, hi, a, more );

    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
