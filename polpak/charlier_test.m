function charlier_test ( )

%*****************************************************************************80
%
%% CHARLIER_TEST tests CHARLIER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;
  a_test = [ 0.25, 0.5, 1.0, 2.0, 10.0 ];
  n = 5;
  OFFSET = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHARLIER_TEST:\n' );
  fprintf ( 1, '  CHARLIER evaluates Charlier polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N      A         X        P(N,A,X)\n' );

  for test = 1 : test_num

    n = 5;
    a = a_test(test);

    for j = 0 : 5

      x = j / 2.0;

      value = charlier ( n, a, x );

      fprintf ( 1, '\n' );

      for i = 0 : n

        fprintf ( 1, '  %8d  %8f  %8f  %14f\n', i, a, x, value(i+OFFSET) );

      end

    end

  end

  return
end
