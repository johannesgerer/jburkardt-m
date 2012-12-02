function subset_test116 ( )

%*****************************************************************************80
%
%% TEST116 tests R8_TO_CFRAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST116\n' );
  fprintf ( 1, '  R8_TO_CFRAC converts a real number to a sequence\n' );
  fprintf ( 1, '  of continued fraction convergents.\n' );

  r = 2.0 * pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the real number R = %f\n', r );

  [ a, p, q ] = r8_to_cfrac ( r, n );

  fprintf ( 1, '\n' );

  for i = 0 : n
    temp = p(i+2) / q(i+2);
    fprintf ( 1, '  %6d  %6d  %6d  %12f  %12f\n', ...
      a(i+1), p(i+2), q(i+2), temp, r - temp );
  end

  return
end
