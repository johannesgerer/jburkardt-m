function quadrule_test345 ( )

%*****************************************************************************80
%
%% TEST345 tests LOBATTO_COMPUTE and LOBATTO_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST345\n' );
  fprintf ( 1, '  LOBATTO_COMPUTE computes a Lobatto rule;\n' );
  fprintf ( 1, '  LOBATTO_SET sets a rule from a table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '         I      X1            X2            W1            W2\n' );

  for n = 4 : 3 : 12

    [ x1, w1 ] = lobatto_compute ( n );
    [ x2, w2 ] = lobatto_set ( n );

    fprintf ( 1, '\n' );
    for i = 1 : n
      fprintf ( 1, '  %8d  %12f  %12f  %12f  %12f\n', ...
        i, x1(i), x2(i), w1(i), w2(i) );
    end

    w1 = [];
    w2 = [];
    x1 = [];
    x2 = [];

  end

  return
end
