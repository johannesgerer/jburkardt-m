function subset_test020 ( )

%*****************************************************************************80
%
%% TEST020 tests R8_TO_CFRAC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST020\n' );
  fprintf ( 1, '  R8_TO_CFRAC converts a double precision number to a\n' );
  fprintf ( 1, '  a sequence of continued fraction convergents.\n' );

  r = 2.0 * pi;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the real number R = %f\n', r );

  [ a, p, q ] = r8_to_cfrac ( r, n );

  fprintf ( 1, '\n' );

  for i = 0 : n
    temp = p(i+2) / q(i+2);
    err = r - temp;
    fprintf ( 1, '  %10d  %10d  %10d  %12f  %12e\n', a(i+1), p(i+2), q(i+2), ...
      temp, err );
  end

  return
end
