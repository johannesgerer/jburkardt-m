function lagrange_nd_test02 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST02 tests MONO_TOTAL_ENUM.
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
  fprintf ( 1, 'LAGRANGE_ND_TEST02\n' );
  fprintf ( 1, '  MONO_TOTAL_ENUM can enumerate the number of monomials\n' );
  fprintf ( 1, '  in D variables, of total degree N.\n' );

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
      v = mono_total_enum ( d, n );
      fprintf ( 1, '  %4d', v );
    end
    fprintf ( 1, '\n' );
  end

  return
end
      
