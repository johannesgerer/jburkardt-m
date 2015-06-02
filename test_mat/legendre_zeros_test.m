function legendre_zeros_test ( )

%*****************************************************************************80
%
%% LEGENDRE_ZEROS_TEST tests LEGENDRE_ZEROS.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_ZEROS_TEST:\n' );
  fprintf ( 1, '  LEGENDRE_ZEROS computes the zeros of the N-th Legendre\n' );
  fprintf ( 1, '  polynomial.\n' );

  for n = 1 : 7
    l = legendre_zeros ( n );
    r8vec_print ( n, l, '  Legendre zeros' );
  end

  return
end