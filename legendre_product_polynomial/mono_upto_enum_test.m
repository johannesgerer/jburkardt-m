function monomial_test03 ( )

%*****************************************************************************80
%
%% MONOMIAL_TEST03 tests MONO_UPTO_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 September 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'MONOMIAL_TEST03\n' );
  fprintf ( 1, '  MONO_UPTO_ENUM can enumerate the number of monomials\n' );
  fprintf ( 1, '  in M variables, of total degree 0 up to N.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    N:' );
  for n = 0 : 8
    fprintf ( 1, '  %4d', n );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '   M +------------------------------------------------------\n' );
  for m = 1 : 8
    fprintf ( 1, '  %2d |', m );
    for n = 0 : 8
      v = mono_upto_enum ( m, n );
      fprintf ( 1, ' %5d', v );
    end
    fprintf ( 1, '\n' );
  end

  return
end
