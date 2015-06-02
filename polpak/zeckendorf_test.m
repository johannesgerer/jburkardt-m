function zeckendorf_test ( )

%*****************************************************************************80
%
%% ZECKENDORF_TEST tests ZECKENDORF.
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
  fprintf ( 1, 'ZECKENDORF_TEST\n' );
  fprintf ( 1, '  ZECKENDORF computes the Zeckendorf decomposition of\n' );
  fprintf ( 1, '  an integer N into nonconsecutive Fibonacci numbers.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '   N Sum M Parts\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 100

    [ m, i_list, f_list ] = zeckendorf ( n );

    fprintf ( 1, '  %3d', n );
    for j = 1 : m
      fprintf ( 1, '  %4d', f_list(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
