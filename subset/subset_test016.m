function subset_test016 ( )

%*****************************************************************************80
%
%% TEST016 tests COMP_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST016\n' );
  fprintf ( 1, '  COMP_NEXT generates compositions.\n' );
  fprintf ( 1, '\n' );

  n = 6;
  k = 3;
  a = [];
  index = 0;
  more = 0;
  h = 0;
  t = 0;
  
  while ( 1 )

    [ a, more, h, t ] = comp_next ( n, k, a, more, h, t );
    
    index = index + 1;
    fprintf ( 1, '  %4d  ', index );
    for i = 1 : k
      fprintf ( 1, '%2d  ', a(i) );
    end
    fprintf ( 1, '\n' );

    if ( ~more )
      break
    end

  end

  return
end
