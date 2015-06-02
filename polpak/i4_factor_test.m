function i4_factor_test ( )

%*****************************************************************************80
%
%% I4_FACTOR_TEST tests I4_FACTOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 February 2015
%
%  Author:
%
%    John Burkardt
%
  n_test = [ 60, 664048, 8466763 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4_FACTOR_TEST:\n' );
  fprintf ( 1, '  I4_FACTOR tries to factor an I4.\n' );

  for i = 1 : 3
    n = n_test(i);
    [ nfactor, factor, power, nleft ] = i4_factor ( n );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Factors of N = %d\n', n );
    for j = 1 : nfactor
      fprintf ( 1, '    %d^%d\n', factor(j), power(j) );
    end
    if ( nleft ~= 1 )
      fprintf ( 1, '  Unresolved factor NLEFT = %d\n', nleft );
    end
  end

  return
end
