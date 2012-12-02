function quadrule_test404 ( )

%*****************************************************************************80
%
%% TEST404 tests RADAU_COMPUTE and RADAU_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 February 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST404\n' );
  fprintf ( 1, '  RADAU_COMPUTE computes a Radau rule;\n' );
  fprintf ( 1, '  RADAU_SET sets a rule from a table.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '         I      X1            X2            W1            W2\n' );

  for n = 4 : 3 : 12

    [ x1, w1 ] = radau_compute ( n );
    [ x2, w2 ] = radau_set ( n );

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
