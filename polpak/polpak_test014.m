function polpak_test014 ( )

%*****************************************************************************80
%
%% TEST014 tests BPAB.
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
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST014\n' );
  fprintf ( 1, '  BPAB evaluates Bernstein polynomials.\n' );
  fprintf ( 1, '\n' );

  x = 0.3;
  a = 0.0;
  b = 1.0;
  bern = bpab ( n, x, a, b );
 
  fprintf ( 1, '  The Bernstein polynomials of degree %d\n', n );
  fprintf ( 1, '  based on the interval from %f\n', a );
  fprintf ( 1, '  to %f\n', b );
  fprintf ( 1, '  evaluated at X = %f\n', x );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   I        Bern(I,X)\n' );
  fprintf ( 1, '\n' );
  
  for i = 0 : n
    fprintf ( 1, '  %2d  %12f\n', i, bern(i+1) );
  end

  return
end
