function subset_test159 ( )

%*****************************************************************************80
%
%% TEST159 tests YTB_RANDOM.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST159\n' );
  fprintf ( 1, '  YTB_RANDOM generates a random Young tableau\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for i = 1 : 5
 
    [ a, seed ] = ytb_random ( n, lambda, seed );

    ytb_print ( n, a, ' ' );
 
  end

  return
end
