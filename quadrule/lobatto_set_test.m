function lobatto_set_test ( )

%*****************************************************************************80
%
%% LOBATTO_SET_TEST tests LOBATTO_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_SET_TEST\n' );
  fprintf ( 1, '  LOBATTO_SET sets a Lobatto rule;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         I      X             W\n' );

  for n = 4 : 3 : 12

    [ x, w ] = lobatto_set ( n );

    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %8d  %12f  %12f\n', i, x(i), w(i) );
    end

  end

  return
end
