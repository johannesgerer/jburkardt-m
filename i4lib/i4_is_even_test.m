function i4_is_even_test ( )

%*****************************************************************************80
%
%% I4_IS_EVEN_TEST tests I4_IS_EVEN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_IS_EVEN_TEST\n' );
  fprintf ( 1, '  I4_IS_EVEN reports whether an I4 is even.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I     I4_IS_EVEN(I)\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 25
    fprintf ( 1, '  %6d  %1d\n', i, i4_is_even ( i ) );
  end

  return
end
