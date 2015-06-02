function ncc_set_test ( )

%*****************************************************************************80
%
%% NCC_SET_TEST tests NCC_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NCC_SET_TEST\n' );
  fprintf ( 1, '  NCC_SET sets up a Newton-Cotes Closed quadrature rule;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index       X             W\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10

    [ x, w ] = ncc_set ( n );

    fprintf ( 1, '\n' );

    for i = 1 : n
      fprintf ( 1, '  %2d  %12g  %12g\n', i, x(i), w(i) );
    end

  end

  return
end
