function lagrange_nd_test04 ( )

%*****************************************************************************80
%
%% LAGRANGE_ND_TEST04 tests MONO_BETWEEN_NEXT_GRLEX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_ND_TEST04\n' );
  fprintf ( 1, '  MONO_BETWEEN_NEXT_GRLEX can list the monomials\n' );
  fprintf ( 1, '  in D variables, of total degree N between N1 and N2,\n' );
  fprintf ( 1, '  one at a time.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We start the process with (0,0,...,0,N1).\n' );
  fprintf ( 1, '  The process ends with (N2,0,...,0,0)\n' );

  n1 = 2;
  n2 = 3;
  d = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Let D =  %d\n', d );
  fprintf ( 1, '      N1 = %d\n', n1 );
  fprintf ( 1, '      N2 = %d\n', n2 );
  fprintf ( 1, '\n' );

  x = [ 0, 0, n1 ];
  j = 1;

  while ( 1 )

    fprintf ( 1, '  %2d:', j );
    for i = 1 : d
      fprintf ( 1, '  %1d', x(i) );
    end
    fprintf ( 1, '\n' );

    if ( x(1) == n2 )
      break
    end

    x = mono_between_next_grlex ( d, n1, n2, x );
    j = j + 1;

  end

  return
end
