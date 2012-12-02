function polpak_test0623 ( )

%*****************************************************************************80
%
%% POLPAK_TEST0623 tests MEIXNER.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2009
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;
  beta_test = [ 0.5, 1.0, 2.0 ];
  c_test = [ 0.125, 0.25, 0.5 ];
  n = 5;
  OFFSET = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST0623:\n' );
  fprintf ( 1, '  MEIXNER evaluates Meixner polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       N      BETA         C         X        M(N,BETA,C,X)\n' );

  for test = 1 : test_num

    n = 5;
    beta = beta_test(test);
    c = c_test(test);

    for j = 0 : 5

      x = j / 2.0;

      value = meixner ( n, beta, c, x );

      fprintf ( 1, '\n' );

      for i = 0 : n

        fprintf ( 1, '  %8d  %8f  %8f  %8f  %14f\n', i, beta, c, x, value(i+OFFSET) );

      end

    end

  end

  return
end
