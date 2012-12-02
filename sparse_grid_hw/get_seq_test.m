function get_seq_test ( )

%*****************************************************************************80
%
%% GET_SEQ_TEST tests GET_SEQ.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GET_SEQ_TEST\n' );
  fprintf ( 1, '  GET_SEQ returns all D-dimensional vectors that sum to NORM.\n' );

  d = 3;
  norm = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  D = %d\n', d )
  fprintf ( 1, '  NORM = %d\n', norm );
  fs = get_seq ( d, norm );
  [ m, n ] = size ( fs );
  k = 0;
  for i = 1 : m
    k = k + 1;
    fprintf ( 1, '  %2d:  ', k );
    for j = 1 : d
      fprintf ( 1, '  %2d', fs(i,j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
