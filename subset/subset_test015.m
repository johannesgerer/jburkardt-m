function subset_test015 ( )

%*****************************************************************************80
%
%% TEST015 tests I4_CHOOSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST015\n' );
  fprintf ( 1, '  I4_CHOOSE evaluates C(N,K).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K    CNK\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 4
    for k = 0 : n
      cnk = i4_choose ( n, k );
      fprintf ( 1, '  %6d  %6d  %6d\n', n, k, cnk );
    end
  end

  return
end
