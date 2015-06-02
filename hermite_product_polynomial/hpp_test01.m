function hpp_test01 ( )

%*****************************************************************************80
%
%% HPP_TEST01 tests routines for the GRLEX ordering of compositions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST01:\n' );
  fprintf ( 1, '  COMP_NEXT_GRLEX is given a composition, and computes the \n' );
  fprintf ( 1, '  next composition in grlex order.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank   Sum   Components\n' );

  k = 2;
  x_sum_old = -1;
  rank = 1;
  x = zeros ( 2, 1 );

  while ( 1 )

    x_sum = sum ( x(1:k) );
    if ( x_sum_old < x_sum )
      x_sum_old = x_sum;
      fprintf ( 1, '\n' );
    end

    fprintf ( 1, '  %4d  %4d:', rank, x_sum );
    for i = 1 : k
      fprintf ( 1, '%4d', x(i) );
    end
    fprintf ( 1, '\n' );

    if ( 20 <= rank )
      break
    end

    x = comp_next_grlex ( k, x );
    rank = rank + 1;

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  COMP_UNRANK_GRLEX is given a rank and returns the\n' );
  fprintf ( 1, '  corresponding set of multinomial exponents.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank   Sum   Components\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  for test = 1 : 5
    [ rank, seed ] = i4_uniform_ab ( 1, 20, seed );
    x = comp_unrank_grlex ( k, rank );
    x_sum = sum ( x(1:k) );
    fprintf ( 1, '  %4d  %4d:', rank, x_sum );
    for i = 1 : k
      fprintf ( 1, '%4d', x(i) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  COMP_RANDOM_GRLEX randomly selects a composition\n' );
  fprintf ( 1, '  between given lower and upper ranks.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank   Sum   Components\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;
  rank1 = 5;
  rank2 = 20;

  for test = 1 : 5
    [ x, rank, seed ] = comp_random_grlex ( k, rank1, rank2, seed );
    x_sum = sum ( x(1:k) );
    fprintf ( 1, '  %4d  %4d:', rank, x_sum );
    for i = 1 : k
      fprintf ( 1, '%4d', x(i) );
    end
    fprintf ( 1, '\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  COMP_RANK_GRLEX returns the rank of a given composition.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Rank   Sum   Components\n' );
  fprintf ( 1, '\n' );

  k = 2;
  x = [ 4, 0 ];
  rank = comp_rank_grlex ( k, x );
  x_sum = sum ( x(1:k) );
  fprintf ( 1, '  %4d  %4d:', rank, x_sum );
  for i = 1 : k
    fprintf ( 1, '%4d', x(i) );
  end
  fprintf ( 1, '\n' );

  k = 2;
  x = [ 11, 5 ];
  rank = comp_rank_grlex ( k, x );
  x_sum = sum ( x(1:k) );
  fprintf ( 1, '  %4d  %4d:', rank, x_sum );
  for i = 1 : k
    fprintf ( 1, '%4d', x(i) );
  end
  fprintf ( 1, '\n' );

  return
end
