function subset_test014 ( )

%*****************************************************************************80
%
%% TEST014 tests R8_CHOOSE.
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
  fprintf ( 1, 'TEST014\n' );
  fprintf ( 1, '  R8_CHOOSE evaluates C(N,K).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N     K    CNK\n' );
  fprintf ( 1, '\n' );

  for n = 0 : 4
    for k = 0 : n
      cnk = r8_choose ( n, k );
      fprintf ( 1, '  %6d  %6d  %12f\n', n, k, cnk );
    end
  end

  return
end
