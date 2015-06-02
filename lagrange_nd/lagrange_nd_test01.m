function lagrange_nd_test01 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST01 tests MONO_BETWEEN_ENUM.
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
  fprintf ( 1, 'LAGRANGE_ND_TEST01\n' );
  fprintf ( 1, '  MONO_BETWEEN_ENUM can enumerate the number of monomials\n' );
  fprintf ( 1, '  in D variables, of total degree between N1 and N2.\n' );

  d = 3;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Using spatial dimension D = %d\n', d );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N2:' );
  for n2 = 0 : 8
    fprintf ( 1, '  %4d', n2 );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N1 +------------------------------------------------------\n' );
  for n1 = 0 : 8
    fprintf ( 1, '  %2d |', n1 );
    for n2 = 0 : 8
      v = mono_between_enum ( d, n1, n2 );
      fprintf ( 1, '  %4d', v );
    end
    fprintf ( 1, '\n' );
  end

  return
end
      
