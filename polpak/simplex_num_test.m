function simplex_num_test ( )

%*****************************************************************************80
%
%% SIMPLEX_NUM_TEST tests SIMPLEX_NUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_NUM_TEST\n' );
  fprintf ( 1, '  SIMPLEX_NUM computes the N-th simplex number\n' );
  fprintf ( 1, '  in M dimensions.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      M: 0     1     2     3     4     5\n' );
  fprintf ( 1, '   N\n' );
 
  for n = 0 : 10
    fprintf ( 1, '  %2d', n );
    for m = 0 : 5
      value = simplex_num ( m, n );
      fprintf ( 1, '  %4d', value );
    end
    fprintf ( 1, '\n' );
  end
 
  return
end