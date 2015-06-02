function clenshaw_curtis_set_test ( )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_SET_TEST tests CLENSHAW_CURTIS_SET.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CLENSHAW_CURTIS_SET_TEST\n' );
  fprintf ( 1, '  CLENSHAW_CURTIS_SET sets up a Clenshaw-Curtis rule;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimate the integral of sqrt(abs(x)) over [-1,+1].\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N           Estimate             Error\n' );
  fprintf ( 1, '\n' );

  exact = 4.0 / 3.0;

  for n = 1 : 10

    [ x, w ] = clenshaw_curtis_set ( n );

    v(1:n,1) = sqrt ( abs ( x(1:n,1) ) );

    q = w' * v;
    e = abs ( q - exact );

    fprintf ( 1, '  %2d  %24.16g  %14.6e\n', n, q, e );

  end

  return
end
