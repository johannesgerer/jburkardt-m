function subset_test0815 ( )

%*****************************************************************************80
%
%% TEST0815 tests MULTIPERM_NEXT.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0815\n' );
  fprintf ( 1, '  MULTIPERM_NEXT computes multipermutations in\n' );
  fprintf ( 1, '  lexical order.\n' );
  fprintf ( 1, '\n' );

  tally = 0;
  a = [ 1, 2, 2, 3, 3, 3 ];
  n = 6;
  more = 1;
  
  while ( more )
      
    tally = tally + 1;
    
    fprintf ( 1, '  %4d    ', tally );
    for i = 1 : n
      fprintf ( 1, '  %2d', a(i) );
    end
    fprintf ( 1, '\n' );

    [ a, more ] = multiperm_next ( n, a );
            
  end
  
  return
end
