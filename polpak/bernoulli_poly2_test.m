function bernoulli_poly2_test ( )

%*****************************************************************************80
%
%% BERNOULLI_POLY2_TEST tests BERNOULLI_POLY2.
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
  n = 15;
  x = 0.2;
 
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNOULLI_POLY2_TEST\n' );
  fprintf ( 1, '  BERNOULLI_POLY2 evaluates Bernoulli polynomials.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I          BX\n' );
  fprintf ( 1, '\n' );
 
  for i = 1 : n
    bx = bernoulli_poly2 ( i, x );
    fprintf ( 1, '  %2d  %14f\n', i, bx )
  end

  return
end
