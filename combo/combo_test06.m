function combo_test06 ( )

%*****************************************************************************80
%
%% COMBO_TEST06 tests DIST_ENUM and DIST_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 January 2011
%
%  Author:
%
%    John Burkardt
%
  k = 3;
  m = 5;

  num_dist = dist_enum ( k, m );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMBO_TEST06\n' );
  fprintf ( 1, '  For a distribution of M indistinguishable\n' );
  fprintf ( 1, '  objects among K distinguishable slots:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  DIST_ENUM enumerates them;\n' );
  fprintf ( 1, '  DIST_NEXT produces the "next" one.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of:\n' );
  fprintf ( 1, '    indistinguishable objects = %d\n', m );
  fprintf ( 1, '    distinguishable slots =     %d\n', k );
  fprintf ( 1, '    distributions is            %d\n', num_dist );
  fprintf ( 1, '\n' );

  more = 0;
  q = [];

  idist = 0;

  while ( 1 )

    [ q, more ] = dist_next ( k, m, q, more );

    if ( ~more )
      break
    end

    idist = idist + 1;
    fprintf ( 1, '    %5d: ', idist );
    for i = 1 : k
      fprintf ( 1, '%5d', q(i) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
