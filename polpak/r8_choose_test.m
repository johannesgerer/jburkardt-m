function r8_choose_test ( )

%*****************************************************************************80
%
%% R8_CHOOSE_TEST tests R8_CHOOSE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 July 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_CHOOSE_TEST\n' );
  fprintf ( 1, '  R8_CHOOSE evaluates C(N,K).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '         N         K       CNK\n' );
 
  for n = 0 : 5
    fprintf ( 1, '\n' );
    for k = 0 : n
      cnk = r8_choose ( n, k );
      fprintf ( 1, '  %8d  %8d  %14.6g\n', n, k, cnk );
    end
  end
 
  return
end
