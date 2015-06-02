function i4_is_prime_test ( )

%*****************************************************************************80
%
%% I4_IS_PRIME_TEST tests I4_IS_PRIME.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_IS_PRIME_TEST\n' );
  fprintf ( 1, '  I4_IS_PRIME reports whether an integer is prime.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I     I4_IS_PRIME(I)\n' );
  fprintf ( 1, '\n' );

  for i = -2 : 25
    fprintf ( 1, '  %6d  %1d\n', i, i4_is_prime ( i ) );
  end

  return
end
