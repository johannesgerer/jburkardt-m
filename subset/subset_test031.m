function subset_test031 ( )

%*****************************************************************************80
%
%% TEST031 tests GRAY_NEXT.
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
  n = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST031\n' );
  fprintf ( 1, '  GRAY_NEXT returns the index of the single item\n' );
  fprintf ( 1, '  to be changed in order to get the next Gray code.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   K  Change  Gray Code\n' );
  fprintf ( 1, '\n' );

  change = -n;
  k = 0;

  while ( 1 )

    change = gray_next ( n, change );

    if ( change == -n )
      break
    elseif ( change == 0 )
      a(1:n) = 0;
    else
      a(abs(change)) = 1 - a(abs(change));
    end

    fprintf ( 1, '  %2d  %6d  ', k, change );
    for i = 1 : n
      fprintf ( 1, '%d', a(i) );
    end
    fprintf ( 1, '\n' );

    k = k + 1;
    
  end

  return
end
