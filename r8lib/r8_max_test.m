function r8_max_test ( )

%*****************************************************************************80
%
%% R8_MAX_TEST tests R8_MAX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_MAX_TEST\n' );
  fprintf ( 1, '  R8_MAX returns the maximum of two R8''s.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       A       B      C=R8_MAX(A,B)\n' );
  fprintf ( 1, '\n' );

  r8_lo = -5.0;
  r8_hi = +5.0;
  seed = 123456789;
  for i = 1 : 10
    [ a, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    [ b, seed ] = r8_uniform_ab ( r8_lo, r8_hi, seed );
    c = r8_max ( a, b );
    fprintf ( 1, '  %8.4f  %8.4f  %8.4f\n', a, b, c );
  end

  return
end
