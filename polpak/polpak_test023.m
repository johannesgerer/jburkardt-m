function polpak_test023 ( )

%*****************************************************************************80
%
%% TEST023 tests I4_CHOOSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST023\n' );
  fprintf ( 1, '  I4_CHOOSE evaluates C(N,K).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K    CNK\n' );
  fprintf ( 1, '\n' );
 
  for n = 0 : 4
    for k = 0 : n
      cnk = i4_choose ( n, k );
      fprintf ( 1, '  %4d  %4d  %4d\n', n, k, cnk );
    end
  end

  return
end
