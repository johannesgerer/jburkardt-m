function trinomial_test ( )

%*****************************************************************************80
%
%% TRINOMIAL_TEST tests TRINOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRINOMIAL_TEST\n' );
  fprintf ( 1, '  TRINOMIAL evaluates the trinomial coefficient:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T(I,J,K) = (I+J+K)! / I! / J! / K!\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I     J     K    T(I,J,K)\n' );
  fprintf ( 1, '\n' );
 
  for k = 0 : 4
    for j = 0 : 4
      for i = 0 : 4
        t = trinomial ( i, j, k );
        fprintf ( 1, '  %4d  %4d  %4d  %8d\n', i, j, k, t );
      end
    end
  end
 
  return
end