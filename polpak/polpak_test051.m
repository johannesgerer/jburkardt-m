function polpak_test051 ( )

%*****************************************************************************80
%
%% TEST051 tests LAGUERRE_ASSOCIATED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  i_test = 6;
  n = 6;
  m_test = [ 0, 0, 1, 2, 3, 1 ];
  x_test = [ 0.0, 1.0, 0.0, 0.5, 0.5, 0.5 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST051\n' );
  fprintf ( 1, '  LAGUERRE_ASSOCIATED evaluates the associated Laguerre\n' );
  fprintf ( 1, '  polynomials.\n' );

  for i = 1 : i_test

    m = m_test(i);
    x = x_test(i);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Table of L(N,M)(X) for\n' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  N(max) = %d\n', n );
    fprintf ( 1, '  M      = %d\n', m );
    fprintf ( 1, '  X =      %f\n', x );
    fprintf ( 1, '\n' );
 
    c = laguerre_associated ( n, m, x );
 
    for j = 0 : n
      fprintf ( 1, '  %4d  %12f\n', j, c(j+1) );
    end
 
  end

  return
end
