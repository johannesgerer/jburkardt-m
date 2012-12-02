function subset_test036 ( )

%*****************************************************************************80
%
%% TEST036 tests I4_TO_VAN_DER_CORPUT.
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
  n_prime = 5;
  n_test = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST036\n' );
  fprintf ( 1, '  I4_TO_VAN_DER_CORPUT computes the elements \n' );
  fprintf ( 1, '  of a van der Corput sequence.\n' );
  fprintf ( 1, '  The sequence depends on the prime numbers used \n' );
  fprintf ( 1, '  as a base.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'Bases:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for j = 1 : n_prime
    fprintf ( 1, '        %6d', prime ( j ) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n_test
    for j = 1 : n_prime
      p = prime(j);
      h(j) = i4_to_van_der_corput ( i, p );
    end
    fprintf ( 1, '  %2d', i );
    for j = 1 : n_prime
      fprintf ( 1, '  %12f', h(j) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
