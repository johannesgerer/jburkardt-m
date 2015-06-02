function commul_test ( )

%*****************************************************************************80
%
%% COMMUL_TEST tests COMMUL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 November 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMMUL_TEST\n' );
  fprintf ( 1, '  COMMUL computes a multinomial coefficient.\n' );

  n = 8;
  nfactor = 2;
  factor = [ 6; 2 ];
  ncomb = commul ( n, nfactor, factor );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  Number of factors = %d\n', nfactor );
  for i = 1 : nfactor
    fprintf ( 1, '  %2d  %2d\n', i, factor(i) );
  end
  fprintf ( 1, '  Value of coefficient = %6d\n', ncomb );

  n = 8;
  nfactor = 3;
  factor = [ 2; 2; 4 ];
  ncomb = commul ( n, nfactor, factor );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  Number of factors = %d\n', nfactor );
  for i = 1 : nfactor
    fprintf ( 1, '  %2d  %2d\n', i, factor(i) );
  end
  fprintf ( 1, '  Value of coefficient = %6d\n', ncomb );

  n = 13;
  nfactor = 4;
  factor = [ 5; 3; 3; 2 ];
  ncomb = commul ( n, nfactor, factor );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  Number of factors = %d\n', nfactor );
  for i = 1 : nfactor
    fprintf ( 1, '  %2d  %2d\n', i, factor(i) );
  end
  fprintf ( 1, '  Value of coefficient = %6d\n', ncomb );

  return
end
