function polpak_test0505 ( )

%*****************************************************************************80
%
%% POLPAK_TEST0505 tests KRAWTCHOUK.
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
  test_num = 2;
  p_test = [ 0.25, 0.5 ];
  n = 5;
  m = 5;
  OFFSET = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'POLPAK_TEST0505:\n' );
  fprintf ( 1, '  KRAWTCHOUK evaluates Krawtchouk polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N      P         X          M     K(N,P,X,M)\n' );

  for test = 1 : test_num

    n = 5;
    p = p_test(test);

    fprintf ( 1, '\n' );

    for j = 0 : 5

      x = j / 2.0;

      value = krawtchouk ( n, p, x, m );

      fprintf ( 1, '\n' );

      for i = 0 : n

        fprintf ( 1, '  %8d  %8f  %8f  %8d  %14f\n', i, p, x, m, value(i+OFFSET) );

      end

    end

  end

  return
end
