function lagrange_nd_test03 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST03 tests MONO_UPTO_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST03\n' );
  fprintf ( 1, '  MONO_UPTO_ENUM can enumerate the number of monomials\n' );
  fprintf ( 1, '  in D variables, of total degree 0 up to N.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    N:' );
  for n = 0 : 8
    fprintf ( 1, '  %4d', n );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '   D +------------------------------------------------------\n' );
  for d = 1 : 8
    fprintf ( 1, '  %2d |', d );
    for n = 0 : 8
      v = mono_upto_enum ( d, n );
      fprintf ( 1, ' %5d', v );
    end
    fprintf ( 1, '\n' );
  end

  return
end
