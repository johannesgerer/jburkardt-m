function subset_test158 ( )

%*****************************************************************************80
%
%% TEST158 tests YTB_NEXT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 6;
  lambda = [ 3, 2, 1, 0, 0, 0 ];
  a(1:n) = 0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST158\n' );
  fprintf ( 1, '  YTB_NEXT generates Young tableaus.\n' );
  fprintf ( 1, '\n' );
  more = 0;
 
  while ( 1 )
 
    [ lambda, a, more ] = ytb_next ( n, lambda, a, more );
 
    ytb_print ( n, a, ' ' );
 
    if ( ~more )
      break
    end

  end

  return
end
