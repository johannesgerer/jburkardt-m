function i4_max_test ( )

%*****************************************************************************80
%
%% I4_MAX_TEST tests I4_MAX.
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
  fprintf ( 1, 'I4_MAX_TEST\n' );
  fprintf ( 1, '  I4_MAX returns the maximum of two I4''s.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '       A       B      C=I4_MAX(A,B)\n' );
  fprintf ( 1, '\n' );

  i4_lo = -100.0;
  i4_hi = +100.0;
  seed = 123456789;
  for i = 1 : 10
    [ a, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
    [ b, seed ] = i4_uniform_ab ( i4_lo, i4_hi, seed );
    c = i4_max ( a, b );
    fprintf ( 1, '  %8d  %8d  %8d\n', a, b, c );
  end

  return
end
